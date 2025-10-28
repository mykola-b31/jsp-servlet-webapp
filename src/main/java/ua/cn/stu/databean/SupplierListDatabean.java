package ua.cn.stu.databean;

import ua.cn.stu.dao.HibernateDAOFactory;
import ua.cn.stu.domain.Supplier;

import java.util.Collections;
import java.util.List;

public class SupplierListDatabean {
    public List<Supplier> supplierList;
    private String goodsNameSearch;

    public SupplierListDatabean() {}

    public void setGoodsNameSearch(String goodsNameSearch) {
        this.goodsNameSearch = goodsNameSearch;
    }

    public List<Supplier> getSupplierList() {
        if (supplierList != null) {
            return supplierList;
        }

        if (goodsNameSearch != null && !goodsNameSearch.trim().isEmpty()) {
            supplierList = HibernateDAOFactory.getInstance().getSupplierDAO().getSuppliersByGoodsName(goodsNameSearch);
        } else {
            supplierList = HibernateDAOFactory.getInstance().getSupplierDAO().getAllSuppliers();
        }

        if (supplierList == null) {
            supplierList = Collections.emptyList();
        }

        return supplierList;
    }

    public void setSupplierList(List<Supplier> supplierList) {
        this.supplierList = supplierList;
    }
}
