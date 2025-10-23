<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier</title>
</head>
<body>
    <jsp:useBean id="supplierListBean"
             class="ua.cn.stu.databean.SupplierListDatabean" />
    <h1>Goods Page</h1>
    <form method="post" action="supplier">
        <table style="width: 100%" border="1">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Contact</td>
                <td>Address</td>
                <td>Specialization</td>
                <td>Action</td>
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
                            <c:param name="supplierId" value="${supplier.id}" />
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
                <td></td>
                <td>
                    <input type="text" name="supplierName">
                </td>
                <td>
                    <input type="text" name="supplierContact">
                </td>
                <td>
                    <input type="text" name="supplierAddress">
                </td>
                <td>
                    <input type="text" name="supplierSpecialization">
                </td>
                <td>
                    <input type="hidden" name="actionType" value="addSupplier">
                    <input type="submit" name="addSupplier" value="addSupplier">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
