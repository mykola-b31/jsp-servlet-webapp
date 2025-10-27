<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Goods</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        h1, h2, h3, p { color: #333; }
        input[type=submit], input[type=button] {
            background-color: #dc3545; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 10px;
        }
        input[type=button] { background-color: #6c757d; }
        form { background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 2px 3px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
<h2>Delete Goods Confirmation</h2>
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