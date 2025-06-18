<%--  
    Document   : kursusDelete 
    Created on : 24 May, 2023, 3:27:23 PM 
    Author     : ISMAIL 
--%> 
 
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.SQLException"%> 
<%@include file="connectionDB.jsp" %> 
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
            width: 150px;
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
        <title>Delete Patient Form</title> 
    </head> 
    <script>
    function validate2() {
        
        let medicationCode = document.forms["deleteMedicationForm"]["medicationCode"].value;

        if (medicationCode === "") {
            alert("Please insert Medication Code");
            document.forms["deleteMedicationForm"]["medicationCode"].select();
            document.forms["deleteMedicationForm"]["medicationCode"].focus();
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
        <center><h1>Delete Medication</h1></center> 
        
        <center><form name="deleteMedicationForm" action="pharmacyMedicationDelete.jsp" method="get"> 
            Medication Code : <input type="text" name="medicationCode" class="rcorners1"> <br> 
            
            <input type="submit" name="delete" value="Delete" class="my-button" 
       onclick="if (validate2()&& confirm('Are you sure to delete this Medication ?'))  
                                {form.action='pharmacyMedicationDelete.jsp';} 
                                else {return false;}"> 
                </form></center> 
    <%   
        if (request.getParameter("delete") !=null  
               &&!(request.getParameter("medicationCode").equals("")))  
        { 
            Statement sDelete= null, sSelectCountDelete=null; 
            try 
            {    
                String DeleteMedication =  request.getParameter("medicationCode"); 
                sSelectCountDelete= connection.createStatement(); 
                sDelete = connection.createStatement(); 
                 
                // Check if dependent rows exist 
                String querySelectDeleteMedication = "SELECT COUNT(dispenseMedication_medicationCode) " 
                        + "FROM DispenseMedication WHERE dispenseMedication_medicationCode = '"+ DeleteMedication +"'"; 
             
                ResultSet resultSet = sSelectCountDelete.executeQuery(querySelectDeleteMedication); 
                resultSet.next(); 
                int dependentRows = resultSet.getInt(1); 
                out.println("<br>dependentRows " + dependentRows); 
                 
                // Display message based on the existence of dependent rows 
                if (dependentRows > 0) { 
                    out.println("<br><br>Cannot delete patient " + DeleteMedication + ".<br>" 
                            + "There are dependent patient "+DeleteMedication+" in the Treatment table."); 
                }  
                else  
                { 
                    String queryDeleteMedication = "DELETE FROM Medication " 
                                        + "WHERE medication_Code = '"+ DeleteMedication +"'"; 
                    //psDelete = connection.prepareStatement(queryDeleteKursus); 
                    //psDelete.setString(1, "kodKursus"); 
 
                    int i = sDelete.executeUpdate(queryDeleteMedication); 
                    
                    if(i == 1) 
                    { 
                       out.print("<br><br>Employee IC : " + DeleteMedication  
                               +"<br>Record Deleted Successfully");  
                    } 
                    else 
                    { 
                        out.println("<br><br>There is a problem in Deleting Record " 
                        + "because medication : " + DeleteMedication + " doesn't exit");  
                        out.print("<br>Check Manually in your Database"); 
                    } 
                }//end else 
            }//end try 
            catch(SQLException sqlExp) 
            { 
                request.setAttribute("error", sqlExp); 
                out.println(sqlExp); 
            } 
        }//end if 
    %> 
        <br> 
        <center><a href="PharmacyMenu.jsp" class="redirect-link">Back to Menu</a> <br></center> 
        </div>
    </body> 
</html>