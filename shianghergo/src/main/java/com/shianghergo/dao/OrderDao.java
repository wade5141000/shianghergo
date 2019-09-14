package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.OrderBean;

public interface OrderDao {
	List<OrderBean> getOrderBeanByMemeber(Long member_id);
	Long addOrder(Long member_id);
	void updateStatus(Long order_id);
}
