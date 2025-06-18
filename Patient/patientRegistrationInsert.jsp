<html>
    <head>
        <style>
         body {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            background-color: #9caf88;
        }
        .container {
            width: 80%;
            max-width: 600px; /* Optional: Set a maximum width */
            padding: 20px;
            background-color: #cbd5c0;
            border: 3px solid #aaa;
            border-radius: 10px;
            font-family: "Arial";
        }
        </style>
        <title>Insert Supplier Data Into MySQL</title>
    </head>
    <body>
         <div class="container">
             <center><h1>Registered Clerk</h1></center>
        <%@include file = "connectionDB.jsp" %>
        <%
           
            Statement stmtSQLlogin = null;
            Statement stmtSQLclerk = null;
            
            try{
            
            stmtSQLlogin = connection.createStatement();
            stmtSQLclerk = connection.createStatement();
            
           
            String patientName;
            String patientIC;
            String patientDate;
            String patientRegisterDate;
            String patientRegisterTime;
            String patientGender;
            String patientAddress;
            String patientPhone;
            String patientAllergy;
            
            
            //request parameter (form element name) from SupplierReistrationForm
            //and assign to the declared variable
           patientName = request.getParameter("patientName");
           patientIC = request.getParameter("patientIC");
           patientDate = request.getParameter("patientDate");
           patientRegisterDate = request.getParameter("patientRegisterDate");
           patientRegisterTime = request.getParameter("patientRegisterTime");
           patientGender = request.getParameter("patientGender");
           patientAddress = request.getParameter("patientAddress");
           patientPhone = request.getParameter("patientPhone");
           patientAllergy = request.getParameter("patientAllergy");
           
           

           
           //declare sql query and create query
            
            String sqlInsertClerk =  "INSERT INTO Patient"+ "(patient_IC, "
                                         + "patient_Name, "
                                         + "patient_Gender, patient_PhoneNumber, "
                                         + "patient_DateOfBirth, patient_RegistrationDate, "
                                         + "patient_RegistrationTime, patient_Address, patient_Allergy )" + "VALUES" + 
                                         "('" + patientIC + "' , '" + patientName + 
                                         "' , '" + patientGender + "' , '" 
                                         + patientPhone + "' , '" 
                                         + patientDate + "' , '" + patientRegisterDate + "' , '" + patientRegisterTime + 
                                         "' , '" + patientAddress + "' , '" + patientAllergy + "' )";
                                   
            int rowclerk = stmtSQLclerk.executeUpdate(sqlInsertClerk);
            
            if (rowclerk>0){
            
            out.println("<b>Data is successfully inserted into Data Base" + "<br>");
            out.println("<b>Patient Name : " + patientName + "</b>"+"<br>");
            out.println("<b>Patient Register Date : " + patientRegisterDate + "</b>"+"<br>");
            out.println("<b>Patient Register Time : " + patientRegisterTime+ "</b>"+"<br>");

            
            
            }else 
            
            out.println("<b>Data is failed inserted into Data Base");

            
            
            }
            catch (SQLException sqlerror){
            
            request.setAttribute("error: ", sqlerror);
            out.println(sqlerror);
            
           
            }
            
            finally {
               
                if (connection !=null);
                   connection.close();
            
            }
        
            %> 
            <br><a href="patientRegistration.jsp"> Back to Register page</a></br> 
    </body>
</div>
</html>