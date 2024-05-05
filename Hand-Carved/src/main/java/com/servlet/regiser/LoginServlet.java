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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final String INSERT_QUERY = "SELECT * FROM user WHERE EMAIL = ? AND PASSWORD = ?";
	 private static final String SELECT_QUERY1 = "SELECT name FROM user WHERE EMAIL = ? AND PASSWORD = ?";
	 private static final String SELECT_QUERY2 = "SELECT lastname FROM user WHERE EMAIL = ? AND PASSWORD = ?";
	 private static final String SELECT_QUERY3 = "SELECT phone FROM user WHERE EMAIL = ? AND PASSWORD = ?";
	 private static final String SELECT_QUERY4 = "SELECT date FROM user WHERE EMAIL = ? AND PASSWORD = ?";

	


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
        
        // Get the entered email and password from the request
    	 String email = req.getParameter("Email");
         String password = req.getParameter("Password");
         String lastname = getLastnameFromDatabase(email,password);
         String phone = getPhoneFromDatabase(email,password);
         String date = getDateFromDatabase(email,password);
         
         
         try {
             Class.forName("com.mysql.jdbc.Driver");
         } catch (ClassNotFoundException e) {
             throw new RuntimeException(e);
         }
         
         if(email.equals("lukalevidze@yahoo.com") && password.equals("marta2003")) {
        	 RequestDispatcher dispatcher = req.getRequestDispatcher("admin.jsp");
       	  dispatcher.include(req, resp);
         }
       
         else  if(isUserValid(email,password)) {
        	HttpSession session = req.getSession();
        	session.setAttribute("name", getNameFromDatabase(email, password));
        	session.setAttribute("lastname", lastname);
        	session.setAttribute("email", email);
        	session.setAttribute("phone", phone);
        	session.setAttribute("date", date);
        	session.setAttribute("password", password);
        	
        	req.setAttribute("name",getNameFromDatabase(email,password));
        	req.setAttribute("lastname",getLastnameFromDatabase(email,password));
        	req.setAttribute("phone",getPhoneFromDatabase(email,password));
        	req.setAttribute("date",getDateFromDatabase(email,password));
        	  try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	  RequestDispatcher dispatcher = req.getRequestDispatcher("homepage.jsp");
        	  dispatcher.include(req, resp);
        }else if(!isUserValid(email,password)){
        	req.setAttribute("erro","Invalid email or password");
          	RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
          	rd.include(req, resp);
        }
     
      
        
    }
    
    private boolean isUserValid(String email, String password) {
		
	    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
	         PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
	        statement.setString(1, email.trim());
	        statement.setString(2, password.trim());
	        ResultSet resultSet = statement.executeQuery();
	        return resultSet.next(); // If next() returns true, email and password combination is valid
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}
    private String getNameFromDatabase(String email,String password) {
        String name = null;
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
                PreparedStatement statement = connection.prepareStatement(SELECT_QUERY1)) {
            statement.setString(1, email.trim());
            statement.setString(2, password.trim());
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                name = resultSet.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return name;
    }
    private String getLastnameFromDatabase(String email, String password) {
        String lastname = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
            PreparedStatement statement = connection.prepareStatement(SELECT_QUERY2);
            statement.setString(1, email.trim());
            statement.setString(2, password.trim());
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                lastname = resultSet.getString("lastname");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return lastname;
    }

    private String getPhoneFromDatabase(String email, String password) {
        String phone = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
            PreparedStatement statement = connection.prepareStatement(SELECT_QUERY3);
            statement.setString(1, email.trim());
            statement.setString(2, password.trim());
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                phone = resultSet.getString("phone");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return phone;
    }

    private String getDateFromDatabase(String email, String password) {
        String date = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
            PreparedStatement statement = connection.prepareStatement(SELECT_QUERY4);
            statement.setString(1, email.trim());
            statement.setString(2, password.trim());
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                date = resultSet.getString("date");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return date;
    }


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
}
