<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Supplier</title>
</head>
<body>
    <p>Please update supplier fields and press
    Update supplier button or press Cancel button</p>
    <c:url var="supplierUrl" value="/supplier.jsp"/>
    <form method="post" action="supplier">
        <input type="hidden" name="actionType" value="updateSupplier">
        <input type="hidden" name="supplierId" value="${param.supplierId}">
        <p>Supplier ID: <c:out value="${param.supplierId}"/></p>
        <p>Supplier name:
            <input type="text" name="supplierName" value="${param.supplierName}"></p>
        <p>Supplier contact:
            <input type="text" name="supplierContact" value="${param.supplierContact}"></p>
        <p>Supplier address:
            <input type="text" name="supplierAddress" value="${param.supplierAddress}"></p>
        <p>Supplier specialization:
            <input type="text" name="supplierSpecialization" value="${param.supplierSpecialization}"></p>
        <input type="submit" name="updateSupplier" value="Update Supplier">
        <input type="button" onclick="window.location.href='${supplierUrl}'" value="Cancel">
    </form>
</body>
</html>
