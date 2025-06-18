<%-- 
    Document   : connectionDB
    Created on : 23 May, 2023, 8:49:47 AM
    Author     : ISMAIL
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            Connection connection=null;
            try{
                //declaration and connection to database MySQL
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost/sql_079229";
                String username ="sql_079229";
                String passwordMYSQL ="LtXYTXGHccB5hbce";
                connection = DriverManager.getConnection(url,username,passwordMYSQL);
            }
            catch (Exception e){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                System.out.println(e.getMessage());
                out.println(e.getMessage());
            }
          
     %>
    </body>
</html>
