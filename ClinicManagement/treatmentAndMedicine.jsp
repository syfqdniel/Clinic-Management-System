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
            width: 100%;
            max-width: 1000px; /* Optional: Set a maximum width */
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
            width: 50px;
            height: 3px;
      }   
      
      .rcorners2 {
            border: none;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            border-radius: 8px;
            background: #ffffff;
            padding: 10px;
            width: 100px;
            height: 3px;
      } 
    </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Menu</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
        <form name="dispenseMedicine" action="treatmentDispenseMedicine.jsp" method="post">
            <center><h1>Patient Record</h1></center>
         <% 
          
           String employeeName = (String) session.getAttribute("employee_name");

           if (employeeName != null) { 
            out.println("");  
           } else {
            out.println("Employee Name is not set in the session.<br>");
          }
          
          String DoctorIC = (String) session.getAttribute("employee_IC");
          
            if (DoctorIC != null) {
            try { 
            
                Statement statement = connection.createStatement();
                String querySelectDoctor = "SELECT * FROM Employee " 
                        + "where employee_IC = '" + DoctorIC+"' "; 
                 
                ResultSet treatment = statement.executeQuery(querySelectDoctor); 
                
                if (treatment.next())  
                { 
                    //declare and get value from attribute in table student 
                String treatDoctorIC = treatment.getString("employee_IC"); 
 
                //utk mengira bilangan matrik pelajar di dalam table markah  
                //berdasarkan matrik 
                //check wheather the student matric enroll in course  
                String querySelectCountDoctor = "SELECT COUNT(treatment_EmployeeIC) " 
                        + "AS countDoctor " 
                        + "FROM Treatment " 
                        + "WHERE treatment_EmployeeIC ='"+ treatDoctorIC +"'"; 
                 
                ResultSet resultSetCountDoctor = statement.executeQuery(querySelectCountDoctor); 
                
                resultSetCountDoctor.next(); 
                
                int countDoctor = resultSetCountDoctor.getInt("countDoctor"); 
                 
                if (countDoctor == 0)  
                { 
                    out.println("<br>No record, Student must enroll the course first."); 
                } //end if 
                else  
                {   
                    //utk paparkan matrik dan nama pelajar berdasarkan  
                    //matrik yang dimasukkan oleh pengguna  
                    String querySelectDoctor1 ="SELECT employee_IC, " 
                            + "employee_Name " 
                            + "FROM Employee  " 
                            + "WHERE employee_IC  = '"+  DoctorIC  +"'"; 
                     
                    ResultSet rsDoctor = statement.executeQuery(querySelectDoctor1); 
                     
                    if(rsDoctor.next()) 
                    { 
                        String doctorIcNumber= rsDoctor.getString("employee_IC"); 
                        String doctorName = rsDoctor.getString("employee_Name"); 
                         
                        out.println("<br>"+" <b>Doctor Information </b>"+"</br>"+"<br>");
                        out.println("<b>IC Number: </b>" + doctorIcNumber); 
                        out.println("<br><b>Doctor name : </b>"+doctorName+ "</br>"); 
                    } 
                     
                    //untuk papar maklumat markah berdasarkan matrik pelajar 
                    String querySelectTreatmentPatient = "SELECT treatment_IdTreatment, " 
                        + "treatment_PatientIC, treatment_Date, treatment_Time, " 
                        + "treatment_Illness, " 
                        + "treatment_EmployeeIC, patient_PhoneNumber, patient_Allergy " 
                        + "FROM Treatment, Patient " 
                        + "WHERE treatment_EmployeeIC = '" + DoctorIC +"' " 
                        + "AND treatment_PatientIC = patient_IC"; 
                 
                    ResultSet treatmentRecord =  
                    statement.executeQuery(querySelectTreatmentPatient); 
              
                    
                    %>
            
            <b>Treatment ID : </b>
            <input type="text" name="idTreatment" class="rcorners1">
            <b>Patient IC</b>
            <input type="text" name="patientIC" class="rcorners2">
            <input type="submit" name="dispense" value="Dispense" class="my-button">
            
            <%
                out.println("<br><b>Patient </b></br>");
                    out.println("<table>"); 
                    out.println("<br><tr>" 
                                    + "<th>Treatment ID</th>" 
                                    + "<th>Patient IC</th>" 
                                    + "<th>Treatment Date</th>" 
                                    + "<th>Treatment Time</th>" 
                                    + "<th>Allergy</th>" 
                                    + "<th>Illness</th>" 
                                    + "<th>Patient Number</th>"
                            + "</tr> ");
                            
                            
                     
                    //declare jumlahPoint, jumlahPointKeseluruhan 
                    while (treatmentRecord.next())  
                    { 
                        //declare and get value from attribute in table kursus 
                        String treatmentID = treatmentRecord.getString("treatment_IdTreatment");
                        String PatientIC = treatmentRecord.getString("treatment_PatientIC"); 
                        String treatmentDate = treatmentRecord.getString("treatment_Date"); 
                        String  treatmentTime = treatmentRecord.getString("treatment_Time"); 
                        String  patientAllergy = treatmentRecord.getString("patient_Allergy"); 
                        String treatmentIllness = treatmentRecord.getString("treatment_Illness"); 
                        String  patientPhone = treatmentRecord.getString("patient_PhoneNumber"); 
 
                        //kira jumlah point dan keseluruhan point bagi pelajar tertentu 
 
                        //paparkan rekod kursus di dalam table kursus 
                        out.println("<tr>" 
                                + "<td>"+treatmentID + "</td>" 
                                + "<td>" + PatientIC +"</td>" 
                                + "<td>" + treatmentDate +"</td>" 
                                + "<td><center>" + treatmentTime +"</center></td>" 
                                + "<td><center>"+ patientAllergy+"</center></td>" 
                                + "<td><center>"+ treatmentIllness+"</center></td>" 
                                + "<td><center>" + patientPhone +"</center></td>"
                                + "</tr>"); 
                    } 
                    out.println("</table>"); 
 
                
                    //<%= String.format("%.2f", bmi) 
                }//end else 
                }//end if 
            }//end try  
            catch(SQLException sqlExp) 
            { 
                request.setAttribute("error", sqlExp); 
                out.println(sqlExp); 
            } 
            finally { 
                if (connection != null) 
                    connection.close(); 
            } 

             }else{
             
             out.println("No record of Doctor");
             }
     
        %>
            <br><a href="DoctorMenu.jsp" class = "redirect-link" >Back to Menu</a><br>
        </form>
        </div>
    
        
        
        </body>
        </html>