package com.cafeos.DAO;

import com.cafeos.bean.Menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO 
{
	public static int save(Menu m)
	{
		int status = 0;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("INSERT INTO menu(name, price, categoryId) values(?,?,?);");
			
			pst.setString(1, m.getName());
			pst.setFloat(2, m.getPrice());
			pst.setInt(3, m.getCategoryId());
			
			status = pst.executeUpdate();
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return status;
	}
	
	public static int update(Menu m)
	{
		int status = 0;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("UPDATE menu SET name=?, price=? WHERE menuId=?;");
				
			pst.setString(1, m.getName());
			pst.setFloat(2, m.getPrice());
			
			pst.setInt(3, m.getMenuId()); // <= WHERE Condition
			
			status = pst.executeUpdate();
			
			System.out.println(status);
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return status;
	}
	
	public static int delete(Menu m)
	{
		int status = 0;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("DELETE FROM menu WHERE menuId=?;");
			
			pst.setInt(1, m.getMenuId()); // <= WHERE Condition
			
			status = pst.executeUpdate();
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return status;
	}
	
	public static List<Menu> getAllMenu()
	{
		List<Menu> list = new ArrayList<Menu>();
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM menu;");
			ResultSet rs = pst.executeQuery();
			
			while (rs.next())
			{
				Menu m = new Menu();
				
				m.setMenuId(rs.getInt("menuId"));
				m.setCategoryId(rs.getInt("categoryId"));
				m.setName(rs.getString("name"));
				m.setPrice(rs.getFloat("price"));
				
				list.add(m);
			}
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return list;
	}
	
	public static Menu getById(int id)
	{
		Menu m = null;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM `menu` WHERE menuId=?;");
			
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			m = new Menu();
			
			while (rs.next())
			{				
				m.setMenuId(rs.getInt("menuId"));
				m.setCategoryId(rs.getInt("categoryId"));
				m.setName(rs.getString("name"));
				m.setPrice(rs.getFloat("price"));
			}
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return m;
	}
	
	public static String getCategoryString(int id)
	{
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT name FROM `category` WHERE categoryId=?;");
			
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			
			rs.next();
			
			return rs.getString("name");
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return "Error";
	}	
}