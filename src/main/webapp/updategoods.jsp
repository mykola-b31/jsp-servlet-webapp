<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Goods</title>
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
<jsp:useBean id="supplierListBean"
             class="ua.cn.stu.databean.SupplierListDatabean" />
<h2>Update Goods</h2>
<p>Please update goods fields and press
    Update goods button or press Cancel button</p>
<c:url var="goodsUrl" value="/goods.jsp" />
<form method="post" action="goods">
    <input type="hidden" name="actionType" value="updateGoods">
    <input type="hidden" name="goodsId" value="${param.goodsId}">
    <p>Goods ID: <c:out value="${param.goodsId}" /></p>
    <label for="goodsName">Goods name:</label>
    <input id="goodsName" type="text" name="goodsName" value="${param.goodsName}" >
    <label for="goodsPrice">Goods price:</label>
    <input id="goodsPrice" type="text" name="goodsPrice" value="${param.goodsPrice}">
    <label for="goodsQuantity">Goods quantity:</label>
    <input id="goodsQuantity" type="number" name="goodsQuantity" value="${param.goodsQuantity}">
    <label for="supplierId">Goods supplier:</label>
    <select id="supplierId" name="supplierId" >
        <c:forEach var="supplier" items="${supplierListBean.supplierList}">
            <option value="${supplier.id}"
                    <c:if test="${supplier.id == param.supplierId}">
                        selected
                    </c:if>
            >
                <c:out value="${supplier.name}" />
            </option>
        </c:forEach>
    </select>
    <input type="submit" name="updateGoods" value="Update Goods">
    <input type="button" onclick="window.location.href='${goodsUrl}'" value="Cancel">
</form>
</body>
</html>