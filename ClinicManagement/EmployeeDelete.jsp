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
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background: #ffffff;
            padding: 10px;
            width: 100px;
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
      .redirect-link {
            width: 30%;
            border: 1px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 10px 15px;
            color: white;
            background-color: rgba(0, 191, 178, 1); /* Bootstrap primary blue color */
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
        <title>Delete Employee Form</title> 
    </head> 
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
        <center><h1>Delete Employee</h1></center> 
        <center><form name="deleteEmployeeForm" action="EmployeeDelete.jsp" method="get"> 
            Employee IC: <input type="text" name="EmployeeIC" size="10" class="rcorners1"> <br>
            <br> Employee ID: <input type="text" name="EmployeeID" size="10" class="rcorners1"><br>
            <br><input type="submit" name="employee" value="Hapus" class="my-button" 
       onclick="if (confirm('Adakha anda pasti mahu hapus Kod Kursus ini?Are you sure you want to delete this Kod Kursus?'))  
                                {form.action='EmployeeDelete.jsp';} 
                                else {return false;}"> 
                             </form></center> 
    <%   
        if (request.getParameter("employee") !=null  
               &&!(request.getParameter("EmployeeIC").equals(""))
              &&!(request.getParameter("EmployeeID").equals("")) )  
        { 
            Statement sDelete= null, sSelectCountDelete=null; 
            try 
            {    
                String DeleteEmployee =  request.getParameter("EmployeeIC");
                String DeleteEmployeeID =  request.getParameter("EmployeeID"); 
                
                sSelectCountDelete= connection.createStatement(); 
                sDelete = connection.createStatement(); 
                 
                // Check if dependent rows exist 
                String querySelectDeleteEmployee = "SELECT COUNT(treatment_EmployeeIC) " 
                        + "FROM Treatment WHERE treatment_EmployeeIC = '"+ DeleteEmployee +"'"; 
             
                ResultSet resultSet = sSelectCountDelete.executeQuery(querySelectDeleteEmployee); 
                resultSet.next(); 
                
                int dependentRows = resultSet.getInt(1); 
                out.println("<br>dependentRows " + dependentRows); 
                 
                // Display message based on the existence of dependent rows 
                if (dependentRows > 0) { 
                    out.println("<br><br>Cannot delete employee " + DeleteEmployee + ".<br>" 
                            + "There are dependent Employee "+DeleteEmployee+" in the Treatment table."); 
                }  
                else  
                {
                    
                    String queryDeleteEmployee = "DELETE FROM Employee " 
                                        + "WHERE employee_IC = '"+ DeleteEmployee +"'";
                                        
                    String queryDeleteID = "DELETE FROM Login " 
                                        + "WHERE login_loginID = '"+ DeleteEmployeeID +"'";
                    //psDelete = connection.prepareStatement(queryDeleteKursus); 
                    //psDelete.setString(1, "kodKursus"); 
 
                    int i = sDelete.executeUpdate(queryDeleteEmployee);
                    int t = sDelete.executeUpdate(queryDeleteID); 
                    
                    if(i == 1) 
                    { 
                       out.print("<br><br>Employee IC : " + DeleteEmployee  
                               +"<br>Record Deleted Successfully");  
                    } 
                    else 
                    { 
                        out.println("<br><br>There is a problem in Deleting Record " 
                        + "because Employee IC: " + DeleteEmployee + " doesn't exit");  
                        out.print("<br>Check Manually in your Database"); 
                    }
                    
                    if(t == 1) 
                    { 
                       out.print("<br><br>Employee ID : " + DeleteEmployeeID  
                               +"<br>Record Deleted Successfully");  
                    } 
                    else 
                    { 
                        out.println("<br><br>There is a problem in Deleting Record " 
                        + "because Employee ID: " + DeleteEmployeeID + " doesn't exit");  
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
        <center><a href="ClerkMenu.jsp" class="redirect-link">Back To Menu</a> <br></center> 
        </div>
    </body> 
</html>