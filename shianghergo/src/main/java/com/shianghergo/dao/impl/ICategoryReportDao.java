package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.CategoryReportDao;
import com.shianghergo.model.Category_ReportBean;


@Repository
public class ICategoryReportDao  implements CategoryReportDao {

	@Autowired
	SessionFactory factory;


	public List<Category_ReportBean> getCategoryReport() {
			
		
		String hql = "FROM Category_ReportBean" ;
		
		Session session = factory.getCurrentSession();
		
		List<Category_ReportBean> list = session.createQuery(hql).getResultList();
		
		 
		 return list;
		

	}

}
