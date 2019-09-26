package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.ItemBean;
import com.shianghergo.model.StoreBean;


public interface ProductDao {
	List<ItemBean> getAllProducts();
	
	public ItemBean getProductById(int productId);
	
	void addProduct(ItemBean product);
	StoreBean getStoreById(int store_id);
	List<StoreBean> getStoreList();

	List<String> getAllCategories();

	int updateItem(ItemBean product);

	int deleteProduct(int id);
	
}
