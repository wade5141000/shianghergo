package com.shianghergo.model;

import java.math.BigDecimal;
import java.util.List;

public interface SearchDAO {

	public abstract SearchBean findByPrimaryKey(BigDecimal id);
	public abstract List<SearchBean> findAll();
	
	public abstract List<SearchBean> findSearchByName(String name);


	

}