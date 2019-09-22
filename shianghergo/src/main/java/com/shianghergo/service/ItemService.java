package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.ItemBean;

public interface ItemService {
	
	List<ItemBean> getAllItems();
	ItemBean getItemById(Integer id);
}
