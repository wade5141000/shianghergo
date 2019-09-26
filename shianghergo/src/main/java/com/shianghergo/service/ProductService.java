package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.ItemBean;
import com.shianghergo.model.StoreBean;


public interface ProductService {
	List<ItemBean> getAllProducts();
	
	public ItemBean getProductById(int productId);
	
	void addProduct(ItemBean product);
	StoreBean getStoreById(int store_id);
	List<StoreBean> getStoreList();
	
	List<String> getAllCategories();
	
	void updateItem(ItemBean product);

	int deleteProduct(int id);
}
