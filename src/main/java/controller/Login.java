
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

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("i am in login servlet");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		CitizenDAO citizenDao = new CitizenDAO();
		Citizen citizen = citizenDao.findByEmail(email);
		 

        // 1. Check if user exists
        if (citizen == null) {
        	String error = URLEncoder.encode("Account not found or invalid credentials.", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
            return;
        }

        // 2. Check if password matches
        // BCrypt.checkpw(plainTextPassword, hashedPassword) returns true if they match
        if (!BCrypt.checkpw(password, citizen.getPasswordHash())) {
        	String error = URLEncoder.encode("Invalid email or password.", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
            return;
        }
        
        // 3. Check if account is verified
        if (!citizen.getIsVerified()) {
            Registration.sendVerificationOtp(citizen, citizenDao, request, response);
            return;
        }
         
        try {
        	HttpSession session = request.getSession(true);        	
        	session.setAttribute("citizen", citizen);


            //update last login for user :
            boolean lastLogin  = citizenDao.updateLastLogin(citizen.getEmail());
            if (lastLogin) {
				System.out.println("Last login update for email : "+citizen.getEmail());
			}
            
            // Redirect to the citizen dashboard/home page
            response.sendRedirect(request.getContextPath() + "/citizen/dashboard.jsp"); 
            
		} catch (Exception e) {
			System.err.println("Error storing user in session ! " + e.getMessage());
			e.printStackTrace();
		}
	}

}
