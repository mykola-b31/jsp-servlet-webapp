<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Goods</title>
</head>
<body>
    <jsp:useBean id="goodsListBean"
        class="ua.cn.stu.databean.GoodsListDatabean" />
    <jsp:useBean id="supplierListBean"
        class="ua.cn.stu.databean.SupplierListDatabean" />
    <h1>Goods Page</h1>
    <form method="post" action="goods">
        <table style="width: 100%" border="1">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Price</td>
                <td>Quantity</td>
                <td>Supplier</td>
                <td>Action</td>
            </tr>
            <c:forEach var="goods" items="${goodsListBean.goodsList}">
                <tr>
                    <td><c:out value="${goods.id}"/></td>
                    <td><c:out value="${goods.name}"/></td>
                    <td><c:out value="${goods.price}"/></td>
                    <td><c:out value="${goods.quantity}"/></td>
                    <td><c:out value="${goods.supplier.name}"/></td>
                    <td>
                        <c:url var="deleteUrl" value="/deletegoods.jsp">
                            <c:param name="goodsId" value="${goods.id}"/>
                            <c:param name="goodsName" value="${goods.name}"/>
                            <c:param name="goodsPrice" value="${goods.price}"/>
                            <c:param name="goodsQuantity" value="${goods.quantity}"/>
                            <c:param name="supplierId" value="${goods.supplier.id}"/>
                            <c:param name="supplierName" value="${goods.supplier.name}" />
                        </c:url>
                        <c:url var="updateUrl" value="/updategoods.jsp">
                            <c:param name="goodsId" value="${goods.id}"/>
                            <c:param name="goodsName" value="${goods.name}"/>
                            <c:param name="goodsPrice" value="${goods.price}"/>
                            <c:param name="goodsQuantity" value="${goods.quantity}"/>
                            <c:param name="supplierId" value="${goods.supplier.id}"/>
                            <c:param name="supplierName" value="${goods.supplier.name}" />
                        </c:url>
                        <p><a href="${deleteUrl}">Delete Goods</a></p>
                        <p><a href="${updateUrl}">Update Goods</a></p>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td>
                    <input type="text" name="goodsName">
                </td>
                <td>
                    <input type="text" name="goodsPrice">
                </td>
                <td>
                    <input type="number" name="goodsQuantity">
                </td>
                <td>
                    <select name="supplierId">
                        <c:forEach var="supplier" items="${supplierListBean.supplierList}">
                            <option value="${supplier.id}">
                                <c:out value="${supplier.name}" />
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <input type="hidden" name="actionType" value="addGoods">
                    <input type="submit" name="addGoods" value="Add Goods">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
