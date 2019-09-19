package com.shianghergo.dao.impl;

import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.GroupsOrderDetailDao;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.model.GroupsOrderDetailBean;

@Repository
public class GroupsOrderDetailDaoImpl implements GroupsOrderDetailDao {

	@Autowired
	SessionFactory factory;
	
	@Override
	public Set<GroupsOrderDetailBean> getOrderDetailById(Integer id) {
		Session session = factory.getCurrentSession();
		GroupsOrderBean ob = session.get(GroupsOrderBean.class, id);
		Set<GroupsOrderDetailBean> set = ob.getOrderDetail();
//		String hql = "from GroupsOrderDetailBean d where d.groups_order_info_id = :id";
//		List<GroupsOrderDetailBean> list = session.createQuery(hql).setParameter("id",id).getResultList();
		return set;
	}

	
	
}
