package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.GovDAO;
import model.entity.GovUser;

import java.io.IOException;
import java.net.URLEncoder;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/GovLogi")
public class GovLogi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GovLogi() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		String department = request.getParameter("department");
		String password = request.getParameter("password");
		GovDAO govDAO = new GovDAO();
		GovUser govUser = govDAO.findByEmail(email);
		
		System.out.println("Role is : "+role+" Department : "+department);
		if(govUser == null) {
			String error = URLEncoder.encode("Account not found or invalid credentials.", "UTF-8");
		    response.sendRedirect("gov/govLogin.jsp?error=" + error);
            return;
		}
		
		if (!BCrypt.checkpw(password,govUser.getPasswordHash())){
			String error = URLEncoder.encode("Invalid email or password.", "UTF-8");
		    response.sendRedirect("gov/govLogin.jsp?error=" + error);
            return;
		}
		
		try {
			HttpSession session = request.getSession(true);
			session.setAttribute("govUser", govUser);
			session.setAttribute("role", role);
			
            response.sendRedirect(request.getContextPath() + "/gov/"+role+"-dashboard.html"); 

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
