package com.cafeos.bean;

import java.util.Arrays;

public class Cart 
{
	public String[] order_name = new String[10];
	public String[] order_price = new String[10];
	public int counter = 0;
	public float total_price = 0f;
	
	public String getOrderNameArray() {
		String order_name_str = Arrays.toString(order_name);
		return order_name_str;
	}
	
	public String getOrderPriceArray() {
		String order_price_str = Arrays.toString(order_price);
		return order_price_str;
	}
	
	public Float getTotalPrice() {
		return total_price;
	}
	
	public void reset()
	{
		order_name = new String[10];
		order_price = new String[10];
		counter=0;
		total_price = 0f;
	}
}