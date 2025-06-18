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
    <title>Doctor Update Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<script>
    function validate2() {
        let employeeAddress1 = document.forms["ProfileUpdateForm"]["employeeAddress1"].value;
        let patientPhone = document.forms["ProfileUpdateForm"]["employeePhone1"].value;
       
        if (employeeAddress1 === "") {
            alert("IC Number must be filled out");
            document.forms["ProfileUpdateForm"]["employeeAddress1"].select();
            document.forms["ProfileUpdateForm"]["employeeAddress1"].focus();
            return false;
        }

  
        if(patientPhone === ""){
                alert ("Phone number must be filled out");
                document.forms ["ProfileUpdateForm"]["employeePhone1"].select();
                document.forms ["ProfileUpdateForm"]["employeePhone1"].focus();
                return false;

            }

        if (patientPhone.length < 10) {
            alert("Length of telephone number is not enough. Telephone number must be more than 10, " 
                    + patientPhone.length + " number/s only");
            document.forms["ProfileUpdateForm"]["employeePhone1"].select();
            document.forms["ProfileUpdateForm"]["employeePhone1"].focus();
            return false;
        }

        if (patientPhone.length > 12) {
            alert("Length of telephone number is too long. Telephone number must be less than 13, " 
                    + patientPhone.length + " number/s is not allowed");
            document.forms["ProfileUpdateForm"]["employeePhone1"].select();
            document.forms["ProfileUpdateForm"]["employeePhone1"].focus();
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
                out.println("Employee Name is not set in the session.<br>");
            }
        %>
        <center><h1>Employee Profile </h1></center>

        <form name="ProfileUpdateForm" action="doctorUpdateProfileProcess.jsp" method="post">
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
                            <input type="hidden" name="employee_loginID1" value="<%= employee_loginID1 %>"> 
                            <b>Employee ID: </b> <%= employee_loginID1 %><br> 
                            
                            <input type="hidden" name="employe_IC" value="<%= employee_IC %>"> 
                            <b>Employee IC: </b> <%= employee_IC %><br> 
                            
                            <input type="hidden" name="employee_Gender" value="<%= employee_Gender %>"> 
                            <b>Employee Gender: </b><%= employee_Gender %></br> 
                            
           <table>
               <tr>
                   <td><b>Employee Address:</b></td>  
                   <td><input type="text" name="employeeAddress1" value="<%= employee_Address %>" class = "rcorners1"><br></td>
               </tr>
               <tr>
                   <td><b>Phone Number:</b></td>  
                   <td><input type="text" name="employeePhone1" value="<%= employee_PhoneNumber %>" class = "rcorners1"><br></td>
               </tr>
               <tr>
                            <!-- button submit--> 
                            <td><input type="submit" name="update" value="Update" class = "my-button" onclick="return validate2()"></td>
               </tr>
          </table>
                        </form>
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
        <a href="DoctorMenu.jsp" class = "redirect-link" >Back to Menu</a><br>
    </div>
</body>
</html>
