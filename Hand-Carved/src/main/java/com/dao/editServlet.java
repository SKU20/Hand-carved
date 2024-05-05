package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("edit-name");
			String description = req.getParameter("edit-description");
			String price = req.getParameter("edit-price");
			int id = Integer.parseInt(req.getParameter("id"));
			 
			ProductDetails details = new ProductDetails();
			details.setId(id);
			details.setDescription(description);
			details.setName(name);
			details.setPrice(price);
			
			ProductDao dao = new ProductDao(DriverManager.getConnection("jdbc:mysql://localhost:3308/products", "root", ""));
			boolean res = dao.updateProduct(details);
			System.out.println(details.toString());
			HttpSession session = req.getSession();
			if(res) {
				
				resp.sendRedirect("admin.jsp");
			}
			else {
				resp.sendRedirect("admin.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}
