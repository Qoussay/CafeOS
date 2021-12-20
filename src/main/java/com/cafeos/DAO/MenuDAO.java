package com.cafeos.DAO;

import com.cafeos.bean.Menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO 
{
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
	
	public static Menu getbyId(int id)
	{
		Menu m = null;
		
		try
		{
			Connection con = ConHandler.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM `order` WHERE id=?;");
			
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