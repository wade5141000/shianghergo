package com.shianghergo.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.GroupsDao;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;

@Repository
public class GroupsDaoImpl implements GroupsDao{
	
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsBean> getAllGroups() {
		Session session = factory.getCurrentSession();
		String hql = "from GroupsBean";
		List<GroupsBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public Set<Groups_ItemBean> getGroupItemsById(Integer group_id) {
		Session session = factory.getCurrentSession();
//		String hql = "from GroupsItemBean g where g.groups_id = :id";
//		List<GroupsItemBean> list = session.createQuery(hql).setParameter("id", group_id).getResultList();
		GroupsBean gb = session.get(GroupsBean.class, group_id);
		return gb.getGroups_Itembean();
	}

}
