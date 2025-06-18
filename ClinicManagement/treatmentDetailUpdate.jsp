<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectionDB.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%> 
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Clerk Update Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <center><h1>Payment Update</h1></center>
        <%

            // Check session attributes
            String employeeName = (String) session.getAttribute("employee_name");

            if (employeeName != null) { 
                out.println("Employee Name: " + employeeName + "<br>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
            
            
            int treatmentID = 0;
            
            String treatmentIDParam = request.getParameter("treatmentID");
             
            if (treatmentIDParam != null && !treatmentIDParam.isEmpty()) {
            
            try {
                // Parse treatmentID from parameter string to integer
                
                    treatmentID = Integer.parseInt(treatmentIDParam);
                    
                    Statement statement = connection.createStatement(); 
                    String querySelectID = "SELECT * FROM Payment WHERE payment_IdTreatment = '" + treatmentIDParam + "'";
                    
                    ResultSet rsPayment = statement.executeQuery(querySelectID); 

                    if (rsPayment.next()) { 
                        // Declare and get value from attribute in table Employee 
                        String payment_IdPayment = rsPayment.getString("payment_IdPayment"); 
                        String payment_IdTreatment = rsPayment.getString("payment_IdTreatment"); 
                        String payment_Date = rsPayment.getString("payment_Date"); 
                        String payment_Time = rsPayment.getString("payment_Time");
                        String payment_Status = rsPayment.getString("payment_Status");
                        String payment_TotalPayment = rsPayment.getString("payment_TotalPayment");
                        
                    
        %>
          <form name="paymentUpdate" action="treatmentDetailUpdate.jsp" method="get">  
            
            <br><input type="hidden" name="treatID" value="<%= treatmentIDParam %>"> 
            <h3>Treatment ID :  <%= treatmentIDParam %></h3> 
            
        <table>    
            <tr>
            <br><td>Payment ID : <%= payment_IdPayment %></td>
                <td><input type="hidden" name="paymentID" value = "<%= payment_IdPayment %>"
                           size="20" class = "rcorners1"></td>
            </tr>
           <tr>
                <td>Payment Date : </td>
                <td><input type="date"  name="payDate" value = "<%= payment_Date %>" 
                           class ="date-form" ></td> 
            </tr>
            <tr>
                <td>Payment time : </td>
                <td><input type="time"  name="payTime" value = "<%= payment_Time %>" 
                           class ="date-form" ></td> 
            </tr>
           <tr>
                <td>Status :</td>
                <td><select id="options" name="payStatus" value = "<%= payment_Status %>" 
                            class="dropdown">
                     <option value="Success">Success</option>
                     <option value="Pending">Pending</option>
             </select></td> 
            </tr>
            <tr>
                <td>Total Payment : <%= payment_TotalPayment %> </td>
                <td><input type="hidden" name="totalPayment" value = "<%= payment_TotalPayment %>" 
                           step = "0.01" class ="date-form" ></td> 
            </tr>
            <tr>
                <td><input type="submit" name="submitLogin" value="Insert" 
                           onclick="return validate()" class = "my-button"></td>
            </tr>
              </table>
            
          </form>
        
        <%
            }else{
            
            out.println("");
                
            }
                    
            } catch (NumberFormatException e) {
                
                // Handle parsing exception (e.g., invalid integer format)
           out.println("Invalid treatment ID parameter: " + treatmentIDParam);
           e.printStackTrace();
           
            }
       } else {
    // Handle case where treatmentID parameter is missing or empty
          out.println("");
       }

        %> 
        
        <form name="paymentUpdate" action="treatmentDetailUpdate.jsp" method="post">
        <%  
            if (request.getParameter("submitLogin") !=null ) 
               { 
            
            Statement stmtSQLPayment = null;
            
            try{
                
            
              PreparedStatement psUpdatePayment = null; 
                
                String treatID = request.getParameter("treatID");
                String paymentID = request.getParameter("paymentID"); 
                String payDate = request.getParameter("payDate"); 
                String payTime = request.getParameter("payTime");
                String payStatus = request.getParameter("payStatus");
                String totalPayment = request.getParameter("totalPayment");
                
                
                
                                 
                String updatePaymentSQL ="UPDATE Payment SET payment_Date = ?, payment_Time = ?, payment_Status = ?, payment_IdTreatment = ?, "
                                         + "payment_TotalPayment = ? WHERE payment_IdPayment = '"+ paymentID + "'" ; 
                        
                psUpdatePayment = connection.prepareStatement(updatePaymentSQL);
                psUpdatePayment.setString(1, payDate);
                psUpdatePayment.setString(2, payTime);
                psUpdatePayment.setString(3, payStatus);
                psUpdatePayment.setString(4, treatID);
                psUpdatePayment.setString(5, totalPayment);
                
                 
                int i = psUpdatePayment.executeUpdate(); 
                 
                if (i>=1){ 
                    out.println("<script>alert('Profile Updated!'); " 
                            + "window.location.href='treatmentDetail.jsp';</script>"); 
            }else{ 
                    out.println("<script>alert('Profile cannot be updated'); " 
                            + "window.location.href='treatmentDetail.jsp';</script>"); 
          } 
            }
            catch(SQLException sqlExp) 
            { 
                request.setAttribute("error", sqlExp); 
                out.println(sqlExp); 
            }
        
            finally 
            { 
                if (connection !=null) 
                    connection.close(); 
            }
            
            } else {
            
            out.println("");
            }

           
            
        %> 
        </form>
        <a href="treatmentDetail.jsp" class = "redirect-link" >Back to List</a><br>
    </div>
</body>
</html>
