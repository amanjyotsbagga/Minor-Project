package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.TestDAO;
import model.entity.TestUser;

import java.io.IOException;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		System.out.println("the name and age are : "+name+" "+age);
		TestUser tu = new TestUser(name,age);
		TestDAO tdao = new TestDAO();
		int i = tdao.addTestUser(tu);
		if (i != 0) {
			RequestDispatcher rd = request.getRequestDispatcher("test/userDatabase.jsp");
			rd.forward(request, response);	
		}else {
		RequestDispatcher rd = request.getRequestDispatcher("test/404.html");
		rd.forward(request, response);
		}
	}


}
