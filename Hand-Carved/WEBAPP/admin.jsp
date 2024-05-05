<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException, com.dao.ProductDao,com.dao.ProductDetails,java.util.List" %>

<!DOCTYPE html>
<html>
<head>
  <title>Control Panel</title>
  <style>
    body {
      font-family: "Rubik", Helvetica, Arial, sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 0;
    }

    .header {
      background: linear-gradient(to bottom right, #FD8451, #FFBD6F);
      padding: 20px;
      color: white;
      text-align: center;
    }

    .container {
      max-width: 1300px;
      margin: 0 auto;
      padding: 20px;
    }

    .button {
      display: inline-block;
      padding: 10px 20px;
      background-color: #007BFF;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      text-decoration:none;
    }

    .button:hover {
      background-color: #0056b3;
      text-decoration:none;
    }

    .products-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .products-table th,
    .products-table td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #ccc;
    }

    .products-table th {
      background-color: #f2f2f2;
    }

    .products-table tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .products-table tr:hover {
      background-color: #e6e6e6;
    }

    .edit-link,
    .remove-link {
      color: #007BFF;
      text-decoration: none;
      margin-left: 10px;
    }

    .remove-link {
      color: #DC3545;
    }

    .edit-link:hover,
    .remove-link:hover {
      text-decoration: underline;
    }

    .form-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      border-radius: 5px;
    }

    .form-label {
      font-weight: bold;
    }

    .form-input {
      width: 50%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;
      font-size: 14px;
    }

    .form-textarea {
      width: 97%;
      height: 150px;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;
      resize: vertical;
      font-size: 14px;
    }

    .form-button {
      background-color: #007BFF;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .form-error {
      color: #DC3545;
      font-size: 14px;
      margin-top: 8px;
    }
     .button-red {
    background-color: #DC3545;
  }
  .button-red:hover {
    background-color: #C82333;
  }
  </style>
</head>
<body>
  <div class="header">
    <h1>Control Panel</h1>
  </div>

  <div class="container">
    <a href="#" class="button" onclick="showNewProductForm()">Add New Product</a>
    <a href="#" class="button" onclick="showProductTable()">View Products</a>
    <a href="index.jsp" class="button button-red" onclick="logout()">Log Out</a>
    <a href="index.jsp" class="button button-red" onclick="logout()">ragaca</a>
    <div id="newProductForm" class="form-container" style="display: none;">
      <h2>Add New Product</h2>
      <form action="upload" method="post" enctype="multipart/form-data">
        <label class="form-label" for="name">Product Name:</label>
        <input type="text" name="name" id="name" class="form-input" placeholder="Enter product name" required>
        <br>
        <label class="form-label" for="description">Product Description:</label>
        <textarea name="description" id="description" class="form-textarea" placeholder="Enter product description" required></textarea>
        <br>
        <label class="form-label" for="price">Product Price:</label>
        <input type="text" name="price" id="price" class="form-input" placeholder="Enter product price" required>
        <br>
        <label class="form-label" for="photo">Product Photo:</label>
        <input type="file" name="photo" id="photo" accept="image/*" required>
        <br>
        <div>
          <input type="submit" name="submit" class="form-button" value="Upload Product">
        </div>
      </form>
    </div>

    <div id="productTable" style="display: none;">
      <h2>Product List</h2>
      <table class="products-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Product</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        
          <%
            try {
              Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
              throw new RuntimeException(e);
            }

            ProductDao dao = new ProductDao(DriverManager.getConnection("jdbc:mysql://localhost:3308/products", "root", ""));
            List<ProductDetails> list = dao.getAllProducts();
            for (ProductDetails b : list) {
          %>
          <tr>
            <td><%= b.getId() %></td>
            <td><img src="images/<%=b.getPhotoName()%>" style="width: 100px; height: 120px;"></td>
            <td><%= b.getName() %></td>
            <td><%= b.getDescription() %></td>
            <td><%= b.getPrice() %> USD</td>
            <td>
              <a href="edit_product.jsp?id=<%=b.getId()%>" class="edit-link">Edit</a>
              <a href="delete?id=<%=b.getId() %>" class="remove-link">Remove</a>
            </td>
          </tr>
          <input type="hidden" value="<%=b.getId() %>" name="id">
          <% 
            }
          %>
          
        </tbody>
      </table>
    </div>
  </div>

  <script>
    function showNewProductForm() {
      document.getElementById("newProductForm").style.display = "block";
      document.getElementById("productTable").style.display = "none";
    }

    function showProductTable() {
      document.getElementById("newProductForm").style.display = "none";
      document.getElementById("productTable").style.display = "block";
    }
  </script>
</body>
</html>
