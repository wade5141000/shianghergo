package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
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

	@Override
	public void setLatLngs(Double lat, Double lng, String loca) {
//		Session session = factory.getCurrentSession();
//		String hql = "from PlaceBean where address=:add";
//		PlaceBean pb = (PlaceBean)session.createQuery(hql).setParameter("add", loca).uniqueResult();
		
//		Criteria criteria = session.createCriteria(PlaceBean.class);
//		criteria.addOrder(Order.desc("id"));
//		criteria.setMaxResults(1);
//		PlaceBean pb=(PlaceBean)criteria.uniqueResult(); 
//		
//		pb.setLatitude(lat);
//		pb.setLongitude(lng);
		
	}

}
