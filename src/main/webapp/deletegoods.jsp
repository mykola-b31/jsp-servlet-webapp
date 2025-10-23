<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Goods</title>
</head>
<body>
    <p>Below goods will be deleted:</p>
    <p>Goods ID: ${param.goodsId}</p>
    <p>Goods name: ${param.goodsName}</p>
    <p>Goods price: ${param.goodsPrice}</p>
    <p>Goods quantity: ${param.goodsQuantity}</p>
    <p>Goods supplier: ${param.supplierName}</p>
    <p>Could you please confirm?</p>
    <c:url var="goodsUrl" value="/goods.jsp" />
    <form method="post" action="goods">
        <input type="hidden" name="actionType" value="deleteGoods">
        <input type="hidden" name="goodsId" value="${param.goodsId}">
        <input type="submit" name="deleteGoods" value="Delete Goods">
        <input type="button" onclick="window.location.href='${goodsUrl}'" value="Cancel">
    </form>
</body>
</html>
