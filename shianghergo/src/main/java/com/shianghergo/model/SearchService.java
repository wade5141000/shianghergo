package com.shianghergo.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class SearchService {
	@Autowired
	private SearchDAO searchDAO = null;

    public List<SearchBean> findAll() {
		return searchDAO.findAll();
    }
    
    public List<SearchBean> findSearchByName(String Member_Id) {
		return searchDAO.findSearchByName(Member_Id);

	}
}
