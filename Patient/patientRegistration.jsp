<%-- 
    Document   : BuyerRegistration
    Created on : Mar 23, 2024, 11:32:23 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            width: 30%;
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
        <title>Patient Registration Form</title>
      </head>
       <script>
    function validate2() {
        let patientIC = document.forms["PatientRegistration"]["patientIC"].value;
        let patientName = document.forms["PatientRegistration"]["patientName"].value;
        let patientAddress = document.forms["PatientRegistration"]["patientAddress"].value;
        let patientPhone = document.forms["PatientRegistration"]["patientPhone"].value;
        let patientDate = document.forms["PatientRegistration"]["patientDate"].value;
        let patientRegisterDate = document.forms["PatientRegistration"]["patientRegisterDate"].value;
        let patientRegisterTime = document.forms["PatientRegistration"]["patientRegisterTime"].value;
        let patientAllergy = document.forms["PatientRegistration"]["patientAllergy"].value;

        if (patientIC === "") {
            alert("IC Number must be filled out");
            document.forms["PatientRegistration"]["patientIC"].select();
            document.forms["PatientRegistration"]["patientIC"].focus();
            return false;
        }

        if (patientName === "") {
            alert("Name must be filled out");
            document.forms["PatientRegistration"]["patientName"].select();
            document.forms["PatientRegistration"]["patientName"].focus();
            return false;
        }

        if (patientAddress === "") {
            alert("Address must be filled out");
            document.forms["PatientRegistration"]["patientAddress"].select();
            document.forms["PatientRegistration"]["patientAddress"].focus();
            return false;
        }

        if (patientPhone === "") {
            alert("Phone number must be filled out");
            document.forms["PatientRegistration"]["patientPhone"].select();
            document.forms["PatientRegistration"]["patientPhone"].focus();
            return false;
        }

        if (!patientDate) {
            alert("Date of birth must be filled out");
            document.forms["PatientRegistration"]["patientDate"].select();
            document.forms["PatientRegistration"]["patientDate"].focus();
            event.preventDefault();
            return false;
        }

        if (!patientRegisterDate) {
            alert("Registration date must be filled out");
            document.forms["PatientRegistration"]["patientRegisterDate"].select();
            document.forms["PatientRegistration"]["patientRegisterDate"].focus();
            return false;
        }

        let today = new Date();
        let regDate = new Date(patientRegisterDate + "T" + patientRegisterTime);

        if (regDate < today) {
            alert("Registration date and time cannot be in the past");
            document.forms["PatientRegistration"]["patientRegisterDate"].select();
            document.forms["PatientRegistration"]["patientRegisterDate"].focus();
            return false;
        }
        
        if(patientPhone === ""){
                alert ("Phone number must be filled out");
                document.forms ["PatientRegistration"]["patientPhone"].select();
                document.forms ["PatientRegistration"]["patientPhone"].focus();
                return false;

            }

        if (patientPhone.length < 10) {
            alert("Length of telephone number is not enough. Telephone number must be more than 10, " 
                    + patientPhone.length + " number/s only");
            document.forms["PatientRegistration"]["patientPhone"].select();
            document.forms["PatientRegistration"]["patientPhone"].focus();
            return false;
        }

        if (patientPhone.length > 13) {
            alert("Length of telephone number is too long. Telephone number must be less than 13, " 
                    + patientPhone.length + " number/s is not allowed");
            document.forms["PatientRegistration"]["patientPhone"].select();
            document.forms["PatientRegistration"]["patientPhone"].focus();
            return false;
        }
        
          if(patientAllergy === ""){
                alert ("If have no allergy please type 'NONE'");
                document.forms ["PatientRegistration"]["patientAllergy"].select();
                document.forms ["PatientRegistration"]["patientAllergy"].focus();
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
        <center><h1>Patient Registration</h1></center>
        <form name="PatientRegistration" action="patientRegistrationInsert.jsp" method="post">
         <table>
            <tr>
                <td>IC Number: </td>
                <td><input type="text" name="patientIC" size="50" class = "rcorners1"></td>
            </tr>
             <tr>
                <td>Name: </td>
                <td><input type="text" name="patientName" size="50" class = "rcorners1"></td>
            </tr>
             <tr>
                <td>Address: </td>
                <td><input type="text" name="patientAddress" size="50" class = "rcorners2"></td>
            </tr>
            <tr>
                <td>Telephone Number: </td>
                <td><input type="tel" name="patientPhone" class = "rcorners1"></td>
            </tr>
            <tr>
                <td>Date of birth :</td>
                <td><input type="date" id="start-date" name="patientDate" class ="date-form" ></td> 
            </tr>
            <tr>
                <td>Registration Date :</td>
                <td><input type="date" id="start-date" name="patientRegisterDate" class ="date-form" ></td> 
            </tr>
            <tr>
                <td>Registration Time:</td>
                <td><input type="time" id="start-date" name="patientRegisterTime" class ="date-form" ></td> 
            </tr>
            <tr>
                <td>Gender :</td>
                <td><select id="options" name="patientGender" class="dropdown">
                     <option value="Male">Male</option>
                     <option value="Female">Female</option>
             </select></td> 
            </tr>
              <tr>
                <td>Allergy : </td>
                <td><input type="text" name="patientAllergy" size="50" class = "rcorners2"></td>
            </tr>
         </table>
            <br>
        <center>
                <input type="submit" name="submitLogin" value="Register"
                           onclick="return validate2()" class = "my-button">
                <input type="reset" name="reset" value="Reset" 
                           class = "my-button">
        </center>
        </form>
        <center><a href="ClerkMenu.jsp" class="redirect-link">Back to Menu</a></center>
        </div>
    </body>
</html>
