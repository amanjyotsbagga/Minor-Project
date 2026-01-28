package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.CitizenDAO;
import model.entity.Citizen;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;

/**
 * Servlet implementation class VerifyOtp
 */
@WebServlet("/VerifyOtp")
public class VerifyOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VerifyOtp() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("i am in the VerifyOtpServlet");
		String submittedOtp = request.getParameter("otp");
		
		// 1. PRIORITIZE FORM DATA (Most reliable and survives session expiry)
        String email = request.getParameter("email"); 
        
        // 2. FALLBACK TO SESSION (Only if the form data was missing)
        HttpSession session = request.getSession(false);
        if (email == null && session != null) {
            email = (String) session.getAttribute("emailForVerification");
            // Note: If we use this session email, we should probably remove the session attribute now.
        }

        if (email == null) {
            // Session expired AND form submission failed (user flow is broken)
            String error = URLEncoder.encode("Your verification session has expired. Please register again.", "UTF-8");
            response.sendRedirect(request.getContextPath() + "/citizen/login.jsp?error=" + error);
            return;
        }
        CitizenDAO citizenDao = new CitizenDAO();
        Citizen citizen = citizenDao.findByEmail(email);

        if (citizen == null) {
        	// User found in session but not in DB (critical error)
        	String error = URLEncoder.encode("A system error occurred. User profile missing.", "UTF-8");
		    response.sendRedirect(request.getContextPath() + "/citizen/login.jsp?error=" + error);
            return;
        }
        
        // If already verified, just log them in
        if (citizen.getIsVerified()) {
            session.setAttribute("citizen", citizen); // Use 'citizen' for consistency
            session.removeAttribute("emailForVerification");
            response.sendRedirect(request.getContextPath() + "/citizen/dashboard.jsp");
            return;
        }
        
        String verificationToken = citizen.getVerificationToken();
        
        // Check for null token before splitting (security/robustness)
        if (verificationToken == null || !verificationToken.contains("#")) {
        	String error = URLEncoder.encode("Verification token is missing. Please try resending OTP.", "UTF-8");
		    response.sendRedirect(request.getContextPath() + "/citizen/login.jsp?error=" + error);
            return;
        }
        
        String[] parts = verificationToken.split("#");
        String dbOtp = parts[0];
        // Cast immediately to Timestamp to check expiry
        Timestamp dbExpiryTimestamp = Timestamp.valueOf(parts[1]); 
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        
        
        if (dbOtp.equals(submittedOtp) && currentTime.before(dbExpiryTimestamp)) {
        	
            // OTP is valid and not expired
            citizenDao.verifyCitizen(citizen.getId());
            
            // Immediately update the in-memory object and session
            citizen.setIsVerified(true);
            citizen.setVerificationToken(null);
            
            // Set the authenticated object in the session
            session.setAttribute("citizen", citizen); 
            session.removeAttribute("emailForVerification");
            
            response.sendRedirect(request.getContextPath() + "/citizen/dashboard.jsp"); 

        } else {
            // Check expiry first for specific feedback
            String errorMsg = "";
            if (!dbOtp.equals(submittedOtp)) {
                errorMsg = "Invalid OTP. Please check the six-digit code and try again.";
            } else if (!currentTime.before(dbExpiryTimestamp)) {
                errorMsg = "The OTP has expired. Please use the resend option on the verification page.";
            } else {
                 errorMsg = "Invalid OTP. Please check the six-digit code and try again.";
            }
			 
			 String error = URLEncoder.encode(errorMsg, "UTF-8");
			 response.sendRedirect(request.getContextPath() + "/citizen/login.jsp?error=" + error);
        }
	}

}