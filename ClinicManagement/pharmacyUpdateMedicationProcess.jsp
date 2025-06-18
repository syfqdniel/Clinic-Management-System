<%--  
    Document   : supplierProfileUpdateProcess.jsp 
    Created on : 25 Apr 2024, 4:23:56 PM 
    Author     : fatimah 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file="connectionDB.jsp" %>
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.ResultSet"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Update Supplier in MySQL Process</title> 
    </head> 
    <body> 
        <%     
            try { 
                PreparedStatement psSelectMedication = null;
                PreparedStatement psUpdateStockMedication = null; 
                PreparedStatement psInsertStockMedication = null;
                PreparedStatement psUpdateMedication = null;
                 
                String MedCode = request.getParameter("medication_code"); 
                int newQuantity = Integer.parseInt(request.getParameter("quantity"));

                // Check if the medication exists in StockMedication
                String selectStockMedSQL = "SELECT stockMedication_Quantity FROM StockMedication WHERE stockMedication_medicationCode = ?";
                psSelectMedication = connection.prepareStatement(selectStockMedSQL);
                psSelectMedication.setString(1, MedCode);
                ResultSet rs = psSelectMedication.executeQuery();

                if (rs.next()) {
                    // Medication exists, update the quantity in StockMedication
                    int currentQuantity = rs.getInt("stockMedication_Quantity");
                    int updatedQuantity = currentQuantity + newQuantity;

                    String updateStockMedSQL = "UPDATE StockMedication SET stockMedication_Quantity = ? WHERE stockMedication_medicationCode = ?";
                    psUpdateStockMedication = connection.prepareStatement(updateStockMedSQL);
                    psUpdateStockMedication.setInt(1, updatedQuantity);
                    psUpdateStockMedication.setString(2, MedCode);

                    int i = psUpdateStockMedication.executeUpdate();
                    
                    if (i >= 1) {
                        // Subtract the quantity from the Medication table
                        String updateMedSQL = "UPDATE Medication SET medication_Quantity = medication_Quantity - ? WHERE medication_Code = ?";
                        psUpdateMedication = connection.prepareStatement(updateMedSQL);
                        psUpdateMedication.setInt(1, newQuantity);
                        psUpdateMedication.setString(2, MedCode);

                        int j = psUpdateMedication.executeUpdate();
                        
                        if (j >= 1) {
                            out.println("<script>alert('Stock Updated and Medication Quantity Subtracted!'); window.location.href='pharmacyUpdateMedication.jsp';</script>"); 
                        } else {
                            out.println("<script>alert('Stock Updated but Medication Quantity could not be subtracted'); window.location.href='pharmacyUpdateMedication.jsp';</script>"); 
                        }
                    } else {
                        out.println("<script>alert('Stock cannot be updated'); window.location.href='pharmacyUpdateMedication.jsp';</script>"); 
                    }
                    
                } else {
                    // Medication does not exist, insert new record into StockMedication
                    String insertStockMedSQL = "INSERT INTO StockMedication (stockMedication_medicationCode, stockMedication_Quantity) VALUES (?, ?)";
                    psInsertStockMedication = connection.prepareStatement(insertStockMedSQL);
                    psInsertStockMedication.setString(1, MedCode);
                    psInsertStockMedication.setInt(2, newQuantity);

                    int k = psInsertStockMedication.executeUpdate();
                    
                    if (k >= 1) {
                        // Subtract the quantity from the Medication table
                        String updateMedSQL = "UPDATE Medication SET medication_Quantity = medication_Quantity - ? WHERE medication_Code = ?";
                        psUpdateMedication = connection.prepareStatement(updateMedSQL);
                        psUpdateMedication.setInt(1, newQuantity);
                        psUpdateMedication.setString(2, MedCode);

                        int j = psUpdateMedication.executeUpdate();
                        
                        if (j >= 1) {
                            out.println("<script>alert('New Medication Added and Quantity Subtracted!'); window.location.href='pharmacyUpdateMedication.jsp';</script>"); 
                        } else {
                            out.println("<script>alert('New Medication Added but Quantity could not be subtracted'); window.location.href='pharmacyUpdateMedication.jsp';</script>"); 
                        }
                    } else {
                        out.println("<script>alert('New Medication cannot be added'); window.location.href='pharmacyUpdateMedication.jsp';</script>"); 
                    }
                }

                // Close resources
                rs.close();
                psSelectMedication.close();
                if (psUpdateStockMedication != null) psUpdateStockMedication.close();
                if (psInsertStockMedication != null) psInsertStockMedication.close();
                if (psUpdateMedication != null) psUpdateMedication.close();
            } 
            catch (SQLException sqlExp) { 
                request.setAttribute("error", sqlExp); 
                out.println(sqlExp); 
            } 
            finally { 
                if (connection != null) {
                    connection.close(); 
                }
            } 
        %> 
        <br> 
    </body> 
</html>
