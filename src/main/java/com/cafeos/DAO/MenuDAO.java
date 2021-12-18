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
}