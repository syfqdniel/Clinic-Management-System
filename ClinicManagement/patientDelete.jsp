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
        <title>Delete Patient Form</title> 
    </head> 
    <script>
    function validate2() {
        
        let patientIC = document.forms["deletePatientForm"]["patientIC"].value;

        if (patientIC === "") {
            alert("Please insert patient IC");
            document.forms["deletePatientForm"]["patientIC"].select();
            document.forms["deletePatientForm"]["patientIC"].focus();
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
        <center><h1>Delete Patient</h1></center> 
        <center><form name="deletePatientForm" action="patientDelete.jsp" method="get"> 
            Patient IC: <input type="text" name="patientIC" class="rcorners1"> <br> 
            
            <input type="submit" name="Delete" value="Delete"  class="my-button" 
            onclick="if (validate2()&&confirm('Are you sure to delete this patient ?'))  
                                {form.action='patientDelete.jsp';} 
                                else {return false;}"> 
                             </form></center> 
    <%   
        if (request.getParameter("Delete") !=null  
               &&!(request.getParameter("patientIC").equals("")))  
        { 
            Statement sDelete= null, sSelectCountDelete=null; 
            try 
            {    
                String DeletePatient =  request.getParameter("patientIC"); 
                sSelectCountDelete= connection.createStatement(); 
                sDelete = connection.createStatement(); 
                 
                // Check if dependent rows exist 
                String querySelectDeletePatient = "SELECT COUNT(treatment_PatientIC) " 
                        + "FROM Treatment WHERE treatment_PatientIC = '"+ DeletePatient +"'"; 
             
                ResultSet resultSet = sSelectCountDelete.executeQuery(querySelectDeletePatient); 
                resultSet.next(); 
                int dependentRows = resultSet.getInt(1); 
                out.println("<br>dependentRows " + dependentRows); 
                 
                // Display message based on the existence of dependent rows 
                if (dependentRows > 0) { 
                    out.println("<br><br>Cannot delete patient " + DeletePatient + ".<br>" 
                            + "There are dependent patient "+DeletePatient+" in the Treatment table."); 
                }  
                else  
                { 
                    String queryDeletePatient = "DELETE FROM Patient " 
                                        + "WHERE patient_IC = '"+ DeletePatient +"'"; 
                    //psDelete = connection.prepareStatement(queryDeleteKursus); 
                    //psDelete.setString(1, "kodKursus"); 
 
                    int i = sDelete.executeUpdate(queryDeletePatient); 
                    if(i == 1) 
                    { 
                       out.print("<br><br>Employee IC : " + DeletePatient  
                               +"<br>Record Deleted Successfully");  
                    } 
                    else 
                    { 
                        out.println("<br><br>There is a problem in Deleting Record " 
                        + "because Employee IC: " + DeletePatient + " doesn't exit");  
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
        <center><a href="ClerkMenu.jsp" class="my-button">Back To Menu</a> <br></center> 
        </div>
    </body> 
</html>