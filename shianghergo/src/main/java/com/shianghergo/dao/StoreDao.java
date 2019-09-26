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
	
	public boolean checkStoreExist(Integer member_id);

	void recoveryStore(Integer target);

	StoreBean getStoreByMember_Id(Integer member_id);
}
