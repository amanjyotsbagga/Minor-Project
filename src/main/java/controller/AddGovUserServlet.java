package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.GovDAO;
import model.entity.GovUser;

import java.io.IOException;
import java.net.URLEncoder;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/AddGovUserServlet")
public class AddGovUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddGovUserServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullName = request.getParameter("full_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		int department_id = Integer.parseInt(request.getParameter("department_id"));
		String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());
		GovDAO govDAO = new GovDAO();
		GovUser govUser = new GovUser(fullName,email,passwordHash,department_id);
		govUser.setRoleByName(role);
		boolean addGovUser = govDAO.save(govUser);
		if (addGovUser) {
			String success = URLEncoder.encode("Account created Succesfuly", "UTF-8");
		    response.sendRedirect("gov/addDepAdmin.jsp?error=" + success);
            return;
		} else {
			String error = URLEncoder.encode("Account created Unsuccesfuly", "UTF-8");
		    response.sendRedirect("gov/addDepAdmin.jsp?error=" + error);
            return;
		}
	}

}
