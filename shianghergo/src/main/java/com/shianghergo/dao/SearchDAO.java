package com.shianghergo.dao;

import java.math.BigDecimal;
import java.util.List;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.SearchBean;

public interface SearchDAO {

	public abstract SearchBean findByPrimaryKey(BigDecimal id);
	
	public abstract List<SearchBean> findAll();
	
	public abstract List<SearchBean> findSearchByName(String name);

}