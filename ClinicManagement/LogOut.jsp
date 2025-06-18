
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <h1>You have been logged out</h1>
    <%
        
            session.removeAttribute("username");
            session.removeAttribute("login_loginID");
            session.removeAttribute("supplierCompany");
            session.removeAttribute("employee_Name");
            
            response.sendRedirect("index.html");
            
            
        %>
</body>
</html>