package com.shianghergo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.GroupsItemDao;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.service.GroupsItemService;

@Service
public class GroupsItemServiceImpl implements GroupsItemService{
	
	@Autowired
	GroupsItemDao dao;

	@Override
	@Transactional
	public Groups_ItemBean getGroupsItemById(Integer id) {
		return dao.getGroupsItemById(id);
	}
}
