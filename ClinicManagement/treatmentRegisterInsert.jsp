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
            
           
            String treatID;
            String treatPatientIC;
            String treatRegisterDate;
            String treatRegisterTime;
            String treatIlless;
            String treatEmployeeIC;
           
            
            
            //request parameter (form element name) from SupplierReistrationForm
            //and assign to the declared variable
           treatID = request.getParameter("treatmentID");
           treatPatientIC = request.getParameter("treatmentIC");
           treatRegisterDate = request.getParameter("treatmentDate");
           treatRegisterTime = request.getParameter("treatmentTime");
           treatIlless = request.getParameter("treatmentIllness");
           treatEmployeeIC = request.getParameter("employeeIC");
           
           

           
           //declare sql query and create query
            
            String sqlInsertClerk =  "INSERT INTO Treatment "+ "(treatment_IdTreatment, "
                                         + "treatment_PatientIC, "
                                         + "treatment_Date, treatment_Time, "
                                         + "treatment_Illness, treatment_EmployeeIC) " + "VALUES" + 
                                         "('" + treatID + "' , '" + treatPatientIC + 
                                         "' , '" + treatRegisterDate + "' , '" 
                                         + treatRegisterTime + "' , '" 
                                         + treatIlless + "' , '" + treatEmployeeIC + "' )";
                                   
            int rowclerk = stmtSQLclerk.executeUpdate(sqlInsertClerk);
            
            String DoctorIC = ""; 
            
            if (rowclerk>0){
            
            out.println("<b>Data is successfully inserted into Data Base" + "<br>");
            out.println("<b>Treatment ID : " + treatID + "</b>"+"<br>");
            out.println("<b>Treatmentt Register Date : " + treatRegisterDate + "</b>"+"<br>");
            out.println("<b>Treatment Register Time : " + treatRegisterTime+ "</b>"+"<br>");
            out.println("<b>Doctor IC : " + treatEmployeeIC+ "</b>"+"<br>");

            
            
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
            <br><a href="treatmentRegister.jsp"> Back to Register page</a></br> 
    </body>
</div>
</html>