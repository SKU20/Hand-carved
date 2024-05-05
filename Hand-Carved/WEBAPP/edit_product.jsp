<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException, com.dao.ProductDao,com.dao.ProductDetails,java.util.List,com.dao.ProductsImp" %>
<!DOCTYPE html>
<html>
<head>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
  }

  .container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    margin-top: 50px;
  }

  .edit-label {
    font-weight: bold;
    margin-bottom: 8px;
  }

  .edit-input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 14px;
  }

  .edit-textarea {
    width: 100%;
    height: 150px;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    resize: vertical;
    font-size: 14px;
  }

  .edit-button {
    background-color: #007BFF;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
  }

  .edit-button:hover {
    background-color: #0056b3;
  }

  .error-label {
    color: #DC3545;
    font-size: 14px;
    margin-top: 8px;
  }
</style>
<meta charset="ISO-8859-1">
<title>Edit product</title>
</head>
<body>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
    throw new RuntimeException(e);
}
   int id = Integer.parseInt(request.getParameter("id"));
   ProductDao dao = new ProductDao(DriverManager.getConnection("jdbc:mysql://localhost:3308/products", "root", ""));
   ProductDetails details = dao.getProductById(id);
%>
<div class="container">
  <h2>Edit Product</h2>
  <form action="update" method="post">
    <label class="edit-label" for="name">Product Name:</label>
    <input type="text" name="edit-name" id="name" class="edit-input" value="<%=details.getName()%>">

    <label class="edit-label" for="description">Product Description:</label>
    <textarea name="edit-description" id="description" class="edit-textarea"><%=details.getDescription()%></textarea>

    <label class="edit-label" for="price">Product Price:</label>
    <input type="text" name="edit-price" class="edit-input" value="<%=details.getPrice()%>">

    <input type="hidden" name="id" value="<%=details.getId()%>">
    <input type="submit" value="Save Changes" class="edit-button">
    
  </form>
</div>
</body>
</html>
