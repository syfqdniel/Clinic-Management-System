
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
            width: 80%;
            max-width: 600px; /* Optional: Set a maximum width */
            padding: 20px;
            background-color: #ffffff;
            border: 3px solid #aaa;
            border-color: rgba(2, 128, 144, 1);
            border-radius: 10px;
            font-family: "Tahoma";
        }    

            /* Basic link style */
        .redirect-link {
            width: 50%;
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
        <title>Main Menu</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
          <% 
            String employeeName = (String) session.getAttribute("employee_name");

            if (employeeName != null) { 
                out.println("<h3>"+ "<center>" + " Employee Name: " + employeeName + "</center>" +"</h3>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
        %>
        <center><h1>Indah Clinic</h1></center>
        <form name="clerkMenu" action="ClerkMenu.jsp" method="post">
        <center>
        <h3> Pharmacy Menu </h3>
        <a href="pharmacyUpdateProfile.jsp" class="redirect-link">Update Profile</a><br>
        <a href="pharmacystChangePassword.jsp" class="redirect-link">Change Password</a><br>
        
        <h3> Medicine Menu </h3>
        <a href="pharmacyAddMedication.jsp" class="redirect-link">Add Medicine</a><br>
        <a href="pharmacyUpdateMedication.jsp" class="redirect-link">Update Medicine</a><br>
        <a href="pharmacyMedicationDelete.jsp" class="redirect-link">Delete Medicine</a><br>
        
        <h3> Payment Menu </h3>
        <a href="paymentList.jsp" class="redirect-link">List Of Treatment</a><br>
        <a href="treatmentDetail.jsp" class="redirect-link">Payment Detail</a><br>
        
        <h3> Report Menu </h3>
        <a href="pharmacyMedicineReport.jsp" class="redirect-link">Medication Report</a><br>
        <a href="pharmacyStockReport.jsp" class="redirect-link">Stock Report</a><br>
        <a href="PharmacyPaymentReport.jsp" class="redirect-link">Payment Report</a><br>
        <br><a href="LogOut.jsp" class="redirect-link">Log Out</a><br>
        
    </center>   
        </div>       
    </body>
</html>