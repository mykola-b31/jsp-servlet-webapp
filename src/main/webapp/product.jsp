<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product</title>
</head>
<body>
    <jsp:useBean id="productListBean"
        class="ua.cn.stu.databean.ProductListDatabean" />
    <h1>Product Page</h1>
    <form method="post" action="product">
        <table style="width:100%" border="1">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Description</td>
                <td>Action</td>
            </tr>
            <c:forEach var="product" items="${productListBean.productList}">
                <tr>
                    <td><c:out value="${product.id}" /></td>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.description}" /></td>
                    <td>
                        <c:url var="deleteUrl" value="/deleteproduct.jsp">
                            <c:param name="productid" value="${product.id}"/>
                            <c:param name="productname" value="${product.name}"/>
                            <c:param name="productdescription" value="${product.description}"/>
                        </c:url>
                        <c:url var="updateUrl" value="updateproduct.jsp">
                            <c:param name="productid" value="${product.id}"/>
                            <c:param name="productname" value="${product.name}"/>
                            <c:param name="productdescription" value="${product.description}"/>
                        </c:url>
                        <p><a href="${deleteUrl}">Delete Product</a></p>
                        <p><a href="${updateUrl}">Update Product</a></p>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td>
                </td>
                <td>
                    <input type="text" name="productname" />
                </td>
                <td>
                    <input type="text" name="productdescription" />
                </td>
                <td>
                    <input type="hidden" name="actiontype" value="addproduct">
                    <input type="submit" name="addproduct" value="Add Product">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
