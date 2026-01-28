package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.EmailUtil;
import model.dao.CitizenDAO;
import model.entity.Citizen;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.Random;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Registration() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());

		CitizenDAO citizenDao = new CitizenDAO();

		// if user all ready exsisting and try to resister
		Citizen exsitingCitizen = citizenDao.findByEmail(email);

		if (exsitingCitizen != null) {
			if (exsitingCitizen.getIsVerified()) {
				String error = URLEncoder.encode("Account already exists. Please log in.", "UTF-8");
			    response.sendRedirect("citizen/login.jsp?error=" + error);
			} else {
				exsitingCitizen.setFullName(fullName);
				exsitingCitizen.setPhoneNumber(phoneNumber);
				exsitingCitizen.setAddress(address);
				exsitingCitizen.setPasswordHash(passwordHash);
				
				if(citizenDao.updateCitizenDetails(exsitingCitizen)) {
					sendVerificationOtp(exsitingCitizen, citizenDao, request, response);
				}else {
					System.err.println("Error in updateCitizenDetails to exsisting-citizen ");
					String error = URLEncoder.encode("Error in updateCitizenDetails to exsisting-citizen plese try in some time ...", "UTF-8");
				    response.sendRedirect("citizen/login.jsp?error=" + error);
				}	
			}
		}else {
		// if the citizen is a new user
		Citizen citizen = new Citizen(fullName, email, passwordHash, phoneNumber, address);
		Boolean phoneNumberExsist = citizenDao.findPhoneNumber(phoneNumber);
		if (phoneNumberExsist) {
			String error = URLEncoder.encode("The Phone Number is already Registered pls Login!", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
		    return;
		}
		Citizen savedCitizen = citizenDao.save(citizen);

		if (savedCitizen != null && savedCitizen.getId() > 0) {
			sendVerificationOtp(savedCitizen, citizenDao, request, response);
		}else {
			System.err.println("Error in savedCitizen of citizen");
			String error = URLEncoder.encode("Somthing went worng in saving citizen. pls try in some time ...", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
			}
		}
	}

	/**
	 * send verification otp and redirect to the verify-otp page
	 **/
	public static void sendVerificationOtp(Citizen citizen, CitizenDAO citizenDao, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Random rnd = new Random();
		int number = rnd.nextInt(900000) + 100000; // 100000 to 999999
		String otp = String.valueOf(number);
		Timestamp expiryTime = new Timestamp(System.currentTimeMillis() + (10 * 60 * 1000));

		citizen.setVerificationToken(otp + "#" + expiryTime);
		boolean updateVerificationToken = citizenDao.updateVerificationToken(citizen);
		if (updateVerificationToken) {
			try {
				String to = citizen.getEmail();
				String subject = "Verify Your Email Address - Setu Registration";

				String body = "<!DOCTYPE html>" + "<html>"
						+ "<body style='font-family: Arial, sans-serif; background-color: #f9fafb; padding: 20px;'>"
						+ "<div style='max-width: 600px; margin: auto; background: white; border-radius: 10px; padding: 25px; "
						+ "box-shadow: 0 2px 8px rgba(0,0,0,0.1);'>"
						+ "<h2 style='color: #2563eb;'>Welcome to Setu, " + citizen.getFullName() + "!</h2>"
						+ "<p style='font-size: 16px; color: #333;'>Thank you for registering with <strong>Setu</strong>. "
						+ "To complete your registration, please verify your email address using the OTP below:</p>"
						+ "<div style='text-align: center; margin: 30px 0;'>"
						+ "<p style='font-size: 24px; font-weight: bold; letter-spacing: 2px; color: #2563eb;'>"
						+ otp + "</p>" + "</div>"
						+ "<p style='font-size: 14px; color: #555;'>This OTP is valid for <strong>10 minutes</strong>. "
						+ "If you didn’t request this, you can safely ignore this email.</p>"
						+ "<hr style='border:none; border-top:1px solid #eee; margin: 25px 0;'>"
						+ "<p style='font-size: 13px; color: #777; text-align: center;'>"
						+ "© 2025 Setu. All rights reserved.<br>"
						+ "This is an automated message, please do not reply." + "</p>" + "</div>" + "</body>"
						+ "</html>";

				EmailUtil.sendEmail(to, subject, body);
			} catch (Exception e) {
				System.err.println("Error sending email to citizen " + e.getMessage());
				e.printStackTrace();
				String error = URLEncoder.encode("We couldn't send a verification email. Please try again later.", "UTF-8");
			    response.sendRedirect("citizen/login.jsp?error=" + error);
				return;
			}
			HttpSession session = request.getSession();
			session.setAttribute("citizen", citizen);
			session.setAttribute("emailForVerification", citizen.getEmail());
			response.sendRedirect("citizen/verify-otp.jsp");
		} else {
			System.err.println("Error in updateVerificationToken of citizen ");
			request.setAttribute("error", "We couldn't updateVerificationToken of citizen. Please try again later.");
			String error = URLEncoder.encode("We couldn't updateVerificationToken of citizen. Please try again later.", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
	}
		
	}

}