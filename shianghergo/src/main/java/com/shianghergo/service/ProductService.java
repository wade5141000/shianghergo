package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.StoreBean;


public interface ProductService {
	List<ItemBean> getAllProducts();
	
	public ItemBean getProductById(int productId);
	
	void addProduct(ItemBean product,Integer category_id);
	
	StoreBean getStoreById(int store_id);
	
	List<StoreBean> getStoreList();
	
	List<CategoryBean> getAllCategories();
	
	void updateItem(ItemBean product,Integer category_id);

	int deleteProduct(int id);
	
	public String getStoreNameByMemberId(int member_id);
}
