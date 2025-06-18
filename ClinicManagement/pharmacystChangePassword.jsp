<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectionDB.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <style>
       body {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 150vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            background: linear-gradient(45deg , rgba(2, 128, 144, 1), rgba(0, 191, 178, 1 ));
        }
        
        .container {
            width: 80%;
            max-width: 600px; /* Optional: Set a maximum width */
            padding: 20px;
            background-color: #ffffff;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            border-radius: 10px;
            font-family: "Tahoma";
        }  
        
        .rcorners1 {
            border: none;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background: #ffffff;
            padding: 10px;
            width: 400px;
            height: 3px;
      }   
      
       
      
      .date-form {
             border: none;
             background: #fff;
             border: 3px solid #aaa;
             border-color: rgba(2, 128, 144, 1);
             padding: 10px;
             border-radius: 8px;
             box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
             display: flex;
             flex-direction: column;
             gap: 15px;
      }
        .my-button {
            background-color: rgba(0, 191, 178, 1); /* Green background */
            border: none; 
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            color: white; /* White text color */
            padding: 10px 32px; /* Padding */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make it inline-block */
            font-size: 16px; /* Font size */
            margin: 10px 3px; /* Margin */
            cursor: pointer; /* Cursor on hover */
            border-radius: 5px; /* Rounded corners */
      }
      
       .my-button:hover {
            background-color: rgba(2, 128, 144, 1); /* Darker blue on hover */
      }
            /* Basic link style */
        .redirect-link {
            width: 20%;
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 10px 15px;
            color: white;
            background-color: rgba(0, 191, 178, 1); /* Bootstrap primary blue color */
            text-decoration: none;
            text-align: center;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            margin-bottom: 10px;
            
        }

        /* Hover effect */
        .redirect-link:hover {
            background-color: rgba(2, 128, 144, 1); /* Darker blue */
            transform: scale(1.05);
        }

        /* Focus effect */
        .redirect-link:focus {
           outline: none;
           box-shadow: 0 0 5px #0056b3;
        }

        /* Active effect */
        .redirect-link:active {
           background-color: #004085; /* Even darker blue */
           transform: scale(0.95);
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Change Password</title>
</head>
<script>
   
        function validate2(){
            
            let employeePass1 = document.forms["ChangePassword"]["employeePass1"].value;
            let employeePass2 = document.forms["ChangePassword"]["employeePass2"].value;
            let employeePass3 = document.forms["ChangePassword"]["employeePass3"].value;

            
            if(employeePass2 === ""){
                alert ("Password must be filled out");
                document.forms ["ChangePassword"]["employeePass2"].select();
                document.forms ["ChangePassword"]["employeePass2"].focus();
                return false;
            }
            
            if(employeePass3 === ""){
                alert ("Please confirm your password ");
                document.forms ["ChangePassword"]["employeePass3"].select();
                document.forms ["ChangePassword"]["employeePass3"].focus();
                return false;

            }
            if(employeePass1 === ""){
                alert ("Please insert your current password");
                document.forms ["ChangePassword"]["employeePass1"].select();
                document.forms ["ChangePassword"]["employeePass1"].focus();
                return false;

            }
     
            return true;
        }
    </script>
<body>
    <div class="container">
          <% 
            String employeeName = (String) session.getAttribute("employee_name");

            if (employeeName != null) { 
                out.println("<h3>"+ "<center>" + " Employee Name: " + employeeName + "</center>" +"</h3>");  
            } else {
                out.println("Employee Name is not set in the session.");
            }
        %>
        <center><h1>Employee Password </h1></center>
            <%

            // Check session attributes
            String LoginId = (String) session.getAttribute("username");

            if (LoginId != null) { 
                out.println("");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
        %> 
        <form name="ChangePassword" action="pharmacystChangePasswordInsert.jsp" method="post">
        <%   
            if (LoginId != null) {
                try { 
                    Statement statement = connection.createStatement(); 
                    String querySelectEmployee = "SELECT * FROM Login WHERE login_loginID = '" + LoginId + "'";
                    
                    ResultSet rsEmployee = statement.executeQuery(querySelectEmployee); 

                    if (rsEmployee.next()) { 
                        // Declare and get value from attribute in table Employee 
                        String loginID = rsEmployee.getString("login_loginID"); 
                        String Password = rsEmployee.getString("login_password"); 
                        String Type = rsEmployee.getString("type"); 
                        
                        
        %> 
        
                        <input type="hidden" name="LoginEmployee" value="<%= loginID %>"> 
                            <b>Employee ID:  </b><%= loginID %><br> 
                            <table>
                                <tr>
                                    <td><b>Current Password:<b/></td>  
                                    <td><input type="password" name="employeePass1" value="<%= Password %>" class="rcorners1"><br></td>
                                </tr>
                                <tr>
                                    <td><b>New Password :</b></td>  
                                    <td><input type="password" name="employeePass2" value="<%= Password %>"class="rcorners1"><br></td>
                                </tr>
                                <tr>
                                    <td><b>Confirm Password:</b></td> 
                                    <td><input type="password" name="employeePass3" value="<%= Password %>"class="rcorners1"><br></td>
                                </tr>
                            </table>
                            
                            <input type="submit" name="update" value="Update" class="my-button" onclick="return validate2()"> 
                        </form>
        <% 
                    } else {
                        out.println("No employee found with name: " + LoginId + "<br>");
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
            } else {
                out.println("Employee login ID is not set in the session, skipping database query.<br>");
            }
        %>  
        </form> 
        <a href="PharmacyMenu.jsp" class="redirect-link">Back to Menu</a><br>
    </div>
</body>
</html>
