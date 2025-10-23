package ua.cn.stu.databean;

import ua.cn.stu.dao.HibernateDAOFactory;
import ua.cn.stu.domain.Goods;

import java.util.Collections;
import java.util.List;

public class GoodsListDatabean {
    private List<Goods> goodsList;
    private String supplierId;

    public GoodsListDatabean() {
        goodsList = HibernateDAOFactory.getInstance().getGoodsDAO().getAllGoods();
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
    }

    public List<Goods> getGoodsList() {
        if (goodsList != null) {
            return goodsList;
        }
        if (supplierId != null && !supplierId.isEmpty()) {
            try {
                Long id = Long.parseLong(supplierId);
                goodsList = HibernateDAOFactory.getInstance().getGoodsDAO().getGoodsBySupplier(id);
            } catch (NumberFormatException e) {
                goodsList = Collections.emptyList();
            }
        } else {
            goodsList = HibernateDAOFactory.getInstance().getGoodsDAO().getAllGoods();
        }
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }
}
