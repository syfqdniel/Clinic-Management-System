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
    <center><title>Clerk Registration Form</title></center>
      </head>
       <script>
   
        function validate2(){
            
            let Username = document.forms["ClerkRegistration"]["username"].value;
            let Password = document.forms["ClerkRegistration"]["password"].value;
            let Name = document.forms["ClerkRegistration"]["clerkName"].value;
            let IC = document.forms["ClerkRegistration"]["clerkIc"].value;
            let  clerkDate = document.forms["ClerkRegistration"]["clerkDate"].value;
            let clerkAddress = document.forms["ClerkRegistration"]["clerkAddress"].value;
            let clerkPhone = document.forms["ClerkRegistration"]["clerkPhone"].value;
            
            if(Username === ""){
                alert ("Login must be filled out");
                document.forms ["ClerkRegistration"]["username"].select();
                document.forms ["ClerkRegistration"]["username"].focus();
                return false;
            }
            
            if(Password === ""){
                alert ("Password must be filled out");
                document.forms ["ClerkRegistration"]["password"].select();
                document.forms ["ClerkRegistration"]["password"].focus();
                return false;

            }
            
            if(Name === ""){
                alert ("Name must be filled out");
                document.forms ["ClerkRegistration"]["clerkName"].select();
                document.forms ["ClerkRegistration"]["clerkName"].focus();
                return false;

            }
            
             if(IC === ""){
                alert ("IC number must be filled out");
                document.forms ["ClerkRegistration"]["clerkIc"].select();
                document.forms ["ClerkRegistration"]["clerkIc"].focus();
                return false;

            }
            
            if(!clerkDate){
                alert ("Date must be filled out");
                document.forms ["ClerkRegistration"]["clerkDate"].select();
                document.forms ["ClerkRegistration"]["clerkDate"].focus();
                 event.preventDefault();
                return false;

            }
            
            if(clerkAddress === ""){
                alert ("Address must be filled out");
                document.forms ["ClerkRegistration"]["clerkAddress"].select();
                document.forms ["ClerkRegistration"]["clerkAddress"].focus();
                return false;

            }
            if(clerkPhone === ""){
                alert ("Phone number must be filled out");
                document.forms ["ClerkRegistration"]["clerkPhone"].select();
                document.forms ["ClerkRegistration"]["clerkPhone"].focus();
                return false;

            }
            
            if( clerkPhone.length < 10){
                alert ("Length of telephone number is not enough. Telephone number must be more than 10, " 
                        + clerkPhone.length + " number/s only");
                document.forms ["ClerkRegistration"]["clerkPhone"].select();
                document.forms ["ClerkRegistration"]["clerkPhone"].focus();
                return false;
            }
            
            if( clerkPhone.length > 13){
                alert ("Length of ttelephone number is to long. Telephone number must be less than 13, " 
                        + clerkPhone.length + " number/s is not allowed");
                document.forms ["ClerkRegistration"]["clerkPhone"].select();
                document.forms ["ClerkRegistration"]["clerkPhone"].focus();
                return false;
            }
            
            
     
            return true;
        }
    </script>
    <body>
        <div class="container">
        <h1>Clerk Registration</h1>
        <form name="ClerkRegistration" action="clerkRegisterInsert.jsp" method="post">
         <table>
            <tr>
                <td>Username: </td>
                <td><input type="text" name="username" size="20" class = "rcorners1"></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="password" size="20" class = "rcorners1"></td>
            </tr>
             <tr>
                <td>Name: </td>
                <td><input type="text" name="clerkName" size="50" class = "rcorners1"></td>
            </tr>
             <tr>
                <td>IC Number: </td>
                <td><input type="text" name="clerkIc" size="50" class = "rcorners1"></td>
            </tr>
            <tr>
                <td>Date of birth :</td>
                <td><input type="date" id="start-date" name="clerkDate" class ="date-form" required></td> 
            </tr>
            <tr>
                <td>Gender :</td>
                <td><select id="options" name="clerkGender" class="dropdown">
                     <option value="Male">Male</option>
                     <option value="Female">Female</option>
             </select></td> 
            </tr>
             <tr>
                <td>Address: </td>
                <td><input type="text" name="clerkAddress" size="50" class = "rcorners2"></td>
            </tr>
            <tr>
                <td>Telephone Number: </td>
                <td><input type="tel" name="clerkPhone" class = "rcorners1"></td>
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
        <center><a href="index.html" class="redirect-link">Back to Main Page</a></center>
        </div>
    </body>
</html>
