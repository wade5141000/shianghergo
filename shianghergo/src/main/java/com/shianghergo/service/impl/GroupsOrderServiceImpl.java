package com.shianghergo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.GroupsOrderDao;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.service.GroupsOrderService;

@Service
@Transactional
public class GroupsOrderServiceImpl implements GroupsOrderService{

	@Autowired
	GroupsOrderDao dao;
	
	@Override
	public Integer addOrder(Integer member_id,Integer gId) {
		return dao.addOrder(member_id,gId);
	}

	@Override
	public GroupsOrderBean getGroupsOrderById(Integer id) {
		return dao.getGroupsOrderById(id);
	}

	@Override
	public GroupsOrderBean addOrderForm(Integer oId, String name, String phone, String pay, Integer place_id) {
		return dao.addOrderForm(oId, name, phone, pay, place_id);
	}

}
