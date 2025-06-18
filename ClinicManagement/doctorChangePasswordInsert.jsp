<%--  
    Document   : supplierProfileUpdateProcess.jsp 
    Created on : 25 Apr 2024, 4:23:56 PM 
    Author     : fatimah 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file="connectionDB.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Update Supplier in MySQL Process</title> 
    </head> 
    <body> 
        <% 
            
             
                PreparedStatement psUpdatePassword = null; 
                 
                String employeeID = request.getParameter("LoginEmployee"); 
                String employeePass = request.getParameter("employeePass1");
                String employeePass2 = request.getParameter("employeePass2");
                String employeePass3 = request.getParameter("employeePass3");
                                  
                if (employeeID != null && employeePass != null && employeePass2 != null && employeePass3 != null) {
                if (!employeePass2.equals(employeePass3)) {
                    out.println("<script>alert('New Password and Confirm Password do not match.'); window.history.back();</script>");
                } else {
                    try {
                        Statement statement = connection.createStatement();
                        String querySelect = "SELECT login_password FROM Login WHERE login_loginID = '" + employeeID + "'";
                        ResultSet rs = statement.executeQuery(querySelect);

                        if (rs.next()) {
                            String dbPassword = rs.getString("login_password");

                            if (dbPassword.equals(employeePass)) {
                                String queryUpdate = "UPDATE Login SET login_password = '" + employeePass2 + "' WHERE login_loginID = '" + employeeID + "'";
                                int result = statement.executeUpdate(queryUpdate);

                                if (result > 0) {
                                    out.println("<script>alert('Password updated successfully.'); window.location='doctorChangePassword.jsp';</script>");
                                } else {
                                    out.println("<script>alert('Failed to update password.'); window.history.back();</script>");
                                }
                            } else {
                                out.println("<script>alert('Current Password is incorrect.'); window.history.back();</script>");
                            }
                        } else {
                            out.println("<script>alert('Employee not found.'); window.history.back();</script>");
                        }
                    } catch(SQLException sqlExp) {
                        request.setAttribute("error", sqlExp);
                        out.println("SQL Exception: " + sqlExp + "<br>");
                    } finally {
                        if (connection != null) {
                            try {
                                connection.close();
                            } catch(SQLException e) {
                                out.println("Error closing connection: " + e.getMessage() + "<br>");
                            }
                        }
                    }
                }
            } else {
                out.println("<script>alert('All fields are required.'); window.history.back();</script>");
            }
        %> 
        <br> 
    </body> 
</html>