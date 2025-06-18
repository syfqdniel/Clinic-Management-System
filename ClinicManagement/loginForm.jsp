
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
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);/* Remove borders */
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
            border-radius: 8px;
            background: #ffffff;
            padding: 10px;
            width: 400px;
            height: 3px;
      }   
      
      
      /* Basic link style */
        .redirect-link {
            width: 50%;
            display: inline-block;
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
        <title>Login Supplier</title>
        <link rel="stylesheet" href="styles.css">
    </head>
     <script>
   
        function validate(){
            
            let login = document.forms["loginForm"]["username"].value;
            let password = document.forms["loginForm"]["password"].value;
        

            
            if(login === ""){
                alert ("Login must be filled out");
                document.forms ["loginForm"]["username"].select();
                document.forms ["loginForm"]["username"].focus();
                return false;
            }
            
            if(password === ""){
                alert ("Password must be filled out");
                document.forms ["loginForm"]["password"].select();
                document.forms ["loginForm"]["password"].focus();
                return false;

            }

        
            return true;
        }
    </script>
    <body>
        <div class="container">
            <center>
        <h1>Login Supplier</h1><br>
        <form name="loginForm" action="loginDisplay.jsp" method="post">
                
            <a>Username :</a>
            <input type="text" name="username" size="30" <% if (session.getAttribute("username") != null) {
                           out.println(session.getAttribute("username")); } %> class = "rcorners1">
                <br> 
                
                <br><a>Password :</a>
                <input type="password" name="password" size="30" class = "rcorners1">
                </br> 
            
                <input type="submit" name="submitLogin" value="Log in" 
                           onclick="return validate()" class="my-button">
                <input type="reset" name="Reset" value="reset" 
                           class="my-button">
                
                <br>
            
        </form>
            <a href="index.html" class="redirect-link">Back to Main Page </a>
            </center>
    </div>
    </body>
    
</html>