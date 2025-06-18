<%--  
    Document   : studentSlipPeperiksaan.jsp 
    Created on : 8 Jun, 2023, 1:04:40 PM 
    Author     : Fatimah 
--%> 
 
<%@page import="java.text.DecimalFormat"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connectionDB.jsp"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
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
            width: 100%;
            max-width: 1000px; /* Optional: Set a maximum width */
            padding: 20px;
            background-color: #ffffff;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            border-radius: 10px;
            font-family: "Tahoma";
        }    
        
        .my-button {
            width: 15%;
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
          
      
      .date-form {
             border: none;
             background: #fff;
             border: 1px solid rgba(2, 128, 144, 1);
             padding: 10px;
             border-radius: 8px;
             box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
             gap: 15px;
      }
      table {
            width: 100%;
            border: 3px solid rgba(2, 128, 144, 1);
            border-radius: 5px;
        }

        /* Header styles */
        th {
            background-color: rgba(0, 191, 178, 1);
            color: #333;
            padding: 10px;
            text-align: center;
            border: 3px solid rgba(2, 128, 144, 1);
            color: white;
        }

        /* Row styles */
        td {
            padding: 10px;
            border: 3px solid rgba(2, 128, 144, 1);
        }

        /* Alternating row colors */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Hover effect */
        tr:hover {
            background-color: #f1f1f1;
        }


        
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>Patient Report</title> 
</head> 
<body> 
    <div class="container">
        <center><h1>Patient Report</h1></center>  
    
    <form method="get" action="reportAllPatient.jsp" method = "get">
   
   
    <br>
    
    <% 
            String employeeName = (String) session.getAttribute("employee_Name");

            if (employeeName != null) { 
                out.println("<h3>"+ "<center>" + " Employee Name: " + employeeName + "</center>" +"</h3>"+ "<br>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
        %>
    
    <br><label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" class="date-form">
        
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" class="date-form">
        
        <button type="submit" class="my-button">Filter</button><br>
   
    <%
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        try {
            Statement statement = connection.createStatement();
            
            String querySelectEmployee = "SELECT * FROM Employee WHERE employee_Name = '" + employeeName + "'"; 
            ResultSet patientRecordPatient = statement.executeQuery(querySelectEmployee); 
                
            if (patientRecordPatient.next()) {
                String querySelectPatientIC = "SELECT patient_IC, patient_Name, patient_Gender, patient_PhoneNumber, patient_DateOfBirth, patient_RegistrationDate, patient_RegistrationTime, patient_Address, patient_Allergy " +
                                              "FROM Patient";
                
                if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
                    querySelectPatientIC += " WHERE patient_RegistrationDate BETWEEN '" + startDate + "' AND '" + endDate + "'";
                }
                
                ResultSet patientRecord = statement.executeQuery(querySelectPatientIC); 
          
                out.println("<br><b>Record of all patient</b>");
                out.println("<table>"); 
                out.println("<tr>" +
                                "<th>Patient IC</th>" +
                                "<th>Patient Name</th>" +
                                "<th>Patient Gender</th>" +
                                "<th>Patient Date of Birth</th>" +
                                "<th>Patient Registration Date</th>" +
                                "<th>Patient Registration Time</th>" +
                                "<th>Patient Address</th>" +
                                "<th>Patient Phone Number</th>" +
                            "</tr>"); 
                
                while (patientRecord.next()) {
                    String patientIC = patientRecord.getString("patient_IC"); 
                    String patientName = patientRecord.getString("patient_Name"); 
                    String patientGender = patientRecord.getString("patient_Gender"); 
                    String patientDoB = patientRecord.getString("patient_DateOfBirth"); 
                    String patientRD = patientRecord.getString("patient_RegistrationDate"); 
                    String patientRT = patientRecord.getString("patient_RegistrationTime");
                    String patientAddress = patientRecord.getString("patient_Address");
                    String patientPhone = patientRecord.getString("patient_PhoneNumber");

                    out.println("<tr>" +
                                    "<td>" + patientIC + "</td>" +
                                    "<td>" + patientName + "</td>" +
                                    "<td>" + patientGender + "</td>" +
                                    "<td><center>" + patientDoB + "</center></td>" +
                                    "<td><center>" + patientRD + "</center></td>" +
                                    "<td><center>" + patientRT + "</center></td>" +
                                    "<td><center>" + patientAddress + "</center></td>" +
                                    "<td><center>" + patientPhone + "</center></td>" +
                                "</tr></br>"); 
                } 
                out.println("</table>"); 
            }
        } catch(SQLException sqlExp) { 
            request.setAttribute("error", sqlExp); 
            out.println(sqlExp); 
        } finally { 
            if (connection != null) 
                connection.close(); 
        } 
    %> 
    </form>
    <br><a href="ClerkMenu.jsp" class="redirect-link">Back to Menu</a><br> 
    </div>
</body> 
</html>
