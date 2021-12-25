package com.cafeos.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConHandler 
{
	static final String DB_URL = "jdbc:mysql://localhost:3306/cafe_os";
	
	static final String DB_UNAME = "cafeos";
	static final String DB_PWORD = "cafeos";
	
	public static Connection getConnection()
	{
		Connection con = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(DB_URL, DB_UNAME, DB_PWORD);
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return con;
	}
}