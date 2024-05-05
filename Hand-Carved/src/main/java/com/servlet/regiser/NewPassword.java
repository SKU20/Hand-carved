package com.servlet.regiser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String INSERT_QUERY = "SELECT * FROM user WHERE EMAIL = ? AND PASSWORD = ?";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		String email = (String) session.getAttribute("email");
	    String password = (String) session.getAttribute("password");
		RequestDispatcher dispatcher = null;
		
		if(isUserValid(email,password) && password != null && newPassword.equals(confPassword)) {
			if(newPassword.length() < 6 ) {
				request.setAttribute("error","Password must contain at least 6 character!");
				RequestDispatcher rd = request.getRequestDispatcher("newPassword.jsp");
	         	rd.include(request, response);
			}
			else try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
				PreparedStatement pst = con.prepareStatement("update user set password = ? where email = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					request.setAttribute("changed", "password changed successfully");		
					dispatcher = request.getRequestDispatcher("profile.jsp");
					
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("index.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		else if (newPassword != null && confPassword != null && newPassword.equals(confPassword) && password == null) {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
				PreparedStatement pst = con.prepareStatement("update user set password = ? where email = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("index.jsp");
					
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("index.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			if(newPassword.length()<6) {
				request.setAttribute("error", "Password must contain at least 6 character!");
				RequestDispatcher rd = request.getRequestDispatcher("newPassword.jsp");
	         	rd.include(request, response);
			}
			request.setAttribute("error","Password does not match");
         	RequestDispatcher rd = request.getRequestDispatcher("newPassword.jsp");
         	rd.include(request, response);
		}
	}
	private boolean isUserValid(String email, String password) {
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    if (email != null && password != null) {
	        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
	             PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
	            statement.setString(1, email.trim());
	            statement.setString(2, password.trim());
	            ResultSet resultSet = statement.executeQuery();
	            return resultSet.next(); // If next() returns true, email and password combination is valid
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return false;
	}

}
