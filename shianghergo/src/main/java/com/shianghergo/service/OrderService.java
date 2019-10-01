package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.OrderBean;

public interface OrderService {
	
	List<OrderBean> getOrderBeanByMemeber(Integer member_id);
	Integer addOrder(Integer member_id);
	void updateStatus(Integer order_id);
	OrderBean getOrderById(Integer order_id);
}
