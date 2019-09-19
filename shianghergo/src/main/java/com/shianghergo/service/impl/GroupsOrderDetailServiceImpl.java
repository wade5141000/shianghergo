package com.shianghergo.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.GroupsOrderDetailDao;
import com.shianghergo.model.GroupsOrderDetailBean;
import com.shianghergo.service.GroupsOrderDetailService;

@Service
public class GroupsOrderDetailServiceImpl implements GroupsOrderDetailService{

	@Autowired
	GroupsOrderDetailDao dao;
	
	@Override
	@Transactional
	public Set<GroupsOrderDetailBean> getOrderDetailById(Integer id) {
		return dao.getOrderDetailById(id);
	}
	
}
