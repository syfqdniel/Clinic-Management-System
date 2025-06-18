<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectionDB.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
      
    </style>
    <script>
        function addRow() {
            var table = document.getElementById("medicationTable");
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var cell1 = row.insertCell(0);
            var selectList = document.createElement("select");
            selectList.name = "medication_code[]";

            <% 
                try {
                    Statement medication1 = connection.createStatement();
                    String sql1 = "SELECT medication_Code, medication_Name FROM Medication";
                    ResultSet rs1 = medication1.executeQuery(sql1);
                    while(rs1.next()) {
                        String code1 = rs1.getString("medication_Code");
                        String name1 = rs1.getString("medication_Name");
            %>
            var option = document.createElement("option");
            option.value = "<%= code1 %>";
            option.text = "<%= code1 %> - <%= name1 %>";
            selectList.appendChild(option);
            <% 
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    // connection.close();
                }
            %>
            cell1.appendChild(selectList);

            var cell2 = row.insertCell(1);
            var quantity = document.createElement("input");
            quantity.type = "number";
            quantity.name = "quantity[]";
            cell2.appendChild(quantity);

            var cell3 = row.insertCell(2);
            var instructions = document.createElement("textarea");
            instructions.name = "usage_instructions[]";
            instructions.rows = 4;
            instructions.cols = 50;
            cell3.appendChild(instructions);

            var cell4 = row.insertCell(3);
            var price = document.createElement("input");
            price.type = "number";
            price.name = "price[]";
            cell4.appendChild(price);
        }
    </script>
</head>
<body>
    <div class="container">
        <form action="treatmentDispenseInsert.jsp" method="post">
        <%
            if (request.getParameter("dispense") != null){
                String id = request.getParameter("idTreatment");
                session.setAttribute("idTreatment", id);
            }
            
            String employeeName = (String) session.getAttribute("employee_name");
            if (employeeName != null) { 
                out.println("<center>"+"<h3>"+"Employee : " + employeeName + "</h3>"+"</center>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
            
            String treatmentID = request.getParameter("idTreatment");
            String patientIC = request.getParameter("patientIC");
          
            if (treatmentID != null && !patientIC.equals("")) {
                try {
                    Statement statement = connection.createStatement();
                    String querySelectTreatment = "SELECT * FROM Treatment, Patient WHERE treatment_IdTreatment = '" + treatmentID +"' AND patient_IC = '" + patientIC +"'"; 
                    ResultSet treatment = statement.executeQuery(querySelectTreatment); 
                    if (treatment.next()) {
                        String ICPatient = treatment.getString("treatment_PatientIC");
                        String patientName = treatment.getString("patient_Name");
                        String treatmentDate = treatment.getString("treatment_Date");
                        String treatmentTime = treatment.getString("treatment_Time");
                        String treatmentIllness = treatment.getString("treatment_Illness");
                        
                        out.println("<br><b>Patient IC :</b>" + patientIC
                                + "<br><b>Patient Name :</b>" + patientName
                                + "<br><b>Treatment Date :</b>" + treatmentDate
                                + "<br><b>Treatment Time :</b>" + treatmentTime
                                + "<br><b>Treatment Illness :</b>" + treatmentIllness+"<br>");
        %>
                        <table id="medicationTable">
                            <tr>
                            <br><th>Medication Code</th>
                                <th>Quantity</th>
                                <th>Usage Instructions</th>
                                <th>Price</th>
                            </tr>
                            <tr>
                                <td>
                                    <select name="medication_code[]">
                                        <% 
                                            try {
                                                Statement medication = connection.createStatement();
                                                String sql = "SELECT stockMedication_medicationCode, medication_name FROM "
                                                + "StockMedication, Medication WHERE"
                                                + " stockMedication_medicationCode = medication_Code";
                                                
                                                ResultSet rs = medication.executeQuery(sql);
                                                while(rs.next()) {
                                                    String code = rs.getString("stockMedication_medicationCode");
                                                    String name = rs.getString("medication_name");
                                        %>
                                        <option value="<%= code %>"><%= code %> - <%= name %></option>
                                        <% 
                                                }
                                            } catch(Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                // connection.close();
                                            }
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" name="quantity[]">
                                </td>
                                <td>
                                    <textarea name="usage_instructions[]" rows="4" cols="50"></textarea>
                                </td>
                                <td>
                                    <input type="number" name="price[]">
                                </td>
                            </tr>
                        </table>
                        <button type="button" onclick="addRow()" class="my-button">Add Another Medication</button>
                        <br>
                        <input type="submit" name="submit" value="Submit" class="my-button">
                    <% 
                        } 
                    } catch(SQLException sqlExp) {
                        request.setAttribute("error", sqlExp); 
                        out.println(sqlExp); 
                    } 
                } else {
                    out.println("Please enter the Treatment ID and Patient IC");
                }
        %>
        </form>
        <br><a href="DoctorMenu.jsp" class="redirect-link">Back to Menu</a><br>
    </div>
</body>
</html>
d