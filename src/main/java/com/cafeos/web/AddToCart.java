package com.cafeos.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import com.cafeos.DAO.OrderDAO;
import com.cafeos.DAO.UserDAO;
import com.cafeos.bean.Order;
import com.cafeos.bean.User;
import com.cafeos.bean.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddToCart  extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

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
		Cart cart = null;
		
		// Add login validation
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null) {
			response.sendRedirect("/CafeOS/login.jsp");
			return;
		}
		
		cart = (Cart) session.getAttribute("cart");
		
		if (request.getParameter("request").equals("addItem")) {
			String item_name = request.getParameter("item_name");
			String item_price = request.getParameter("item_price");
			
			cart.order_name[cart.counter] = item_name;
			cart.order_price[cart.counter] = item_price;
			cart.counter ++;
			cart.total_price += Float.parseFloat(item_price);
			
			session.setAttribute("cart", cart);
			response.sendRedirect("menu.jsp");
		}
		else if (request.getParameter("request").equals("clearCart")) {
			cart.reset();
			session.setAttribute("cart", cart);
			response.sendRedirect("action/checkout.jsp");
		}
		else if (request.getParameter("request").equals("checkout")) {
			String order_name_str = Arrays.toString(cart.order_name);
			order_name_str = order_name_str.replace(", null", "");
			System.out.println(order_name_str);
			
			//getDate
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			System.out.println(date);
			
			//create an order
			Order order = new Order();
			order.setDate(date);
			order.setIsCompleted((short) 0);
			order.setOrderNames(order_name_str);
			order.setTotalPrice(cart.total_price);
			order.setUserId(Integer.parseInt(session.getAttribute("userId").toString()));
			
			OrderDAO.save(order);
			
			//reset variables
			cart.reset();
			
			session.setAttribute("cart", cart);
			response.sendRedirect("index.jsp");
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	}
}

