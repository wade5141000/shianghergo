package com.shianghergo.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.GroupsDao;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.service.GroupsService;

@Service
public class GroupsServiceImpl implements GroupsService{

	@Autowired
	GroupsDao dao;
	
	@Override
	@Transactional
	public List<GroupsBean> getAllGroups() {
		return dao.getAllGroups();
	}

	@Override
	@Transactional
	public Set<Groups_ItemBean> getGroupItemsById(Integer group_id) {
		return dao.getGroupItemsById(group_id);
	}

}
