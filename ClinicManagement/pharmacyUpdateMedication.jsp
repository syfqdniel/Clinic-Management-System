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
    <title>Medicine Update </title>
    <link rel="stylesheet" href="styles.css">
</head>
<script>
   
        function validate2(){
            
            let medCode = document.forms["updateMedicineForm"]["medication_code"].value;
            let medQuantity = document.forms["updateMedicineForm"]["quantity"].value;
            
            
            if(medCode === ""){
                alert ("Please enter Medication Code");
                document.forms ["updateMedicineForm"]["medCode"].select();
                document.forms ["updateMedicineForm"]["medCode"].focus();
                return false;
            }
            
          
            if(medQuantity < 0){
                alert ("Quantity cannot be negetive");
                document.forms ["updateMedicineForm"]["quantity"].select();
                document.forms ["updateMedicineForm"]["quantity"].focus();
                 event.preventDefault();
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
        
        <center><h1>Update Medication</h1></center> 
        <center>
            
        <form name="updateMedicineForm" action="pharmacyUpdateMedicationProcess.jsp" method="post">       
                <table id="medicationTable" >
                    <tr>
                    <br><td><b>Code and Name</b> </td>
                    <td><b>Quantity</b></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="medication_code" class="date-form">
                                <%

                                    try {
                                        
                                        Statement medication = connection.createStatement();
                                        
                                        String sql = "SELECT medication_Code, medication_Name FROM Medication";
                                        
                                        ResultSet rs = medication.executeQuery(sql);

                                        while(rs.next()) {
                                            String code = rs.getString("medication_Code");
                                            String name = rs.getString("medication_Name");
                                            out.println("<option value='" + code + "'>" + code + " - " + name + "</option>");
                                        }
                                    } catch(Exception e) {
                                    
                                        e.printStackTrace();
                                        
                                    } finally {
                                    
                                        if (connection != null) 
                                            connection.close();
                                    }
                                %>
                            </select>
                        </td>
                        <td>
                            <input type="number" name="quantity" min="1" max="100" value="1" step="1" class="date-form">
                        </td>
                    </tr>
                  
                </table>
                            <input type="submit" value="Update Stock" class="my-button" onclick="return validate2()">
                            
                            
      </form>                
        <br><a href="PharmacyMenu.jsp" class = "redirect-link" >Back to Menu</a><br>
    </div>
</body>
</html>
