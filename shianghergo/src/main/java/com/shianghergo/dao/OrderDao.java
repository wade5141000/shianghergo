package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.OrderBean;

public interface OrderDao {
	List<OrderBean> getOrderBeanByMemeber(Integer member_id);
	Integer addOrder(Integer member_id);
	void updateStatus(Integer order_id);
}
