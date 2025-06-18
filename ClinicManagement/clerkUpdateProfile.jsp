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
            height: 100vh; /* Full viewport height */
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
        
        .my-button {
            width: 25%;
            background-color: rgba(0, 191, 178, 1); /* Green background */
            border: none; 
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            color: white; /* White text color */
            padding: 10px 32px; /* Padding */
            text-align: center; /* Center text */
            display: inline-block; /* Make it inline-block */
            font-size: 16px; /* Font size */
            margin: 10px 3px; /* Margin */
            cursor: pointer; /* Cursor on hover */
            border-radius: 5px; /* Rounded corners */
            text-align: center;
      }
      
       .my-button:hover {
            background-color: rgba(2, 128, 144, 1); /* Darker blue on hover */
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
      
      .rcorners2 {
            border: none;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background: #ffffff;
            padding: 10px;
            width: 400px;
            height: 100px;
      }   
      
      .redirect-link {
            width: 20%;
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 10px 15px;
            color: white;
            background-color: rgba(0, 191, 178, 1); /* Bootstrap primary blue color */
            text-align: center;
            text-decoration: none;
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
    <title>Clerk Update Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
   <script>
   
        function validate2(){
            
            let Phone = document.forms["ProfileUpdateForm"]["employeeAddress1"].value;
            let Add = document.forms["ProfileUpdateForm"]["employeePhone1"].value;

            
            if(Phone === ""){
                alert ("Address must be filled out");
                document.forms ["ProfileUpdateForm"]["employeePhone1"].select();
                document.forms ["ProfileUpdateForm"]["employeePhone1"].focus();
                return false;
            }
            
            if(Add === ""){
                alert ("Phone number must be filled out");
                document.forms ["ProfileUpdateForm"]["employeeAddress1"].select();
                document.forms ["ProfileUpdateForm"]["employeeAddress1"].focus();
                return false;

            }
            if( Phone.length < 10){
                alert ("Length of telephone number is not enough. Telephone number must be more than 10, " 
                        + Phone.length + " number/s only");
                document.forms ["ProfileUpdateForm"]["employeePhone1"].select();
                document.forms ["ProfileUpdateForm"]["employeePhone1"].focus();
                return false;
            }
            
            if( Phone.length > 12){
                alert ("Length of ttelephone number is to long. Telephone number must be less than 13, " 
                        + Phone.length + " number/s is not allowed");
                document.forms ["ProfileUpdateForm"]["employeePhone1"].select();
                document.forms ["ProfileUpdateForm"]["employeePhone1"].focus();
                return false;
            }
            return true;
        }
        
        </script>
<body>
    <div class="container">
        <center><h1>Employee Profile </h1></center>
        <%

            // Check session attributes
            String employeeName = (String) session.getAttribute("employee_Name");

            if (employeeName != null) { 
                out.println("<b>Employee Name : </b>" + employeeName + "<br>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
        %> 

        <form name="ProfileUpdateForm" action="clerkUpdateProfileProcess.jsp" method="post">
        <%   
            if (employeeName != null) {
                try { 
                    Statement statement = connection.createStatement(); 
                    String querySelectEmployee = "SELECT * FROM Employee WHERE employee_name = '" + employeeName + "'";
                    
                    ResultSet rsEmployee = statement.executeQuery(querySelectEmployee); 

                    if (rsEmployee.next()) { 
                        // Declare and get value from attribute in table Employee 
                        String employee_IC = rsEmployee.getString("employee_IC"); 
                        String employee_Name = rsEmployee.getString("employee_Name"); 
                        String employee_Gender = rsEmployee.getString("employee_Gender"); 
                        String employee_PhoneNumber = rsEmployee.getString("employee_PhoneNumber");
                        String employee_DateOfBirth = rsEmployee.getString("employee_DateOfBirth");
                        String employee_Address = rsEmployee.getString("employee_Address");
                        String employee_Position = rsEmployee.getString("employee_Position");
                        String employee_loginID1 = rsEmployee.getString("employee_loginID");
                        
        %> 
        <table>
            <tr>
                <td> <b>Employee ID : </b> <%= employee_loginID1 %></td> 
                <td> <input type="hidden" name="employee_loginID1" value="<%= employee_loginID1 %>"></td> 
            </tr>     
     
               
                            
                            <input type="hidden" name="employe_IC" value="<%= employee_IC %>"> 
                            <b>Employee IC : </b> <%= employee_IC %><br> 
                            
                            <input type="hidden" name="employee_Gender" value="<%= employee_Gender %>"> 
                            <b>Employee Gender : </b><%= employee_Gender %></br> 

               <tr>
                   <td><b>Employee Address :</b></td>  
                   <td><input type="text" name="employeeAddress1" value="<%= employee_Address %>" class = "rcorners2"><br></td>
               </tr>
               <tr>
                   <td><b>Telephone :</b></td>  
                   <td><input type="text" name="employeePhone1" value="<%= employee_PhoneNumber %>" class = "rcorners1"><br></td>
               </tr>
               
          </table>
                <br><td><input type="submit" name="update" value="Update" onclick= "return validate2()"class = "my-button"></td>        
        <% 
                    } else {
                        out.println("No employee found with name: " + employeeName + "<br>");
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
        <a href="ClerkMenu.jsp" class = "redirect-link" >Back to Menu</a><br>
    </div>
</body>
</html>
