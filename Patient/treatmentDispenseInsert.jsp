<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connectionDB.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Styles and metadata here -->
</head>
<body>
    <div class="container">
        <% 
            if (request.getParameter("submit") != null) {
                String treatmentId = (String) session.getAttribute("idTreatment");
                String[] medicationCode = request.getParameterValues("medication_code[]");
                String[] quantity = request.getParameterValues("quantity[]");
                String[] usageInstructions = request.getParameterValues("usage_instructions[]");
                String[] price = request.getParameterValues("price[]");
                
                out.println("Debugging Info:<br>");
                out.println("treatmentId: " + treatmentId + "<br>");
                out.println("medicationCode: " + java.util.Arrays.toString(medicationCode) + "<br>");
                out.println("quantity: " + java.util.Arrays.toString(quantity) + "<br>");
                out.println("usageInstructions: " + java.util.Arrays.toString(usageInstructions) + "<br>");
                out.println("price: " + java.util.Arrays.toString(price) + "<br>");

                if (medicationCode != null && quantity != null && usageInstructions != null && price != null ) {
                    double totalPrice = 0.0;

                    try {
                        for (int i = 0; i < medicationCode.length; i++) {
                            if (medicationCode[i] != null && !medicationCode[i].isEmpty() &&
                                quantity[i] != null && !quantity[i].isEmpty() &&
                                usageInstructions[i] != null && !usageInstructions[i].isEmpty() &&
                                price[i] != null && !price[i].isEmpty()) {

                                double itemPrice = Double.parseDouble(price[i]);
                                int itemQuantity = Integer.parseInt(quantity[i]);
                                double itemTotal = itemPrice * itemQuantity;
                                totalPrice += itemTotal;

                                // Insert dispense information
                                String insertSQL = "INSERT INTO DispenseMedication (dispenseMedication_IdTreatment,"
                                + "dispenseMedication_medicationCode, dispenseMedication_Quantity, "
                                + "dispenseMedication_UsageMethod, dispenseMedication_TotalPrice) "
                                + "VALUES (?, ?, ?, ?, ?)";
                                
                                PreparedStatement pstmt = connection.prepareStatement(insertSQL);
                                pstmt.setString(1, treatmentId);
                                pstmt.setString(2, medicationCode[i]);
                                pstmt.setInt(3, itemQuantity);
                                pstmt.setString(4, usageInstructions[i]);
                                pstmt.setDouble(5, itemTotal);  
                                pstmt.executeUpdate();

                                // Update stock quantity
                                String updateStockSQL = "UPDATE StockMedication SET stockMedication_Quantity = stockMedication_Quantity - ? "
                                + "WHERE stockMedication_medicationCode = ?";
                                
                                PreparedStatement pstmtUpdate = connection.prepareStatement(updateStockSQL);
                                pstmtUpdate.setInt(1, itemQuantity);
                                pstmtUpdate.setString(2, medicationCode[i]);
                                pstmtUpdate.executeUpdate();
                            }  else {
                                out.println("Error: Missing or invalid data for medication at index " + i + "<br>");
                            }
                        }

                        // Insert total price into Treatment_Dispense_Total table
                      
                    } catch(SQLException sqlExp) {
                        request.setAttribute("error", sqlExp); 
                        out.println(sqlExp); 
                    } finally { 
                        if (connection != null) 
                            connection.close(); 
                    } 
                } else {
                    out.println("Error: Missing medication data or payment ID.");
                }
            } 
        %>
        <br><a href="DoctorMenu.jsp" class="redirect-link">Back to Menu</a><br>
    </div>
</body>
</html>
