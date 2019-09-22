package com.shianghergo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.ItemDao;
import com.shianghergo.model.ItemBean;
import com.shianghergo.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	ItemDao dao;
	
	@Override
	@Transactional
	public List<ItemBean> getAllItems() {
		return dao.getAllItems();
	}

	@Override
	@Transactional
	public ItemBean getItemById(Integer id) {
		return dao.getItemById(id);
	}

}
