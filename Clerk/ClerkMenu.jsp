
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
            String employeeName = (String) session.getAttribute("employee_Name");

            if (employeeName != null) { 
                out.println("<h3>"+ "<center>" + " Employee Name: " + employeeName + "</center>" +"</h3>"+ "<br>");  
            } else {
                out.println("Employee Name is not set in the session.<br>");
            }
        %>
        <center><h1>Indah Clinic</h1></center>
        <form name="clerkMenu" action="ClerkMenu.jsp" method="post">
        <center>
        <h3> Clerk Menu </h3>
        <a href="clerkUpdateProfile.jsp" class="redirect-link">Update Profile</a><br>
        <a href="clerkChangePassword.jsp" class="redirect-link">Change Password</a><br>
        <h3> Employee Menu </h3>
        <a href="EmployeeRegister.jsp" class="redirect-link">Add Employee</a><br>
        <a href="EmployeeDelete.jsp" class="redirect-link">Delete Employee</a><br>
        <h3> Patient Menu </h3>
        <a href="patientRegistration.jsp" class="redirect-link">Add New Patient</a><br>
        <a href="patientUpdate.jsp" class="redirect-link">Update Patient</a><br>
        <a href="patientDelete.jsp" class="redirect-link">Delete Patient</a><br>
        <h3> Treatment Menu </h3>
        <a href="treatmentRegister.jsp" class="redirect-link">Register Patient Treatment</a><br>
        <h3> Report Menu </h3>
        <a href="reportAllPatient.jsp" class="redirect-link">Report Of All Patient</a><br>
        <br><a href="LogOut.jsp" class="redirect-link">Log Out</a><br>
        
    </center>   
        </div>       
    </body>
</html>