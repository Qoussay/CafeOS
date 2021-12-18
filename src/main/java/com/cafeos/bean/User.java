package com.cafeos.bean;

public class User 
{
	private short isAdmin;
	private int userId;
	private String fName, lName, email, password;
	
	/* Getter-Setter */
	public short getIsAdmin() {	return isAdmin; }
	public void setIsAdmin(short isAdmin) {	this.isAdmin = isAdmin;	}
	
	public int getUserId() { return userId; }
	public void setUserId(int userId) {	this.userId = userId; }
	
	public String getfName() { return fName; }
	public void setfName(String fName) { this.fName = fName; }
	
	public String getlName() { return lName; }
	public void setlName(String lName) { this.lName = lName; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
}