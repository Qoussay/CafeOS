package com.cafeos.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import com.cafeos.DAO.OrderDAO;
import com.cafeos.DAO.UserDAO;
import com.cafeos.bean.Order;
import com.cafeos.bean.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddToCart  extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static String[] order_name = new String[10];
	public static String[] order_price = new String[10];
	public static int counter=0;
	public static float total_price = 0f;

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
		
		if (request.getParameter("request").equals("addItem")) {
			String item_name = request.getParameter("item_name");
			String item_price = request.getParameter("item_price");
			
			order_name[counter] = item_name;
			order_price[counter] = item_price;
			
			counter ++;
			total_price += Float.parseFloat(item_price);
			
			for (int i = 0; i < 10; i++) {
				  System.out.println("item " + i + ": " + order_name[i] + "/" + order_price[i]);
			}
			
			response.sendRedirect("action/checkout.jsp");
		}
		else {
			String order_name_str = Arrays.toString(order_name);
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
			order.setTotalPrice(total_price);
			order.setUserId(1);
			
			OrderDAO orderDAO = new OrderDAO();
			
			//reset variables
			order_name = new String[10];
			order_price = new String[10];
			counter=0;
			total_price = 0f;
			
			if(OrderDAO.save(order)==0) {
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
			}
		}
	}
	
	
	public static int getCounter() {
		return counter;
	}
	
	public static String getOrderNameArray() {
		String order_name_str = Arrays.toString(order_name);
		return order_name_str;
	}
	
	public static String getOrderPriceArray() {
		String order_price_str = Arrays.toString(order_price);
		return order_price_str;
	}
	
	public static Float getTotalPrice() {
		return total_price;
	}

}
