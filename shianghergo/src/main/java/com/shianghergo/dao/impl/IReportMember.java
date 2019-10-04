package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.ReportMemberDao;
import com.shianghergo.model.Report_MemberBean;


@Repository
public class IReportMember implements ReportMemberDao {

	@Autowired
	SessionFactory factory;

	@Override
	public List<Report_MemberBean> getProcess(Integer status) {
		String hql = "FROM Report_MemberBean where status =:status";

		Session session = factory.getCurrentSession();

		@SuppressWarnings("unchecked")
		List<Report_MemberBean> list = session.createQuery(hql).setParameter("status", status).getResultList();

		return list;
	}


	@Override
	public void saveReport(Report_MemberBean report) {

		Session session = factory.getCurrentSession();

		session.save(report);

	}

	@Override
	public void updateReport(Report_MemberBean rb,Integer id) {
		
		Session session = factory.getCurrentSession();
		
		Report_MemberBean rmb = session.get(Report_MemberBean.class, id);

		
		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/ HH:mm");

		rmb.setProcess_result(rb.getProcess_result());
		rmb.setProcess_time(ft.format(date));
		rmb.setStatus(2);
		
      
			
	}

}
