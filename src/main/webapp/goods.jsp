<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Goods</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        h1 { color: #333; }
        nav { margin-bottom: 20px; background-color: #eee; padding: 10px; border-radius: 5px; }
        nav a { text-decoration: none; color: #007BFF; padding: 10px; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; box-shadow: 0 2px 3px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #007BFF; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        input[type=text], input[type=number], select {
            width: 95%; padding: 10px; margin: 5px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
        }
        input[type=submit], input[type=button] {
            background-color: #007BFF; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 10px;
        }
        input[type=button] { background-color: #6c757d; }
        a { color: #007BFF; }
        form { background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 2px 3px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
<nav>
    <a href="goods.jsp">Goods</a>
    <a href="supplier.jsp">Suppliers</a>
</nav>
<jsp:useBean id="goodsListBean"
             class="ua.cn.stu.databean.GoodsListDatabean" />
<jsp:useBean id="supplierListBean"
             class="ua.cn.stu.databean.SupplierListDatabean" />
<h1>Goods Page</h1>
<form method="post" action="goods">
    <table style="width: 100%" border="1">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Supplier</th>
            <th>Action</th>
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
                    <c:url var="updateUrl"
                           value="/updategoods.jsp">
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
            <td>Add New:</td>
            <td>
                <input type="text" name="goodsName" placeholder="Goods Name">
            </td>
            <td>
                <input type="text" name="goodsPrice" placeholder="Goods Price">
            </td>
            <td>
                <input type="number" name="goodsQuantity" placeholder="Quantity">
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