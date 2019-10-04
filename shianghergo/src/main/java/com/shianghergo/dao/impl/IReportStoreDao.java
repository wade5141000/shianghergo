package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.ReportStoreDao;
import com.shianghergo.model.Report_StoreBean;


@Repository
public class IReportStoreDao implements ReportStoreDao {

	@Autowired
	SessionFactory factory;

	
	//顯示商店違規未處理的資料
		@Override
		public List<Report_StoreBean> getProcessS(Integer status) {

			String hql = "FROM Report_StoreBean where status =:status";
			
			Session session = factory.getCurrentSession();
			
			@SuppressWarnings("unchecked")
			List<Report_StoreBean> list = session.createQuery(hql).setParameter("status", status).getResultList();
			
			return list;
		}

	//存入檢舉商店資料 
	@Override
	public void saveReport(Report_StoreBean report) {

		Session session = factory.getCurrentSession();

		session.save(report);

	}

	//-存入檢舉商店資料 Process_result跟 Process_time
	@Override
	public void updateReport(Report_StoreBean rb, Long id) {

		Session session = factory.getCurrentSession();

		Report_StoreBean rsb = session.get(Report_StoreBean.class, id);

		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/ HH:mm");

		rsb.setProcess_result(rb.getProcess_result());
		rsb.setProcess_time(ft.format(date));
        rsb.setStatus(2);
		
      
	}


}
