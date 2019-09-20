package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.PlaceDao;
import com.shianghergo.model.PlaceBean;

@Repository
public class PlaceDaoImpl implements PlaceDao{

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PlaceBean> getAllPlace() {
		Session session = factory.getCurrentSession();
		String hql = "from PlaceBean";
		List<PlaceBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
