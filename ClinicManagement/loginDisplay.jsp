

<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.SQLException"%> 
<%@include file= "connectionDB.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Display Menu</title>
    </head>
    <body style ="background-color:#F2EBE3;">
       
        <%
            //create session userID
            if (request.getParameter("submitLogin") != null){
                String username = request.getParameter("username");
                session.setAttribute("username", username);
            }
            //get username and password from Login.jsp
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            try{
                Statement statementSQL = connection.createStatement();
                
                String querySelectLogin = "SELECT login_loginID, login_password, "
                        + "type "
                        + "FROM Login "
                        + "WHERE login_loginID = '"+ username +"' "
                        + "AND login_password = '"+ password +"'";
                        
                //to execute query SQL statement as a result set
                ResultSet rowLogin = statementSQL.executeQuery(querySelectLogin);
                
                
                //declare variable to assign value from table login to this variable
                String loginUsername ="";
                String loginPassword ="";
                String loginType ="";
                
                //guna if kalau kita ada WHERE(spesifik data), kalau tak guna WHERE pakai while(data banyak)
                if(rowLogin.next())
                {
                    //retrieve login value from login table and assign to declared variable
                    loginUsername = rowLogin.getString("login_loginID");
                    loginPassword = rowLogin.getString("login_password");
                    loginType = rowLogin.getString("type");
                    
                    //to check either loginType is supplier or buyer
                    if(loginType.equals("c"))
                    {
                        String querySelectClerk = "SELECT employee_Name, employee_IC "
                            + "FROM Login, Employee "
                            + "WHERE login_loginID = employee_loginID AND "
                            + "employee_loginID = '" + username + "'";
                        
                        ResultSet rowClerk = statementSQL.executeQuery(querySelectClerk);
                        
                        String ClerkName = "";
                        String ClerkIC = "";
                        
                        
                        if(rowClerk.next())
                        {
                            //set session to supplierCompanyName
                            ClerkName = rowClerk.getString("employee_Name");
                            ClerkIC = rowClerk.getString("employee_IC");
                            //display directly to supplierMenu.jsp
                            //response = tindakbalas
                            session.setAttribute("employee_Name", ClerkName);
                            session.setAttribute("employee_IC", ClerkIC);
                            response.sendRedirect("ClerkMenu.jsp");
                        }//end (rowSupplier.next())
                            
                    }//end if(loginType.equals("s"))
                    
                    else if(loginType.equals("d"))
                        {
                            String querySelectDoctorName = "SELECT employee_Name, employee_IC "
                            + "FROM Login, Employee "
                            + "WHERE login_loginID = employee_loginID AND "
                            + "employee_loginID = '" + username + "'";
                        
                            ResultSet rowDoctor = statementSQL.executeQuery(querySelectDoctorName);
                        
                            String DoctorName = "";
                            String DoctorIC = "";
                            
                            if(rowDoctor.next())
                            {
                                //set session to buyerName
                            DoctorName = rowDoctor.getString("employee_Name");
                            DoctorIC = rowDoctor.getString("employee_IC");
                                //display directly to buyerMenu.jsp
                                //response = tindakbalas
                                session.setAttribute("employee_name", DoctorName);
                                session.setAttribute("employee_IC", DoctorIC);
                                response.sendRedirect("DoctorMenu.jsp");
                            }//end (rowBuyer.next())
                        }
                        
                    else if(loginType.equals("p"))
                    {
                           String querySelectPharmacyName = "SELECT employee_name, employee_IC "
                            + "FROM Login, Employee "
                            + "WHERE login_loginID = employee_loginID AND "
                            + "employee_loginID = '" + username + "'";
                        
                            ResultSet rowPharmacy = statementSQL.executeQuery(querySelectPharmacyName);
                        
                            String pharmacy = "";
                            String pharmacyIC = "";
                            
                            if(rowPharmacy.next())
                            {
                                //set session to buyerName
                            pharmacy = rowPharmacy.getString("employee_name");
                            pharmacyIC = rowPharmacy.getString("employee_IC");
                                //display directly to buyerMenu.jsp
                                //response = tindakbalas
                                session.setAttribute("employee_name", pharmacy);
                                session.setAttribute("employee_IC", pharmacyIC);
                                response.sendRedirect("PharmacyMenu.jsp");
                            }//end (rowBuyer.next())
                        }
                    
                    else
                        {
                            out.println("wrong username or/and password");
                        }
                }//end try
            }
                catch(SQLException sqlExp)
                {
                    request.setAttribute("Error", sqlExp);
                    out.println(sqlExp);
                }//end catch
                
                finally
                {
                    if(connection != null)
                        connection.close();
                }//end finally
        %>    
    </body>
</html>