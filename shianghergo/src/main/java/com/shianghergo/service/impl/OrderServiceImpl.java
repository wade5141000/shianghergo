package com.shianghergo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.OrderDao;
import com.shianghergo.model.OrderBean;
import com.shianghergo.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDao dao;

	@Transactional
	@Override
	public List<OrderBean> getOrderBeanByMemeber(Integer member_id) {
		return dao.getOrderBeanByMemeber(member_id);
	}

	@Transactional
	@Override
	public Integer addOrder(Integer member_id) {
		return dao.addOrder(member_id);
	}

	@Override
	@Transactional
	public void updateStatus(Integer order_id) {
		dao.updateStatus(order_id);
	}

	@Override
	@Transactional
	public OrderBean getOrderById(Integer order_id) {
		return dao.getOrderById(order_id);
	}

}
