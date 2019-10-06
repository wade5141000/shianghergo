package com.shianghergo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.GroupsItemDao;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.ItemBean;

@Repository
public class GroupsItemDaoImpl implements GroupsItemDao {

	@Autowired
	SessionFactory factory;

	@Override
	public Groups_ItemBean getGroupsItemById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.get(Groups_ItemBean.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Groups_ItemBean> getAllGroups_item() {

		String hql = "FROM Groups_ItemBean";

		List<Groups_ItemBean> list = new ArrayList<>();

		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();

		return list;
	}

	@Override
	public void deleteGroups_item(Integer id) {

		Session session = factory.getCurrentSession();

		String hql = "FROM Groups_ItemBean where id =:id";

		Groups_ItemBean one = session.get(Groups_ItemBean.class, id);

		System.out.println(one);

		session.delete(one);

	}

	@Override
	public List<Groups_ItemBean> getGroupsItemByGroupsId(Integer groups_id) {
		
		Session session = factory.getCurrentSession();

		String hql = "FROM Groups_ItemBean where groups_id =:groups_id";

		List<Groups_ItemBean> groups = session.createQuery(hql).setParameter("groups_id", groups_id).getResultList();

		return groups;
		
	}

	@Override
	public GroupsBean getGroupById(Integer gid) {
		Session session = factory.getCurrentSession();
		return session.get(GroupsBean.class, gid);
	}

	
}
