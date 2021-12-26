package com.cafeos.web;

import java.io.IOException;

import com.cafeos.DAO.UserDAO;
import com.cafeos.bean.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String errorLogin = "false";
		
		User user = new User();
		user.setEmail(username);
		user.setPassword(password);
		
		UserDAO userDao = new UserDAO();
		
		//check if true
		if (userDao.validate(user)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("userId", user.getUserId());
			if(user.getIsAdmin()==0) {
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("staff-dashboard.jsp");
			}
			
		}
		else {
			request.setAttribute("errorLogin", errorLogin);
			//response.sendRedirect("login.jsp");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}

}
