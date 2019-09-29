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

	@Override
	@Transactional
	public int deleteCartBeanById(Integer cart_id) {
		return dao.deleteCartBeanById(cart_id);
	}

	@Override
	@Transactional
	public GroupsCartBean updateCartBeanById(Integer cart_id,String type) {
		GroupsCartBean cb = dao.getGroupsCartBeanById(cart_id);
		if(type.equals("1")) {
			cb.setAmount(cb.getAmount()+1);
		}else if(type.equals("2")) {
			cb.setAmount(cb.getAmount()-1);
		}
		return cb;
	}

	@Override
	@Transactional
	public GroupsCartBean getGroupsCartItemById(Integer cart_id) {
		return dao.getGroupsCartBeanById(cart_id);
	}
	
	

}
