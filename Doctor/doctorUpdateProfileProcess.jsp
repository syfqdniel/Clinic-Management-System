<%--  
    Document   : supplierProfileUpdateProcess.jsp 
    Created on : 25 Apr 2024, 4:23:56 PM 
    Author     : fatimah 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file="connectionDB.jsp" %>
<%@page import="java.sql.PreparedStatement"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Update Supplier in MySQL Process</title> 
    </head> 
    <body> 
        <%     
            try{ 
                PreparedStatement psUpdateEmployee = null; 
                 
                String employeeID = request.getParameter("employee_loginID1"); 
                String employeephone = request.getParameter("employeePhone1"); 
                String employeeAddress = request.getParameter("employeeAddress1");
                                 
                String updateEmployeeSQL ="UPDATE Employee SET employee_PhoneNumber = ?, " 
                        + "employee_Address = ? " 
                        + "WHERE employee_loginID = '" + employeeID + "'" ; 
                        
                psUpdateEmployee = connection.prepareStatement(updateEmployeeSQL); 
                psUpdateEmployee.setString(1, employeephone); 
                psUpdateEmployee.setString(2, employeeAddress);
                 
                int i = psUpdateEmployee.executeUpdate(); 
                 
                if (i>=1) 
                    out.println("<script>alert('Profile Updated!'); " 
                            + "window.location.href='doctorUpdateProfile.jsp';</script>"); 
                else 
                    out.println("<script>alert('Profile cannot be updated'); " 
                            + "window.location.href='doctorUpdateProfile.jsp';</script>"); 
          } 
            catch(SQLException sqlExp) 
            { 
                request.setAttribute("error", sqlExp); 
                out.println(sqlExp); 
            } 
            finally 
            { 
                if (connection !=null) 
                    connection.close(); 
            } 
        %> 
        <br> 
    </body> 
</html>