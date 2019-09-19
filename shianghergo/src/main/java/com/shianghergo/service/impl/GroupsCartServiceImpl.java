package com.shianghergo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.GroupsCartDao;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.service.GroupsCartService;

@Service
public class GroupsCartServiceImpl implements GroupsCartService{

	@Autowired
	GroupsCartDao dao;
	
	@Override
	@Transactional
	public List<GroupsCartBean> getGroupsCartItems(Integer member_id) {
		List<GroupsCartBean> list = dao.getGroupsCartItems(member_id);
		return list;
	}

	@Override
	@Transactional
	public int addToCart(Integer mId, Groups_ItemBean ib) {
		return dao.addToCart(mId, ib);
	}

}
