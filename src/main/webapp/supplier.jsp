<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier</title>
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
<jsp:useBean id="supplierListBean"
             class="ua.cn.stu.databean.SupplierListDatabean" />
<h1>Supplier Page</h1>
<form method="post" action="supplier">
    <table style="width: 100%" border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Specialization</th>
            <th>Action</th>
        </tr>
        <c:forEach var="supplier" items="${supplierListBean.supplierList}">
            <tr>
                <td><c:out value="${supplier.id}" /></td>
                <td><c:out value="${supplier.name}" /></td>
                <td><c:out value="${supplier.contact}" /></td>
                <td><c:out value="${supplier.address}" /></td>
                <td><c:out value="${supplier.specialization}" /></td>
                <td>
                    <c:url var="deleteUrl" value="/deletesupplier.jsp">
                        <c:param name="supplierId" value="${supplier.id}" />
                        <c:param name="supplierName" value="${supplier.name}" />
                        <c:param name="supplierContact" value="${supplier.contact}" />
                        <c:param name="supplierAddress" value="${supplier.address}" />
                        <c:param name="supplierSpecialization" value="${supplier.specialization}" />
                    </c:url>
                    <c:url var="updateUrl" value="/updatesupplier.jsp">
                        <c:param name="supplierId"
                                 value="${supplier.id}" />
                        <c:param name="supplierName" value="${supplier.name}" />
                        <c:param name="supplierContact" value="${supplier.contact}" />
                        <c:param name="supplierAddress" value="${supplier.address}" />
                        <c:param name="supplierSpecialization" value="${supplier.specialization}" />
                    </c:url>
                    <p><a href="${deleteUrl}">Delete Supplier</a></p>
                    <p><a href="${updateUrl}">Update Supplier</a></p>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td>Add New:</td>
            <td>
                <input type="text" name="supplierName" placeholder="Supplier Name">
            </td>
            <td>
                <input type="text" name="supplierContact" placeholder="Contact">
            </td>
            <td>
                <input type="text" name="supplierAddress" placeholder="Address">
            </td>
            <td>
                <input type="text" name="supplierSpecialization" placeholder="Specialization">
            </td>
            <td>
                <input type="hidden" name="actionType" value="addSupplier">
                <input type="submit" name="addSupplier" value="Add Supplier">
            </td>
        </tr>
    </table>
</form>
</body>
</html>