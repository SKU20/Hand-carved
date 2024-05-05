package com.dao;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete")
public class DelteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		
		try {
			ProductDao dao = new ProductDao(DriverManager.getConnection("jdbc:mysql://localhost:3308/products", "root", ""));
			boolean result = dao.deleteProduct(id);
			HttpSession session = req.getSession();
			
			if(result) {
				resp.sendRedirect("admin.jsp");
			}
			else {
				session.setAttribute("DeleteError", "something went wrong");
				resp.sendRedirect("admin.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
 
}
