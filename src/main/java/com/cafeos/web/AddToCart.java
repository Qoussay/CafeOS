package com.cafeos.web;

import java.io.IOException;

import com.cafeos.DAO.UserDAO;
import com.cafeos.bean.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddToCart  extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public String[][] order_array = new String[2][10];
	public int counter=0;

    /**
     * Default constructor. 
     */
    public AddToCart() {
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
		String item_name = request.getParameter("item_name");
		String item_price = request.getParameter("item_price");
		
		order_array[0][counter] = item_name;
		order_array[1][counter] = item_price;
		
		counter ++;
		
		for (int i = 0; i < 10; i++) {
			  System.out.println("item " + i + ": " + order_array[0][i] + "/" + order_array[1][i]);
		}
		
		response.sendRedirect("menu.html");
	}

}
