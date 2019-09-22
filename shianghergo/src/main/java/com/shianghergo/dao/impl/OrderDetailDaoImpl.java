package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.OrderDetailDao;
import com.shianghergo.model.OrderDetailBean;

@Repository
public class OrderDetailDaoImpl implements OrderDetailDao{

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetailBean> getOrderDetail(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "from OrderDetailBean d where d.order_id = :id";
		List<OrderDetailBean> list = session.createQuery(hql).setParameter("id", id).getResultList();
		return list;
	}

}
