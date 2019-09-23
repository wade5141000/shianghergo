package com.shianghergo.model.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.model.SearchBean;
import com.shianghergo.model.SearchDAO;

@Repository
public class SearchDAOHibernate implements SearchDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public SearchBean findByPrimaryKey(BigDecimal id) {
		return this.getSession().get(SearchBean.class, id);
	}

	@Override
	public List<SearchBean> findAll() {
		return this.getSession().createQuery("from SearchBean", SearchBean.class)
				.setMaxResults(50)
				.list();
	}

	@Override
	public List<SearchBean> findSearchByName(String name) {
//		System.out.println("Name="+name);
		System.out.println("有近來hibernate-"+name);
		String hql = "from SearchBean Where Name LIKE '%"+ name +"%'";
		Query query = this.getSession().createQuery(hql, SearchBean.class);		
	
		List<SearchBean> list = query.getResultList();
//		System.out.println("有近findOrdersByName ==>list="+list);
	return list;
	}



}
