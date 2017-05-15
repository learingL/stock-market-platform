package com.hiveview.dao;

import com.hiveview.entity.StockOrder;
import org.springframework.stereotype.Repository;

@Repository
public interface StockOrderMapperDao {

    int saveStockOrder(StockOrder record);

    StockOrder selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(StockOrder record);
}