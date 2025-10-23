<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Goods</title>
</head>
<body>
    <jsp:useBean id="supplierListBean"
                 class="ua.cn.stu.databean.SupplierListDatabean" />
    <p>Please update goods fields and press
    Update goods button or press Cancel button</p>
    <c:url var="goodsUrl" value="/goods.jsp" />
    <form method="post" action="goods">
        <input type="hidden" name="actionType" value="updateGoods">
        <input type="hidden" name="goodsId" value="${param.goodsId}">
        <p>Goods ID: <c:out value="${param.goodsId}" /></p>
        <p>Goods name:
            <input type="text" name="goodsName" value="${param.goodsName}" ></p>
        <p>Goods price:
            <input type="text" name="goodsPrice" value="${param.goodsPrice}"></p>
        <p>Goods quantity:
            <input type="number" name="goodsQuantity" value="${param.goodsQuantity}"></p>
        <p>Goods supplier:
            <select name="supplierId" >
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
        </p>
        <input type="submit" name="updateGoods" value="Update Goods">
        <input type="button" onclick="window.location.href='${goodsUrl}'" value="Cancel">
    </form>
</body>
</html>
