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
           
            
            Statement stmtSQLMed = null;
            
            try{
            
            stmtSQLMed = connection.createStatement();
            
           
            String medCode;
            String medName;
            String quantity;
            String medCategory;
           
            
            
            //request parameter (form element name) from SupplierReistrationForm
            //and assign to the declared variable
           medCode = request.getParameter("medCode");
           medName = request.getParameter("medName");
           quantity = request.getParameter("quantity");
           medCategory = request.getParameter("medCategory");
           
           

           
           //declare sql query and create query
            
            String sqlInsertMed =  "INSERT INTO Medication"+ "(medication_Code, "
                                         + "medication_Name, "
                                         + "medication_Category, medication_Quantity)" + "VALUES" + 
                                         "('" + medCode + "' , '" + medName + 
                                         "' , '" + medCategory + "' , '" 
                                         + quantity + "')";
                                 
            int rowMed = stmtSQLMed.executeUpdate(sqlInsertMed);
            
            if (rowMed>0){
            
            out.println("<b>Data is successfully inserted into Data Base" + "<br>");
            out.println("<b>Medication Name : " + medCode + "</b>"+"<br>");
            out.println("<b>Medication Code : " + medName + "</b>"+"<br>");
            out.println("<b>Quantity: " + quantity+ "</b>"+"<br>");

            
            
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
            <br><a href="pharmcayAddMedication.jsp"> Back to Register page</a></br> 
    </body>
</div>
</html>