<%--  
    Document   : studentSlipPeperiksaan.jsp 
    Created on : 8 Jun, 2023, 1:04:40 PM 
    Author     : Fatimah 
--%> 

<%@page import="java.sql.*"%> 
<%@include file="connectionDB.jsp"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 150vh;
            margin: 0;
            background: linear-gradient(45deg , rgba(2, 128, 144, 1), rgba(0, 191, 178, 1));
        }

        .container {
            width: 100%;
            max-width: 1000px;
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
            background-color: rgba(0, 191, 178, 1);
            border: none;
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            color: white;
            padding: 10px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 3px;
            cursor: pointer;
            border-radius: 5px;
        }
        .my-button:hover {
            background-color: rgba(2, 128, 144, 1);
        }
        .redirect-link {
            width: 15%;
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 10px 15px;
            color: white;
            background-color: rgba(0, 191, 178, 1);
            text-decoration: none;
            text-align: center;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            margin-bottom: 10px;
        }
        .redirect-link:hover {
            background-color: rgba(2, 128, 144, 1);
            transform: scale(1.05);
        }
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
        th {
            background-color: rgba(0, 191, 178, 1);
            color: #333;
            padding: 10px;
            text-align: center;
            border: 3px solid rgba(2, 128, 144, 1);
            color: white;
        }
        td {
            padding: 10px;
            border: 3px solid rgba(2, 128, 144, 1);
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>Dispense Medicine Report</title> 
</head> 
<body> 
    <div class="container">
        <form method="get" action="dispenseReport.jsp">
            <%  
                String employeeName = (String) session.getAttribute("employee_name");
                if (employeeName != null) { 
                    out.println("<center><h3>Employee Name: " + employeeName + "<br></h3></center>");  
                } else {
                    out.println("Employee Name is not set in the session.<br>");
                }
            %>
            <center><h1>Dispense Medicine Report</h1></center>  
            <h3>Patient IC</h3>
            <input type="text" name="patientIC" class="rcorners1">
            <input type="submit" name="submit" value="Display Report" class="my-button"><br>
            <%
                String patientIC = request.getParameter("patientIC");
                String submit = request.getParameter("submit");
                
                if (patientIC != null && submit != null) {
                   
                    PreparedStatement statement = null;
                    ResultSet treatmentRecord = null;
                    ResultSet dispenseRecord = null;
                    
                    try {
                        
                        
                        String querySelectPatientIC = "SELECT treatment_IdTreatment, treatment_Date, treatment_Time, "
                            + "treatment_Illness, treatment_EmployeeIC, treatment_PatientIC "
                            + "FROM Treatment WHERE treatment_PatientIC = ?";
                        
                        statement = connection.prepareStatement(querySelectPatientIC);
                        statement.setString(1, patientIC);
                        treatmentRecord = statement.executeQuery();
                        
                        if (treatmentRecord.next()) {
                            String querySelectDispense = "SELECT dispenseMedication_IdTreatment, treatment_IdTreatment, dispenseMedication_medicationCode, dispenseMedication_UsageMethod, dispenseMedication_Quantity, dispenseMedication_TotalPrice "
                                + "FROM DispenseMedication, Treatment WHERE dispenseMedication_IdTreatment = treatment_IdTreatment AND treatment_PatientIC = ?";
                            
                            statement = connection.prepareStatement(querySelectDispense);
                            statement.setString(1, patientIC);
                            dispenseRecord = statement.executeQuery();
                            
                            out.println("<br><b>Dispense Medicine Record</b>");
                            out.println("<table>"); 
                            out.println("<tr>" +
                                            "<th>Treatment ID</th>" +
                                            "<th>Patient IC</th>" +
                                            "<th>Medication Code</th>" +
                                            "<th>Usage Method</th>" +
                                            "<th>Quantity</th>" +
                                            "<th>Total Price</th>" +
                                        "</tr>"); 
                            
                            while (dispenseRecord.next()) {
                                String treatmentID = dispenseRecord.getString("dispenseMedication_IdTreatment");
                                String medicationCode = dispenseRecord.getString("dispenseMedication_medicationCode");
                                String usageMethod = dispenseRecord.getString("dispenseMedication_UsageMethod"); 
                                String quantity = dispenseRecord.getString("dispenseMedication_Quantity"); 
                                String price = dispenseRecord.getString("dispenseMedication_TotalPrice");

                                out.println("<tr>" +
                                                "<td>" + treatmentID + "</td>" +
                                                "<td>" + patientIC + "</td>" +
                                                "<td>" + medicationCode + "</td>" +
                                                "<td><center>" + usageMethod + "</center></td>" +
                                                "<td><center>" + quantity + "</center></td>" +
                                                "<td><center>" + price + "</center></td>" +
                                            "</tr>");
                            }
                            out.println("</table>");
                        } else {
                            out.println("No treatment record found for the provided Patient IC.");
                        }
                    } catch(SQLException sqlExp) { 
                        out.println(sqlExp); 
                    } finally {
                        try {
                            if (treatmentRecord != null) treatmentRecord.close();
                            if (dispenseRecord != null) dispenseRecord.close();
                            if (statement != null) statement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %> 
        </form>
        <br><a href="DoctorMenu.jsp" class="redirect-link">Back to Menu</a><br> 
    </div>
</body> 
</html>
