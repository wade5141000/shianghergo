package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.Report_StoreBean;



public interface ReportStoreDao {
	

	List<Report_StoreBean> getProcessS(Integer status);
	
	void saveReport(Report_StoreBean report);

	void updateReport(Report_StoreBean rb, Long id);

	
	
}


