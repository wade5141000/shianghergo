package com.shianghergo.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.GroupsItemDao;
import com.shianghergo.model.Groups_ItemBean;

@Repository
public class GroupsItemDaoImpl implements GroupsItemDao{

	@Autowired
	SessionFactory factory;
	
	@Override
	public Groups_ItemBean getGroupsItemById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.get(Groups_ItemBean.class, id);
	}

}
