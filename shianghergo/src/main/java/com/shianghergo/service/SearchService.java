package com.shianghergo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shianghergo.dao.SearchDAO;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.SearchBean;

@Service
@Transactional
public class SearchService {
	@Autowired
	private SearchDAO searchDAO = null;

    public List<SearchBean> findAll() {
		return searchDAO.findAll();
    }
    
    public List<SearchBean> findSearchByName(String name) {
		return searchDAO.findSearchByName(name);

	}

}
