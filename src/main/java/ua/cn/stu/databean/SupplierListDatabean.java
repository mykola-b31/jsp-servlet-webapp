package ua.cn.stu.databean;

import ua.cn.stu.dao.HibernateDAOFactory;
import ua.cn.stu.domain.Supplier;

import java.util.List;

public class SupplierListDatabean {
    public List<Supplier> supplierList;

    public SupplierListDatabean() {
        supplierList = HibernateDAOFactory.getInstance().getSupplierDAO().getAllSuppliers();
    }

    public List<Supplier> getSupplierList() {
        return supplierList;
    }

    public void setSupplierList(List<Supplier> supplierList) {
        this.supplierList = supplierList;
    }
}
