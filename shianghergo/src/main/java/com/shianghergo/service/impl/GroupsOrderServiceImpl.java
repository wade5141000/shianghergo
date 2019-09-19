package com.shianghergo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.GroupsOrderDao;
import com.shianghergo.service.GroupsOrderService;

@Service
public class GroupsOrderServiceImpl implements GroupsOrderService{

	@Autowired
	GroupsOrderDao dao;
	
	@Override
	@Transactional
	public Integer addOrder(Integer member_id,Integer gId, Integer pId) {
		return dao.addOrder(member_id,gId, pId);
	}

}
