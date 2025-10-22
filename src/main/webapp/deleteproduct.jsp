<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <p>Below product will be deleted:</p>
    <p>Product id ${param.productid}</p>
    <p>Product name ${param.productname}</p>
    <p>Product description ${param.productdescription}</p>
    <p>Could you please confirm?</p>
    <c:url var="productUrl" value="/product.jsp"/>
    <form method="post" action="product">
        <input type="hidden" name="actiontype" value="deleteproduct"/>
        <input type="hidden" name="productid" value="${param.productid}">
        <input type="submit" name="deleteproduct" value="Delete Product">
        <input type="button" onclick="window.location.href='${productUrl}'" value="Cancel">
    </form>
</body>
</html>
