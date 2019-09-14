package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.OrderDetailBean;

public interface OrderDetailService {
	
	List<OrderDetailBean> getOrderDetail(Long id);
}
