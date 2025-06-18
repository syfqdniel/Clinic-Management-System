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
        <title>Treatment Registration Form</title>
      </head>
       <script>
    function validate2() {
        let treatmentID = document.forms["treatRegistration"]["treatmentID"].value;
        let treatmentIC = document.forms["treatRegistration"]["treatmentIC"].value;
        let treatmentDate = document.forms["treatRegistration"]["treatmentDate"].value;
        let treatmentTime = document.forms["treatRegistration"]["treatmentTime"].value;
        let treatmentIllness = document.forms["treatRegistration"]["treatmentIllness"].value;
        let employeeIC = document.forms["treatRegistration"]["employeeIC"].value;
       

        if (treatmentID === "") {
            alert("ID Number must be filled out");
            document.forms["treatRegistration"]["treatmentID"].select();
            document.forms["treatRegistration"]["treatmentID"].focus();
            return false;
        }

        if (treatmentIC === "") {
            alert("IC number must be filled out");
            document.forms["treatRegistration"]["treatmentIC"].select();
            document.forms["treatRegistration"]["treatmentIC"].focus();
            return false;
        }

        if (treatmentIllness === "") {
            alert("Illness must be confirm");
            document.forms["treatRegistration"]["treatmentIllness"].select();
            document.forms["treatRegistration"]["treatmentIllness"].focus();
            return false;
        }

        if (employeeIC === "") {
            alert("Doctor IC must be filled out");
            document.forms["treatRegistration"]["employeeIC"].select();
            document.forms["treatRegistration"]["employeeIC"].focus();
            return false;
        }

        if (!treatmentDate) {
            alert("Register date be filled out");
            document.forms["treatRegistration"]["treatmentDate"].select();
            document.forms["treatRegistration"]["treatmentDate"].focus();
            event.preventDefault();
            return false;
        }
        
        if (!treatmentTime) {
            alert("Register time must be filled out");
            document.forms["treatRegistration"]["treatmentTime"].select();
            document.forms["treatRegistration"]["treatmentTime"].focus();
            event.preventDefault();
            return false;
        }

        let today = new Date();
        let regDate = new Date(treatmentDate + "T" + treatmentTime);

        if (regDate < today) {
            alert("Registration date and time cannot be in the past");
            document.forms["treatRegistration"]["treatmentDate"].select();
            document.forms["treatRegistration"]["treatmentDate"].focus();
            document.forms["treatRegistration"]["treatmentTime"].select();
            document.forms["treatRegistration"]["treatmentTime"].focus();
            return false;
        }
        

        return true;
    }
</script>
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
        <center><h1>Treatment Registration</h1></center>
        <form name="treatRegistration" action="treatmentRegisterInsert.jsp" mtethod="post">
         <table>
            <tr>
                <td>Treatment ID: </td>
                <td><input type="text" name="treatmentID" size="20" class = "rcorners1"></td>
            </tr>
            <tr>
                <td>Patient IC : </td>
                <td><input type="text" name="treatmentIC" size="20" class = "rcorners1"></td>
            </tr>
            <tr> 
                <td>Treatment Date :</td>
                <td><input type="date" id="start-date" name="treatmentDate" class ="date-form" ></td> 
            </tr>
            <tr>
                <td>Treatment Time :</td>
                <td><input type="time" id="start-date" name="treatmentTime" class ="date-form" ></td> 
            </tr>

             <tr>
                <td>Illness : </td>
                <td><input type="text" name="treatmentIllness" size="50" class = "rcorners2"></td>
            </tr>
            <tr>
                <td>Employee IC : </td>
                <td><input type="tel" name="employeeIC" class = "rcorners1"></td>
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
        <center><a href="ClerkMenu.jsp" class="my-button">Back to Main Page</a></center>
        </div>
    </body>
</html>
