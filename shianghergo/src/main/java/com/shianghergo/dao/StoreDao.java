package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.StoreBean;

public interface StoreDao {

	List<StoreBean> getAllStores();

	void buildStore(StoreBean sb);

	StoreBean getStoreById(int id);

	List<StoreBean> getStoreList();

	int updateStore(StoreBean sb);
	
	void saveStoreIdToStop(Integer target);
	
	Integer getStoreId(Integer target);
	
	//--新增的 復原會員權限 家翔// 9/25
		public void recoveryStore(Integer target);
	
}
