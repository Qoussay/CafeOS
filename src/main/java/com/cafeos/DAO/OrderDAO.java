package com.cafeos.DAO;

import com.cafeos.bean.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO 
{
	public static int save(Order o)
	{
		int status = 0;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("INSERT INTO `order` (userId, orderNames, totalPrice, date, isCompleted) values(?,?,?,?,?);");
			
			pst.setInt(1, o.getUserId());
			pst.setString(2, o.getOrderNames());
			pst.setFloat(3, o.getTotalPrice());
			pst.setString(4, o.getDate());
			pst.setInt(5, 0);
			
			status = pst.executeUpdate();
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return status;	
	}
	
	public static List<Order> getAllOrder()
	{
		List<Order> list = new ArrayList<Order>();
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM `order`;");
			ResultSet rs = pst.executeQuery();
			
			while (rs.next())
			{
				Order o = new Order();
				
				o.setOrderId(rs.getInt("orderId"));
				o.setUserId(rs.getInt("userId"));
				o.setOrderNames(rs.getString("orderNames"));
				o.setTotalPrice(rs.getFloat("totalPrice"));
				o.setDate(rs.getString("date"));
				o.setIsCompleted((short)rs.getInt("isCompleted"));
				
				list.add(o);
			}
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return list;
	}
	
	public static List<Order> getOrderByDate(String date)
	{
		List<Order> list = new ArrayList<Order>();
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM `order` WHERE date=?;");
			
			pst.setString(1, date);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next())
			{
				Order o = new Order();
				
				o.setOrderId(rs.getInt("orderId"));
				o.setUserId(rs.getInt("userId"));
				o.setOrderNames(rs.getString("orderNames"));
				o.setTotalPrice(rs.getFloat("totalPrice"));
				o.setDate(rs.getString("date"));
				o.setIsCompleted((short)rs.getInt("isCompleted"));
				
				list.add(o);
			}
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return list;
	}
	
	public static Order getbyId(int id)
	{
		Order o = null;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM `order` WHERE id=?;");
			
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			o = new Order();
			
			while (rs.next())
			{				
				o.setOrderId(rs.getInt("orderId"));
				o.setUserId(rs.getInt("userId"));
				o.setOrderNames(rs.getString("orderNames"));
				o.setTotalPrice(rs.getFloat("totalPrice"));
				o.setDate(rs.getString("date"));
				o.setIsCompleted((short)rs.getInt("isCompleted"));
			}
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return o;
	}
	
	public static List<Order> getByUserId(int id)
	{
		List<Order> list = new ArrayList<Order>();
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM `order` WHERE userId=?;");
			
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next())
			{
				Order o = new Order();
				
				o.setOrderId(rs.getInt("orderId"));
				o.setUserId(rs.getInt("userId"));
				o.setOrderNames(rs.getString("orderNames"));
				o.setTotalPrice(rs.getFloat("totalPrice"));
				o.setDate(rs.getString("date"));
				o.setIsCompleted((short)rs.getInt("isCompleted"));
				
				list.add(o);
			}
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return list;
	}
	
	public static int completeOrder(int id)
	{
		int status = 0;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("UPDATE `order` SET isCompleted=1 WHERE orderId=?;");
			
			pst.setInt(1, id);
			
			status = pst.executeUpdate();
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return status;
	}
	
	public static int undoCompleteOrder(int id)
	{
		int status = 0;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("UPDATE `order` SET isCompleted=0 WHERE orderId=?;");
			
			pst.setInt(1, id);
			
			status = pst.executeUpdate();
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return status;
	}
	
	// Utility
	public static List<Order> filterOrderByStatus(List<Order> list, short statusFilter)
	{
		List<Order> input_list = list;
		List<Order> output_list = new ArrayList<Order>();
		
		try
		{
			if (input_list == null)
				input_list = getAllOrder();

			if (statusFilter == 2)
				return input_list;
			
			for (Order order : input_list)
			{	
				if (order.getIsCompleted() == statusFilter)
					output_list.add(order);
			}
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return output_list;
	}
}