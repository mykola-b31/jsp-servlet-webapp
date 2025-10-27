<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Supplier</title>
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
<jsp:useBean id="goodsListBean"
             class="ua.cn.stu.databean.GoodsListDatabean">
    <jsp:setProperty name="goodsListBean" property="supplierId" value="${param.supplierId}" />
</jsp:useBean>
<h2>Delete Supplier Confirmation</h2>
<p>Below supplier will be deleted:</p>
<p>Supplier ID: ${param.supplierId}</p>
<p>Supplier name: ${param.supplierName}</p>
<p>Supplier contact: ${param.supplierContact}</p>
<p>Supplier address: ${param.supplierAddress}</p>
<p>Supplier specialization: ${param.supplierSpecialization}</p>
<p>Supplier goods:
    <c:choose>
        <c:when test="${empty goodsListBean.goodsList}">
            (No goods associated)
        </c:when>
        <c:otherwise>
            <c:forEach var="goods" items="${goodsListBean.goodsList}" varStatus="status">
                <c:if
                        test="${goods.supplier.id == param.supplierId}">
                    <c:out value="${goods.name}" />
                    <c:if test="${!status.last}">, </c:if>
                </c:if>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</p>
<p>Could you please confirm?</p>
<c:url var="supplierUrl" value="/supplier.jsp"/>
<form method="post" action="supplier">
    <input type="hidden" name="actionType" value="deleteSupplier">
    <input type="hidden" name="supplierId" value="${param.supplierId}">
    <input type="submit" name="deleteSupplier" value="Delete Supplier">
    <input type="button" onclick="window.location.href='${supplierUrl}'" value="Cancel">
</form>
</body>
</html>