package com.cafeos.web;

import java.io.IOException;
import com.cafeos.DAO.UserDAO;
import com.cafeos.bean.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegisterServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setfName(firstname);
		user.setlName(lastname);
		user.setEmail(email);
		user.setPassword(password);
		
		UserDAO userDao = new UserDAO();
		
		//check if true
		/*
		 * if (userDao.validateEmail(user)) { response.sendRedirect("index.html");
		 * //already exist email, send another palace } else { UserDAO.save(user);
		 * response.sendRedirect("login.html"); }
		 */
		if (UserDAO.save(user)==0) {
			response.sendRedirect("login.jsp"); //already exist email, send another palace
		}
		else {
			response.sendRedirect("index.jsp");
		}
	}

}
