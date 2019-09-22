package com.shianghergo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.OrderDetailDao;
import com.shianghergo.model.OrderDetailBean;
import com.shianghergo.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	OrderDetailDao dao;
	
	
	@Override
	@Transactional
	public List<OrderDetailBean> getOrderDetail(Integer id) {
		return dao.getOrderDetail(id);
	}

}
