<%-- 
    Document   : BuyerRegistration
    Created on : Mar 23, 2024, 11:32:23 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      .dropdown {
             border: none;
             border: 3px solid #aaa;
             border-color: rgba(2, 128, 144, 1);
             background: #fff;
             padding: 10px;
             border-radius: 8px;
             box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
             display: flex;
             flex-direction: column;
             gap: 15px;
      }
      .redirect-link {
            width: 50%;
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 10px 15px;
            color: white;
            background-color: rgba(0, 191, 178, 1); /* Bootstrap primary blue color */
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
        <title>Employee Registration Form</title>
      </head>
       <script>
   
        function validate2(){
            
            let Username = document.forms["EmployeeRegistration"]["username1"].value;
            let Password = document.forms["EmployeeRegistration"]["password1"].value;
            let Name = document.forms["EmployeeRegistration"]["employeeName1"].value;
            let IC = document.forms["EmployeeRegistration"]["employeeIc1"].value;
            let Date = document.forms["EmployeeRegistration"]["employeeDate1"].value;
            let Address = document.forms["EmployeeRegistration"]["employeeAddress1"].value;
            let Phone = document.forms["EmployeeRegistration"]["employeePhone1"].value;
            
            if(Username === ""){
                alert ("Login must be filled out");
                document.forms ["EmployeeRegistration"]["username1"].select();
                document.forms ["EmployeeRegistration"]["username1"].focus();
                return false;
            }
            
            if(Password === ""){
                alert ("Password must be filled out");
                document.forms ["EmployeeRegistration"]["password1"].select();
                document.forms ["EmployeeRegistration"]["password1"].focus();
                return false;

            }
            
            if(Name === ""){
                alert ("Name must be filled out");
                document.forms ["EmployeeRegistration"]["employeeName1"].select();
                document.forms ["EmployeeRegistration"]["employeeName1"].focus();
                return false;

            }
            
             if(IC === ""){
                alert ("IC number must be filled out");
                document.forms ["EmployeeRegistration"]["employeeIc1"].select();
                document.forms ["EmployeeRegistration"]["employeeIc1"].focus();
                return false;

            }
            
            if(!Date){
                alert ("Date must be filled out");
                document.forms ["EmployeeRegistration"]["employeeDate1"].select();
                document.forms ["EmployeeRegistration"]["employeeDate1"].focus();
                 event.preventDefault();
                return false;

            }
            
            if(Address === ""){
                alert ("Address must be filled out");
                document.forms ["EmployeeRegistration"]["employeeAddress1"].select();
                document.forms ["EmployeeRegistration"]["employeeAddress1"].focus();
                return false;

            }
            if(Phone === ""){
                alert ("Phone number must be filled out");
                document.forms ["EmployeeRegistration"]["clerkPhone"].select();
                document.forms ["EmployeeRegistration"]["clerkPhone"].focus();
                return false;

            }
            
            if( Phone.length < 10){
                alert ("Length of telephone number is not enough. Telephone number must be more than 10, " 
                        + Phone.length + " number/s only");
                document.forms ["EmployeeRegistration"]["employeePhone1"].select();
                document.forms ["EmployeeRegistration"]["employeePhone1"].focus();
                return false;
            }
            
            if( Phone.length > 13){
                alert ("Length of ttelephone number is to long. Telephone number must be less than 13, " 
                        + Phone.length + " number/s is not allowed");
                document.forms ["EmployeeRegistration"]["employeePhone1"].select();
                document.forms ["EmployeeRegistration"]["employeePhone1"].focus();
                return false;
            }
     
            return true;
        }
    </script>
    <body>
        <div class="container">
             <% 
            String employeeName = (String) session.getAttribute("employee_Name");

            if (employeeName != null) { 
                out.println("<h3>"+ "<center>" + " Employee Name: " + employeeName + "</center>" +"</h3>"+ "<br>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
        %>
        <center><h1>Employee Registration</h1></center>
        <form name="EmployeeRegistration" action="EmployeeRegisterInsert.jsp" method="post">
         <table>
            <tr>
                <td>Username: </td>
                <td><input type="text" name="username1" size="20" class = "rcorners1"></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="password1" size="20" class = "rcorners1"></td>
            </tr>
             <tr>
                <td>Name: </td>
                <td><input type="text" name="employeeName1" size="50" class = "rcorners1"></td>
            </tr>
             <tr>
                <td>IC Number: </td>
                <td><input type="text" name="employeeIc1" size="50" class = "rcorners1"></td>
            </tr>
            <tr>
                <td>Date of birth :</td>
                <td><input type="date" id="start-date" name="employeeDate1" class ="date-form" ></td> 
            </tr>
            <tr>
                <td>Gender :</td>
                <td><select id="options" name="EmployeeGender1" class="dropdown">
                     <option value="Male">Male</option>
                     <option value="Female">Female</option>
             </select></td> 
            </tr>
            <tr>
                <td>position :</td>
                <td><select id="options" name="employeePosition" class="dropdown">
                     <option value="d">Doctor</option>
                     <option value="p">Pharmacist</option>
             </select></td> 
            </tr>
             <tr>
                <td>Address: </td>
                <td><input type="text" name="employeeAddress1" size="50" class = "rcorners2"></td>
            </tr>
            <tr>
                <td>Telephone Number: </td>
                <td><input type="tel" name="employeePhone1" class = "rcorners1"></td>
            </tr>
         </table>
            <br>
        <center>
                <input type="submit" name="submitLogin1" value="Register"
                           onclick="return validate2()" class = "my-button">
                <input type="reset" name="reset1" value="Reset" 
                           class = "my-button">
        </center>
        </form>
        <center><a href="ClerkMenu.jsp" class="redirect-link">Back to Main Menu</a></center>
        </div>
    </body>
</html>
