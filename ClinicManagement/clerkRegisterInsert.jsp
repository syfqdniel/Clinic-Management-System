<html>
    <head>
        <style>
         body {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            background-color: #9caf88;
        }
        .container {
            width: 80%;
            max-width: 600px; /* Optional: Set a maximum width */
            padding: 20px;
            background-color: #cbd5c0;
            border: 3px solid #aaa;
            border-radius: 10px;
            font-family: "Arial";
        }
        </style>
        <title>Insert Supplier Data Into MySQL</title>
    </head>
    <body>
         <div class="container">
             <center><h1>Registered Clerk</h1></center>
        <%@include file = "connectionDB.jsp" %>
        <%
           
            Statement stmtSQLlogin = null;
            Statement stmtSQLclerk = null;
            
            try{
            
            stmtSQLlogin = connection.createStatement();
            stmtSQLclerk = connection.createStatement();
            
            String username;
            String password;
            String clerkName;
            String clerkAddress;
            String clerkPhone;
            String clerkDob;
            String clerkGender;
            String clerkIc;
            
            
            //request parameter (form element name) from SupplierReistrationForm
            //and assign to the declared variable
           username = request.getParameter("username");
           password = request.getParameter("password");
           clerkName = request.getParameter("clerkName");
           clerkPhone = request.getParameter("clerkPhone");
           clerkAddress = request.getParameter("clerkAddress");
           clerkGender = request.getParameter("clerkGender");
           clerkDob = request.getParameter("clerkDate");
           clerkIc = request.getParameter("clerkIc");
           
           

           
           //declare sql query and create query
           
           String sqlInsertlogin = "INSERT INTO Login"+ "(login_loginID, login_password, "
                                    + "type)" + " VALUES " + 
                                    "('" + username + "' , '" + password + "' , 'c')";
                                   
           int  rowLogin = stmtSQLlogin.executeUpdate(sqlInsertlogin);
           
           if (rowLogin>0){
           
            out.println("<b>Log in Successfully"+"<br>");
            out.println("<b>Login : " + username + "</b>"+"<br>");
            out.println("<b>Password : " + password + "</b>"+"<br>");

            }else 
            
            out.println("<br>Log in Failed");
            
            String sqlInsertClerk =  "INSERT INTO Employee"+ "(employee_Name, "
                                         + "employee_Gender, "
                                         + "employee_PhoneNumber, employee_DateOfBirth, "
                                         + "employee_Address, employee_Position, "
                                         + "employee_loginID, employee_IC)" + "VALUES" + 
                                         "('" + clerkName + "' , '" + clerkGender + 
                                         "' , '" + clerkPhone + "' , '" 
                                         + clerkDob + "' , '" 
                                         + clerkAddress + "' , 'c' , '" + username + 
                                         "' , '" + clerkIc + "' )";
                                   
            int rowclerk = stmtSQLclerk.executeUpdate(sqlInsertClerk);
            
            if (rowclerk>0){
            
            out.println("<b>Data is successfully inserted into Data Base");
            out.println("<b>Buyer Name : " + clerkName + "</b>"+"<br>");
            out.println("<b>Buyer Address : " + clerkAddress + "</b>"+"<br>");
            out.println("<b>Buyer Telephones : " + clerkPhone+ "</b>"+"<br>");

            
            
            }else 
            
            out.println("<b>Data is failed inserted into Data Base");

            
            
            }
            catch (SQLException sqlerror){
            
            request.setAttribute("error: ", sqlerror);
            out.println(sqlerror);
            
           
            }
            
            finally {
               
                if (connection !=null);
                   connection.close();
            
            }
        
            %> 
            <br><a href="loginForm.jsp"> Back to Log In Form</a></br> 
    </body>
</div>
</html>