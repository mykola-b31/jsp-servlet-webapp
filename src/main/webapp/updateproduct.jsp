<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <p>Please update product fields and press
    Update product button or press Cancel button</p>
    <c:url var="productUrl" value="/product.jsp"/>
    <form method="post" action="product">
        <input type="hidden" name="actiontype" value="updateproduct">
        <input type="hidden" name="productid" value="${param.productid}">
        <p>Product id: <c:out value="${param.productid}"/></p>
        <p>Product name:
            <input type="text" name="productname" value="${param.productname}"/></p>
        <p>Product description:
            <input type="text" name="productdescription" value="${param.productdescription}"/></p>
        <input type="submit" name="updateproduct" value="Update product">
        <input type="button" onclick="window.location.href='${productUrl}'" value="Cancel">
    </form>
</body>
</html>
