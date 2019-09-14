package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.OrderBean;

public interface OrderService {
	
	List<OrderBean> getOrderBeanByMemeber(Long member_id);
	Long addOrder(Long member_id);
	void updateStatus(Long order_id);
}
