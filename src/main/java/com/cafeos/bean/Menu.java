package com.cafeos.bean;

import com.cafeos.DAO.MenuDAO;

public class Menu 
{
	private int menuId, categoryId;
	private String name;
	private float price;
	
	/* Getter-Setter */
	public int getMenuId() { return menuId;	}
	public void setMenuId(int menuId) {	this.menuId = menuId; }
	
	public int getCategoryId() { return categoryId;	}
	public void setCategoryId(int categoryId) {	this.categoryId = categoryId; }
	public String categoryToString() { return MenuDAO.getCategoryString(categoryId); }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public float getPrice() { return price; }
	public void setPrice(float price) { this.price = price;	}
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", categoryId=" + categoryId + ", name=" + name + ", price=" + price + "]";
	}
}