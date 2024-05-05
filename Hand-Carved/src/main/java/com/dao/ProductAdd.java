package com.dao;

import java.io.File;
import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class ProductAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String crossName = req.getParameter("name");
			String price = req.getParameter("price");
			String description = req.getParameter("description");
			Part part = req.getPart("photo");
			String fileName = part.getSubmittedFileName();		
			
			ProductDetails details = new ProductDetails(crossName,description,price,fileName);
			 try {
		            Class.forName("com.mysql.jdbc.Driver");
		        } catch (ClassNotFoundException e) {
		            throw new RuntimeException(e);
		        }
			
			ProductDao dao = new ProductDao(DriverManager.getConnection("jdbc:mysql://localhost:3308/products", "root", ""));
			
			
			
			boolean f = dao.addProduct(details);
			
			HttpSession session = req.getSession();		
			if(f) {
				String path = getServletContext().getRealPath("")+"images";
				
				File file = new File(path);
				part.write(path+File.separator + fileName);
				resp.sendRedirect("admin.jsp");
			}else {
				session.setAttribute("failed", "Something went wrong");
				resp.sendRedirect("admin.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
    
}
