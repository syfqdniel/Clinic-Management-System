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
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            width: 100%;
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
            width: 30%;
            display: inline-block;
            padding: 10px 15px;
            color: white;
            background-color: rgba(0, 191, 178, 1); /* Bootstrap primary blue color */
            text-decoration: none;
            text-align:  center;
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
      
      .rcorners1 {
            border: none;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            border-radius: 8px;
            background: #ffffff;
            padding: 10px;
            width: 100px;
            height: 3px;
      }  
      
      .date-form {
             border: none;
             background: #fff;
             border: 3px solid rgba(2, 128, 144, 1);
             padding: 10px;
             border-radius: 8px;
             box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
             gap: 15px;
      }
      .dropdown {
             border: none;
             border: 3px solid #aaa;
             border-color: rgba(2, 128, 144, 1);
             background: #fff;
             padding: 10px;
             border-radius: 8px;
             box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
             display: flex;
             flex-direction: column;
             gap: 15px;
      }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Clerk Update Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<script>
    function validate2() {
        let paymentID = document.forms["paymentUpdate"]["paymentID"].value;
        let payDate = document.forms["paymentUpdate"]["payDate"].value;
        let payTime = document.forms["paymentUpdate"]["payTime"].value;
        let totalPayment = document.forms["paymentUpdate"]["totalPayment"].value;
        

        if (paymentID === "") {
            alert("Payment ID must be filled out");
            document.forms["paymentUpdate"]["paymentID"].select();
            document.forms["paymentUpdate"]["paymentID"].focus();
            return false;
        }

       

        if (!payDate) {
            alert("Date must be filled out");
            document.forms["paymentUpdate"]["payDate"].select();
            document.forms["paymentUpdate"]["payDate"].focus();
            event.preventDefault();
            return false;
        }

        if (!payTime) {
            alert("Payment time must be filled out");
            document.forms["paymentUpdate"]["payTime"].select();
            document.forms["paymentUpdate"]["payTime"].focus();
            return false;
        }

        let today = new Date();
        let regDate = new Date(payDate + "T" + payTime);

        if (regDate < today) {
            alert("Payment date and time cannot be in the past");
            document.forms["paymentUpdate"]["payTime"].select();
            document.forms["paymentUpdate"]["payTime"].focus();
            return false;
        }
        
        if(totalPayment === ""){
                alert ("Total payment must be filled out");
                document.forms ["paymentUpdate"]["totalPayment"].select();
                document.forms ["paymentUpdate"]["totalPayment"].focus();
                return false;

            }

        let combine = /^[0-9]+$/;
           
           if(!(paymentID.match(combine))){
               alert ("Payment ID must be in number");
               document.forms ["paymentUpdate"]["paymentID"].select();
               document.forms ["paymentUpdate"]["paymentID"].focus();
               return false;
           }
        return true;
    }
</script>
<body>
    <div class="container">
        <center><h1>Payment Update</h1></center>
        <%

            // Check session attributes
            String employeeName = (String) session.getAttribute("employee_name");

            if (employeeName != null) { 
                out.println("<center>"+"<h3>"+"Employee Name: " + employeeName + "</h3>"+"</center>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
            
            
            int treatmentID = 0;
            
            String treatmentIDParam = request.getParameter("treatmentID");
             
            if (treatmentIDParam != null && !treatmentIDParam.isEmpty()) {
            
            try {
                // Parse treatmentID from parameter string to integer
                    treatmentID = Integer.parseInt(treatmentIDParam.trim());    
                    Statement medication = connection.createStatement();
                    String sql = "SELECT dispenseMedication_TotalPrice "
                    + "FROM DispenseMedication "
                    + " WHERE "
                    + "dispenseMedication_IdTreatment = '"+ treatmentIDParam + "' ";
                    
                    ResultSet rs = medication.executeQuery(sql);
                    while(rs.next()) {
                    String code = rs.getString("dispenseMedication_TotalPrice");
                                           
        %>
        
          <form name="paymentUpdate" action="paymentListUpdate.jsp" method="get">  
            
            <br><input type="hidden" name="treatID" value="<%= treatmentIDParam %>"> 
            <h3>Treatment ID :  <%= treatmentIDParam %></h3> 
            <input type="hidden" name="treatID" value="<%= code %>"> 
            <h3>Total Price :  <%= code %></h3> 
            
        <table>    
            <tr>
            <br><td>Payment ID: </td>
                <td><input type="text" name="paymentID" size="20" class = "rcorners1"></td>
            </tr>
           <tr>
                <td>Payment Date :</td>
                <td><input type="date"  name="payDate" class ="date-form" ></td> 
            </tr>
            <tr>
                <td>Payment time :</td>
                <td><input type="time"  name="payTime" class ="date-form" ></td> 
            </tr>
           <tr>
                <td>Status :</td>
                <td><select id="options" name="payStatus" class="dropdown">
                     <option value="Success">Success</option>
                     <option value="Pending">Pending</option>
             </select></td> 
            </tr>
            <tr>
                <td>Total Payment :</td>
                <td><input type="number" name="totalPayment" step = "0.01" class ="date-form" ></td> 
            </tr>
            <tr>
                <td><input type="submit" name="submitLogin" value="Insert" class ="my-button"
                           onclick="return validate2()" class = "my-button"></td>
            </tr>
              </table>
            
          </form>
        
        <%
            }       
            } catch (NumberFormatException e) {
                
                // Handle parsing exception (e.g., invalid integer format)
           out.println("Invalid treatment ID parameter: " + treatmentIDParam);
           e.printStackTrace();
           
            }
       } else {
    // Handle case where treatmentID parameter is missing or empty
          out.println("The treatment not yet to be done");
       }

        %> 
        
        <form name="paymentUpdate" action="paymentListUpdate.jsp" method="post">
        <%  
            if (request.getParameter("submitLogin") !=null ) 
               { 
            
            Statement stmtSQLPayment = null;
            
            try{
                
              stmtSQLPayment = connection.createStatement();
                
                String treatID = request.getParameter("treatID"); 
                String paymentID = request.getParameter("paymentID"); 
                String payDate = request.getParameter("payDate"); 
                String payTime = request.getParameter("payTime");
                String payStatus = request.getParameter("payStatus");
                String totalPayment = request.getParameter("totalPayment");
                
                                 
                String updatePaymentSQL =" INSERT INTO Payment "+ "(payment_IdPayment, "
                                         + "payment_IdTreatment, "
                                         + "payment_Date, payment_Time, "
                                         + "payment_Status, payment_TotalPayment )" + "VALUES" + 
                                         "('" + paymentID + "' , '" + treatID + 
                                         "' , '" + payDate + "' , '" 
                                         + payTime + "' , '" + payStatus + "' , '"
                                         + totalPayment + "')";
                
                 
               int i = stmtSQLPayment.executeUpdate(updatePaymentSQL); 
                 
                if (i>=1){ 
                
                    out.println("<script>alert('Payment Updated'); " 
                            + "window.location.href='paymentList.jsp';</script>"); 
            }else{ 
                    out.println("<script>alert('Process failed'); " 
                            + "window.location.href='paymentList.jsp';</script>"); 
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
        <a href="paymentList.jsp" class = "redirect-link" >Back to List</a><br>
    </div>
</body>
</html>
