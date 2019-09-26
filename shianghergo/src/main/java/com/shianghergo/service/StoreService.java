package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.StoreBean;

public interface StoreService {
	List<StoreBean> getAllStores();

	void buildStore(StoreBean sb);

	StoreBean getStoreById(int id);

	List<StoreBean> getStoreList();

	void updateStore(StoreBean sb);
	
	boolean checkStoreExist(Integer member_id);
}
