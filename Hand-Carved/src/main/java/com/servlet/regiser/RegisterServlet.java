package com.servlet.regiser;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/signup")
public class RegisterServlet extends HttpServlet {

    private static final String INSERT_QUERY = "INSERT INTO USER(NAME,LASTNAME,EMAIL,PHONE,PASSWORD,DATE) VALUES(?,?,?,?,?,?)";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get PrintWriter
        PrintWriter pw = resp.getWriter();
        // Set content type
        resp.setContentType("text/html");
        // Read the form values
        String name = req.getParameter("name");
        String lastname = req.getParameter("lastname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");
        String date = req.getParameter("date");

        String errorMessage = "error";

        String emptyError = "error";
        String passwordError = "error";
        
        // Load the JDBC driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        //empty field error
        if(name.isEmpty() || lastname.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty() || repassword.isEmpty() || date.isEmpty()) {
        	emptyError="All the fields are required";
        }
        // Validate if email is already used
        boolean emailAlreadyUsed = isEmailAlreadyUsed(email);
        if(emptyError.length()==5) {
        if (emailAlreadyUsed) {
            errorMessage="Email is already used. Please choose a different email.";
        }
        }
         if(emptyError.length() > 5) {
        	 req.setAttribute("Rerror",emptyError);
          	RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
          	rd.include(req, resp);
         }
        
         if (errorMessage.length() > 5) {
        	 req.setAttribute("Rerror",errorMessage);
         	RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
         	rd.include(req, resp);
        	}
       
         if(errorMessage.length()==5) {
        if (!password.equals(repassword)) {
            // Execute the JavaScript function
        	passwordError = "Password does not match";
        }
         }

          if(passwordError.length()==5 && errorMessage.length() == 5 && emptyError.length() == 5) {
         	if(password.length() < 6) {
         		req.setAttribute("Rerror","Password must contain at least 6 characters");
             	RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
             	rd.include(req, resp);
         	}
         }
        
        if(passwordError.length()>5) {
        	req.setAttribute("Rerror",passwordError);
        	RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
        	rd.include(req, resp);
        }
        else if(errorMessage.length() == 5 && passwordError.length() == 5 && emptyError.length() == 5 && password.length()>=6){
            // If there are no errors, proceed with database insertion
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
                 PreparedStatement ps = con.prepareStatement(INSERT_QUERY);) {
                // Set the values
                ps.setString(1, name);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, phone);
                ps.setString(5, password);
                ps.setString(6, date);

                // Execute the query
                int count = ps.executeUpdate();
                if (count == 0) {
                	req.setAttribute("Rerror","Something went wrong");
                	RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
                	rd.include(req, resp);
                } else {
                	req.setAttribute("pass", "Registered Successfully");
                	RequestDispatcher rd = req.getRequestDispatcher("signup.jsp"); 
                	rd.include(req, resp);
                	resp.sendRedirect("index.jsp"); 
                }
            } catch (SQLException se) {
                pw.println(se.getMessage());
                se.printStackTrace();
            } catch (Exception e) {
                pw.println(e.getMessage());
                e.printStackTrace();
            }
        
        }

        // Close the stream
        pw.close(); 
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private boolean isEmailAlreadyUsed(String email) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/userinfo", "root", "");
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM USER WHERE EMAIL = ?")) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next(); // If next() returns true, email exists in the database
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
  
    
}
