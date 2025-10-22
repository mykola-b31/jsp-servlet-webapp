package ua.cn.stu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.cn.stu.dao.HibernateDAOFactory;
import ua.cn.stu.domain.Product;

import java.io.IOException;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionType = req.getParameter("actiontype");
        if ("addproduct".equalsIgnoreCase(actionType)) {
            String productName = req.getParameter("productname");
            String productDescription = req.getParameter("productdescription");
            Product product = new Product();
            product.setName(productName);
            product.setDescription(productDescription);
            HibernateDAOFactory.getInstance().getProductDAO().createProduct(product);
        } else if ("deleteproduct".equalsIgnoreCase(actionType)) {
            String productIdString = req.getParameter("productid");
            Long productId = Long.parseLong(productIdString);
            HibernateDAOFactory.getInstance().getProductDAO().deleteProductById(productId);
        } else if ("updateproduct".equalsIgnoreCase(actionType)) {
            String productIdString = req.getParameter("productid");
            Long productId = Long.parseLong(productIdString);
            String productName = req.getParameter("productname");
            String productDescription = req.getParameter("productdescription");
            Product product = HibernateDAOFactory.getInstance().getProductDAO().getProductById(productId);
            product.setName(productName);
            product.setDescription(productDescription);
            HibernateDAOFactory.getInstance().getProductDAO().updateProduct(product);
        }

        resp.sendRedirect("product.jsp");
    }
}
