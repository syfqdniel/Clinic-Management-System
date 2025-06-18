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
            width: 15%;
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
          
      
      .date-form {
             border: none;
             background: #fff;
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
    <title>Treatment Report</title> 
</head> 
<body> 
     <div class="container">
    <form method="get" action="treatmentReportPatient.jsp" method = "get">
   
          <%  
        String employeeName = (String) session.getAttribute("employee_name");

        if (employeeName != null) { 
            out.println("<center>"+"<h3>"+"Employee Name: " + employeeName + "<br>"+"</h3>"+"</center>");  
        } else {
            out.println("Employee Name is not set in the session.<br>");
        }
    %>
    <center><h1>Treatment Report</h1></center>  
       
    <h3>Patient IC</h3>
    <input type="text" name="patientIC" class="rcorners1" >
        
    <input type="submit" name = "submit" value="Display Report" class="my-button"><br>
   
    <%
        String patientIC = request.getParameter("patientIC");
        String submit = request.getParameter("submit");
        
        if(patientIC != null &&! submit.equals("")){
        
        
        try {
        
            Statement statement = connection.createStatement();
            
            String querySelectPatientIC = "SELECT treatment_IdTreatment, treatment_Date, treatment_Time, "
                                          + "treatment_Illness, treatment_EmployeeIC, treatment_PatientIC "
                                          + "FROM Treatment WHERE  treatment_PatientIC = '"+ patientIC +"' ";
                
                
                
           ResultSet treatmentRecord = statement.executeQuery(querySelectPatientIC); 
          
                out.println("<br><b>Record of all patient</b>");
                out.println("<table>"); 
                out.println("<tr>" +
                                "<th>Treatment ID</th>" +
                                "<th>Patient IC</th>" +
                                "<th>Treatment Date</th>" +
                                "<th>Treatment Time</th>" +
                                "<th>Illness</th>" +
                                "<th>Doctor IC</th>" +
                            "</tr>"); 
                
                while (treatmentRecord.next()) {
                
                    String treatmentID = treatmentRecord.getString("treatment_IdTreatment"); 
                    String treatmentDate = treatmentRecord.getString("treatment_Date"); 
                    String treatmentTime = treatmentRecord.getString("treatment_Time"); 
                    String treatmentIll = treatmentRecord.getString("treatment_Illness"); 
                    String treatmentEmIC = treatmentRecord.getString("treatment_EmployeeIC"); 
                    String treatmentPaIC = treatmentRecord.getString("treatment_PatientIC");

                    out.println("<tr>" +
                                    "<td>" + treatmentID + "</td>" +
                                    "<td>" + treatmentPaIC + "</td>" +
                                    "<td>" + treatmentDate + "</td>" +
                                    "<td><center>" + treatmentTime + "</center></td>" +
                                    "<td><center>" + treatmentIll + "</center></td>" +
                                    "<td><center>" + treatmentEmIC + "</center></td>" +
                                "</tr></br>"); 
                } 
                out.println("</table>");
                
            } catch(SQLException sqlExp) { 
            
            request.setAttribute("error", sqlExp); 
            out.println(sqlExp); 
            
        } finally { 
            if (connection != null) 
                connection.close(); 
        } 

        }else{
        out.println("");
        }
    %> 
    </form>
    <br><a href="DoctorMenu.jsp" class="redirect-link">Back to Menu</a><br> 
    </div>
</body> 
</html>
