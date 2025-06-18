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
        <title>Add Medication Form</title>
      </head>
      
       <script>
   
        function validate2(){
            
            let medCode = document.forms["addMedicine"]["medCode"].value;
            let medName = document.forms["addMedicine"]["medName"].value;
            let quantity = document.forms["addMedicine"]["quantity"].value;
            let medCategory = document.forms["addMedicine"]["medCategory"].value;
            
            
            if(medCode === ""){
                alert ("Please enter Medication Code");
                document.forms ["addMedicine"]["medCode"].select();
                document.forms ["addMedicine"]["medCode"].focus();
                return false;
            }
            
            if(medName === ""){
                alert ("Please enter Medication Name");
                document.forms ["addMedicine"]["medName"].select();
                document.forms ["addMedicine"]["medName"].focus();
                return false;

            }
            
            
            if(quantity < 0){
                alert ("Quantity cannot be negetive");
                document.forms ["addMedicine"]["quantity"].select();
                document.forms ["addMedicine"]["quantity"].focus();
                 event.preventDefault();
                return false;

            }
            
            if(medCategory === ""){
                alert ("Please Insert Medication category either D, S, A, SF, TS");
                document.forms ["addMedicine"]["clerkAddress"].select();
                document.forms ["addMedicine"]["clerkAddress"].focus();
                return false;

            }
           
           let letter =/^[A,D,S,SF,TS\s]+$/;
           
           if (!(medCategory.match (letter))){
                alert ("Input is not vaid. Please put either A, D, S, SF, TS");
                document.forms ["addMedicine"]["medCategory"].select();
                document.forms ["addMedicine"]["medCategory"].focus();
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
        <center><h1>Add Medicine</h1></center>
        <form name="addMedicine" action="pharmacyAddMedicationInsert.jsp" method="post">
         <table>
            <tr>
                <td><b>Medication Code : </b></td>
                <td><input type="text" name="medCode" size="20" class = "rcorners1"></td>
            </tr>
             <tr>
                 <td><b>Medication Name:</b> </td>
                <td><input type="text" name="medName" size="50" class = "rcorners1"></td>
            </tr>
            <tr>
                <td><b>Quantity :  </b></td>
                <td><input type="number" name="quantity" min="1" max="100" value="1" step="1" class="date-form"></td>
            </tr>
             <tr>
                 <td><b>Category :</b> </td>
                <td><input type="text" name="medCategory" size="50" class = "rcorners1"></td>
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
        <center><a href="PharmacyMenu.jsp" class="redirect-link">Back to Menu</a></center>
        </div>
    </body>
</html>
