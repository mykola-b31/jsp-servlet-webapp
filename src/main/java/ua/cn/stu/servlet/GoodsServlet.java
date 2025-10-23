package ua.cn.stu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ua.cn.stu.dao.HibernateDAOFactory;
import ua.cn.stu.domain.Goods;
import ua.cn.stu.domain.Supplier;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/goods")
public class GoodsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionType = req.getParameter("actionType");
        if("addGoods".equalsIgnoreCase(actionType)) {
            String goodsName = req.getParameter("goodsName");
            String goodsPriceSting = req.getParameter("goodsPrice");
            BigDecimal goodsPrice = new BigDecimal(goodsPriceSting);
            String goodsQuantityString = req.getParameter("goodsQuantity");
            int goodsQuantity = Integer.parseInt(goodsQuantityString);
            String supplierIdString = req.getParameter("supplierId");
            Long supplierId = Long.parseLong(supplierIdString);
            Supplier supplier = HibernateDAOFactory.getInstance().getSupplierDAO().getSupplierById(supplierId);
            Goods goods = new Goods();
            goods.setName(goodsName);
            goods.setPrice(goodsPrice);
            goods.setQuantity(goodsQuantity);
            goods.setSupplier(supplier);
            HibernateDAOFactory.getInstance().getGoodsDAO().createGoods(goods);
        } else if ("deleteGoods".equalsIgnoreCase(actionType)) {
            String goodsIdString = req.getParameter("goodsId");
            Long goodsId = Long.parseLong(goodsIdString);
            HibernateDAOFactory.getInstance().getGoodsDAO().deleteGoodsById(goodsId);
        } else if ("updateGoods".equalsIgnoreCase(actionType)) {
            String goodsIdString = req.getParameter("goodsId");
            Long goodsId = Long.parseLong(goodsIdString);
            String goodsName = req.getParameter("goodsName");
            String goodsPriceSting = req.getParameter("goodsPrice");
            BigDecimal goodsPrice = new BigDecimal(goodsPriceSting);
            String goodsQuantityString = req.getParameter("goodsQuantity");
            int goodsQuantity = Integer.parseInt(goodsQuantityString);
            String supplierIdString = req.getParameter("supplierId");
            Long supplierId = Long.parseLong(supplierIdString);
            Supplier supplier = HibernateDAOFactory.getInstance().getSupplierDAO().getSupplierById(supplierId);
            Goods goods = HibernateDAOFactory.getInstance().getGoodsDAO().getGoodsById(goodsId);
            goods.setName(goodsName);
            goods.setPrice(goodsPrice);
            goods.setQuantity(goodsQuantity);
            goods.setSupplier(supplier);
            HibernateDAOFactory.getInstance().getGoodsDAO().updateGoods(goods);
        }
        resp.sendRedirect("goods.jsp");
    }
}
