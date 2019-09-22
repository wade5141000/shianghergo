package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.OrderDetailBean;

public interface OrderDetailDao {
	List<OrderDetailBean> getOrderDetail(Integer id);
}
