<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add Menu | CafeOS</title>
	</head>
	<body>
		<h1>Add Menu</h1>
		<form action="../action/add_menu.jsp">
			<table>
				<tr>
					<td>Menu Name:</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="text" name="price" /></td>
				</tr>
				<tr>
					<td>Category:</td>
					<td>
						<select name="categoryId">
							<option value="1">Food</option>						
							<option value="2">Drinks</option>						
						</select>
					</td>
				</tr>
			</table>
			
			<div style="margin-top: 20px;">
				<input type="submit" value="Add Menu" /> &nbsp
				<span><a href="menulist.jsp">Cancel Edit</a></span>	
			</div>
		</form>
	</body>
</html>