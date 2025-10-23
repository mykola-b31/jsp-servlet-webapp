package ua.cn.stu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.cn.stu.dao.HibernateDAOFactory;
import ua.cn.stu.domain.Supplier;

import java.io.IOException;

@WebServlet("/supplier")
public class SupplierServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionType = req.getParameter("actionType");
        if ("addSupplier".equalsIgnoreCase(actionType)) {
            String supplierName = req.getParameter("supplierName");
            String supplierContact = req.getParameter("supplierContact");
            String supplierAddress = req.getParameter("supplierAddress");
            String supplierSpecialization = req.getParameter("supplierSpecialization");
            Supplier supplier = new Supplier();
            supplier.setName(supplierName);
            supplier.setContact(supplierContact);
            supplier.setAddress(supplierAddress);
            supplier.setSpecialization(supplierSpecialization);
            HibernateDAOFactory.getInstance().getSupplierDAO().createSupplier(supplier);
        } else if ("deleteSupplier".equalsIgnoreCase(actionType)) {
            String supplierIdString = req.getParameter("supplierId");
            Long supplierId = Long.parseLong(supplierIdString);
            HibernateDAOFactory.getInstance().getSupplierDAO().deleteSupplierById(supplierId);
        } else if ("updateSupplier".equalsIgnoreCase(actionType)) {
            String supplierIdString = req.getParameter("supplierId");
            Long supplierId = Long.parseLong(supplierIdString);
            String supplierName = req.getParameter("supplierName");
            String supplierContact = req.getParameter("supplierContact");
            String supplierAddress = req.getParameter("supplierAddress");
            String supplierSpecialization = req.getParameter("supplierSpecialization");
            Supplier supplier = HibernateDAOFactory.getInstance().getSupplierDAO().getSupplierById(supplierId);
            supplier.setName(supplierName);
            supplier.setContact(supplierContact);
            supplier.setAddress(supplierAddress);
            supplier.setSpecialization(supplierSpecialization);
            HibernateDAOFactory.getInstance().getSupplierDAO().updateSupplier(supplier);
        }

        resp.sendRedirect("supplier.jsp");
    }

}
