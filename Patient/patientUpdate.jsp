<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectionDB.jsp"%>
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
            width: 20%;
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

        /* Active effect */
        .redirect-link:active {
           background-color: #004085; /* Even darker blue */
           transform: scale(0.95);
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Supplier Update Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<script>
    function validate2() {
        let patientIC = document.forms["PatientProfileUpdateForm"]["patientIC"].value;
    
        
        if (patientIC === "") {
            alert("Please put patient IC");
            document.forms["PatientProfileUpdateForm"]["patientIC"].select();
            document.forms["PatientProfileUpdateForm"]["patientIC"].focus();
            return false;
        }
return true;
   
   }
</script>

<script>
    function validate3(){
      let patientPhone = document.forms["PatientProfileUpdateForm"]["patient_PhoneNumber"].value;
        let patientAddress = document.forms["PatientProfileUpdateForm"]["patient_Address"].value;
    
        if (patientAddress === "") {
            alert("Address must be filled out");
            document.forms["PatientProfileUpdateForm"]["patientAddress"].select();
            document.forms["PatientProfileUpdateForm"]["patientAddress"].focus();
            return false;
        }

      
        
        if(patientPhone === ""){
                alert ("Phone number must be filled out");
                document.forms ["PatientProfileUpdateForm"]["patient_PhoneNumber"].select();
                document.forms ["PatientProfileUpdateForm"]["patient_PhoneNumber"].focus();
                return false;

            }

        if (patientPhone.length < 10) {
            alert("Length of telephone number is not enough. Telephone number must be more than 10, " 
                    + patientPhone.length + " number/s only");
            document.forms["PatientProfileUpdateForm"]["patient_PhoneNumber"].select();
            document.forms["PatientProfileUpdateForm"]["patient_PhoneNumber"].focus();
            return false;
        }

        if (patientPhone.length > 13) {
            alert("Length of telephone number is too long. Telephone number must be less than 13, " 
                    + patientPhone.length + " number/s is not allowed");
            document.forms["PatientProfileUpdateForm"]["patient_PhoneNumber"].select();
            document.forms["PatientProfileUpdateForm"]["patient_PhoneNumber"].focus();
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
        <center><h1>Employee Profile </h1></center>

        <form name="PatientProfileUpdateForm" action="patientUpdate.jsp" method="get">
            <br>Employee IC: <input type="text" name="patientIC" class="rcorners1"> <br> 
            <input type="submit" name="findIC" value="Find" class="my-button" onclick="return validate2()"><br> 
        <%   
            if (request.getParameter("findIC") !=null  
               &&!(request.getParameter("patientIC").equals("")))  
        {
        
            String patientIC = request.getParameter ("patientIC");
            
                try { 
                    Statement statement = connection.createStatement(); 
                    String querySelectPatient = "SELECT * FROM Patient WHERE patient_IC = '" + patientIC + "'";
                    
                    ResultSet rsPatient = statement.executeQuery(querySelectPatient); 

                    if (rsPatient.next()) { 
                        // Declare and get value from attribute in table Employee 
                        String patient_IC = rsPatient.getString("patient_IC"); 
                        String patient_Name = rsPatient.getString("patient_Name"); 
                        String patient_Gender = rsPatient.getString("patient_Gender"); 
                        String patient_PhoneNumber = rsPatient.getString("patient_PhoneNumber");
                        String patient_DateOfBirth = rsPatient.getString("patient_DateOfBirth");
                        String patient_RegistrationDate = rsPatient.getString("patient_RegistrationDate");
                        String patient_RegistrationTime = rsPatient.getString("patient_RegistrationTime");
                        String patient_Address = rsPatient.getString("patient_Address");
                        String patient_Allergy = rsPatient.getString("patient_Allergy");
                        
        %> 
       
                            <br><input type="hidden" name="patient_IC" value="<%= patient_IC %>"> 
                            <b>Patient IC: </b> <%= patient_IC %><br> 
                            
                            <input type="hidden" name="patient_Name" value="<%= patient_Name %>"> 
                            <b>Patient Name: </b> <%= patient_Name %><br> 
                            
                            <br><input type="hidden" name="patient_Gender" value="<%= patient_Gender %>"> 
                            <b>Patient Gender: </b><%= patient_Gender %></br> 
                            
                            <table>
                                <tr>
                                    <td><b>Phone Number :</b></td>  
                                    <td><input type="text" name="patient_PhoneNumber" value="<%= patient_PhoneNumber %>" class = "rcorners1"><br></td>
                                </tr>   
                            </table>                
                            
                            <input type="hidden" name="patient_DateOfBirth" value="<%= patient_DateOfBirth %>"> 
                            <b> Patient Date of birth : </b><%= patient_DateOfBirth %></br> 
           <table>
               <tr>
                   <td><b>Patient Address :</b></td>  
                   <td><input type="text" name="patient_Address" value="<%= patient_Address %>" class = "rcorners1"><br></td>
               </tr>
             
                            <!-- button submit--> 
                            <td><input type="submit" name="update" value="Update" class = "my-button" onclick="return validate3()"></td>
               </tr>
          </table>
        
        <% 
                    } else {
                        out.println("No patient found");
                    }
                } catch(SQLException sqlExp) { 
                    request.setAttribute("error", sqlExp); 
                    out.println("SQL Exception: " + sqlExp + "<br>"); 
                } finally { 
                    if (connection != null) {
                        try {
                            connection.close();
                        } catch(SQLException e) {
                            out.println("Error closing connection: " + e.getMessage() + "<br>");
                        }
                    }
                }
            } else {
                out.println("");
            }
        %> 
        </form> 
        <form name="PatientProfileUpdateForm" action="patientUpdate.jsp" method="post">
        <%  
            if (request.getParameter("update") !=null  
               &&!(request.getParameter("patient_Address").equals(""))&&! 
               (request.getParameter("patient_Allergy").equals(""))
               &&! (request.getParameter("patient_PhoneNumber").equals(""))
               ){ 
               
            try{ 
            
                PreparedStatement psUpdatePatient = null; 
                
                String patient_IC1 = request.getParameter("patient_IC"); 
                String patient_PhoneNumber1 = request.getParameter("patient_PhoneNumber"); 
                String patient_Address1 = request.getParameter("patient_Address"); 
                String patient_Allergy1 = request.getParameter("patient_Allergy");
                                 
                String updatePatientSQL ="UPDATE Patient SET patient_PhoneNumber = ?, " 
                        + "patient_Address = ?, patient_Allergy = ? " 
                        + "WHERE patient_IC = '" + patient_IC1 + "'" ; 
                        
                psUpdatePatient = connection.prepareStatement(updatePatientSQL); 
                psUpdatePatient.setString(1, patient_PhoneNumber1); 
                psUpdatePatient.setString(2, patient_Address1);
                psUpdatePatient.setString(3, patient_Allergy1);
                
                 
                int i = psUpdatePatient.executeUpdate(); 
                 
                if (i>=1){ 
                    out.println("<script>alert('Profile Updated!'); " 
                            + "window.location.href='patientUpdate.jsp';</script>"); 
            }else{ 
                    out.println("<script>alert('Profile cannot be updated'); " 
                            + "window.location.href='patientUpdate.jsp';</script>"); 
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
        <a href="ClerkMenu.jsp" class = "redirect-link" >Back to Menu</a><br>
    </div>
</body>
</html>
