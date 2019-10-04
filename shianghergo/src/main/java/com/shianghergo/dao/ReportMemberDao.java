package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.Report_MemberBean;


public interface ReportMemberDao {
	

	List<Report_MemberBean> getProcess(Integer status);
	
	void saveReport(Report_MemberBean rp);
		
	void updateReport(Report_MemberBean rb, Integer id);	
	}


