<%--  
    Document   : paymenList.jsp 
    Created on : 8 Jun, 2023, 1:04:40 PM 
    Author     : Syafiq 
--%> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.sql.Statement"%>
<%@include file="connectionDB.jsp"%> 
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
            width: 100%;
            max-width: 1100px; /* Optional: Set a maximum width */
            padding: 20px;
            background-color: #ffffff;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            border-radius: 10px;
            font-family: "Tahoma";
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
    <title>Payment List</title> 
</head> 
<body> 
     
    <div class="container">
        <center><h1>Treatment Detail & Payment</h1></center>  
   
    <br>
    
    <%  
        String employeeName = (String) session.getAttribute("employee_name");

        if (employeeName != null) { 
            out.println("<center>"+"<h3>"+"Employee Name: " + employeeName + "<br>"+"</h3>"+"</center>");  
        } else {
            out.println("Employee Name is not set in the session.<br>");
        }
    %>
    
   
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String todayDate = sdf.format(new Date());
        
        try {
            Statement statement = connection.createStatement();
            
            String querySelectId = "SELECT * FROM Employee WHERE employee_Name = '" + employeeName + "'"; 
            ResultSet patientRecordPayment = statement.executeQuery(querySelectId);
                
            if (patientRecordPayment.next()) {
            
                String querySelectDetail = "SELECT payment_IdPayment, payment_IdTreatment, payment_Status, "
                                             + "payment_TotalPayment, payment_Date, treatment_PatientIC, treatment_EmployeeIC, treatment_Illness, treatment_Date " +
                                              "FROM Treatment, Payment WHERE treatment_Date = '" + todayDate + "'";
                
                ResultSet detailRecord = statement.executeQuery(querySelectDetail); 
                
             
                    
                out.println("<br><b>Record of Treatment</b>");
                out.println("<table>"); 
                out.println("<tr>" +
                                "<th>Patient Payment ID</th>" +
                                "<th>Patient Treatment ID</th>" +
                                "<th>Patient Treatment Date</th>" +
                                "<th>Patient Patient IC</th>" +
                                "<th>Patient Illness</th>" +
                                "<th>Patient Doctor IC</th>" +
                                "<th>Patient Total Payment</th>" +
                                "<th>Patient Payment Date</th>" +
                                "<th>Patient Status Payment</th>" +
                                "<th>Patient Update Status</th>" +
                            "</tr>"); 
                
                while (detailRecord.next()) {
                
                        int payment_IdPayment = detailRecord.getInt("payment_IdPayment");
                        int payment_IdTreatment = detailRecord.getInt("payment_IdTreatment"); 
                        String treatment_Date = detailRecord.getString("treatment_Date"); 
                        String treatment_PatientIC = detailRecord.getString("treatment_PatientIC");
                        String treatment_Illness = detailRecord.getString("treatment_Illness");
                        String treatment_EmployeeIC = detailRecord.getString("treatment_EmployeeIC");
                        double payment_TotalPayment = detailRecord.getDouble("payment_TotalPayment");
                        String payment_Date = detailRecord.getString("payment_Date"); 
                        String payment_Status = detailRecord.getString("payment_Status");
                        
                    

                    out.println("<tr>" +
                                    "<td>" + payment_IdPayment + "</td>" +
                                    "<td>" + payment_IdTreatment + "</td>" +
                                    "<td>" + treatment_Date + "</td>" +
                                    "<td><center>" + treatment_PatientIC + "</center></td>" +
                                    "<td><center>" + treatment_Illness + "</center></td>" +
                                    "<td><center>" + treatment_EmployeeIC + "</center></td>" +
                                    "<td><center>" + payment_TotalPayment + "</center></td>" +
                                    "<td><center>" + payment_Date + "</center></td>" +
                                    "<td><center>" + payment_Status + "</center></td>" +
                                    "<td><button onclick=\"redirect("+ payment_IdTreatment +")\">Edit</button></td>"+
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

    <br><a href="PharmacyMenu.jsp" class="redirect-link">Back to Menu</a><br> 
    </div>
    <script>
            function redirect(payment_IdTreatment) {
                // Redirect to another page, passing treatmentID and patientIC as query parameters
                console.log('Redirecting with treatmentID:', payment_IdTreatment);
                window.location.href ='treatmentDetailUpdate.jsp?treatmentID='+ payment_IdTreatment;
            }
     </script>
</body> 
</html>
