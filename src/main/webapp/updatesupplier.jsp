<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Supplier</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        h1, h2, h3, p { color: #333; }
        input[type=text], input[type=number], select {
            width: 100%; padding: 10px; margin: 5px 0 15px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
        }
        input[type=submit], input[type=button] {
            background-color: #007BFF; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 10px;
        }
        input[type=button] { background-color: #6c757d; }
        form { background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 2px 3px rgba(0,0,0,0.1); max-width: 500px; }
    </style>
</head>
<body>
<h2>Update Supplier</h2>
<p>Please update supplier fields and press
    Update supplier button or press Cancel button</p>
<c:url var="supplierUrl" value="/supplier.jsp"/>
<form method="post" action="supplier">
    <input type="hidden" name="actionType" value="updateSupplier">
    <input type="hidden" name="supplierId" value="${param.supplierId}">
    <p>Supplier ID: <c:out value="${param.supplierId}"/></p>
    <label for="supplierName">Supplier name:</label>
    <input id="supplierName" type="text" name="supplierName" value="${param.supplierName}">
    <label for="supplierContact">Supplier contact:</label>
    <input id="supplierContact" type="text" name="supplierContact" value="${param.supplierContact}">
    <label for="supplierAddress">Supplier address:</label>
    <input id="supplierAddress" type="text" name="supplierAddress" value="${param.supplierAddress}">
    <label for="supplierSpecialization">Supplier specialization:</label>
    <input id="supplierSpecialization" type="text" name="supplierSpecialization" value="${param.supplierSpecialization}">
    <input type="submit" name="updateSupplier" value="Update Supplier">
    <input type="button" onclick="window.location.href='${supplierUrl}'" value="Cancel">
</form>
</body>
</html>