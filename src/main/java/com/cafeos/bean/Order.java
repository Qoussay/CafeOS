package com.cafeos.bean;

public class Order 
{
	private short isCompleted;
	private int orderId, userId;
	private float totalPrice;
	private String orderNames, date;
	
	/* Getter-Setter */
	public short getIsCompleted() { return isCompleted;	}
	public void setIsCompleted(short isCompleted) {	this.isCompleted = isCompleted;	}
	
	public int getOrderId() { return orderId; }
	public void setOrderId(int orderId) { this.orderId = orderId; }
	
	public int getUserId() { return userId; }
	public void setUserId(int userId) {	this.userId = userId; }
	
	public float getTotalPrice() { return totalPrice; }
	public void setTotalPrice(float totalPrice) { this.totalPrice = totalPrice; }
	
	public String getOrderNames() {	return orderNames; }
	public void setOrderNames(String orderNames) { this.orderNames = orderNames; }
	
	public String getDate() { return date; }
	public void setDate(String date) { this.date = date; }
}