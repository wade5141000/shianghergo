package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.StoreBean;


public interface ProductDao {
	List<ItemBean> getAllProducts();
	
	List<ItemBean> getRProducts();
	
	public ItemBean getProductById(int productId);
	
	int addProduct(ItemBean product,Integer category_id);
	
	StoreBean getStoreById(int store_id);
	
	List<StoreBean> getStoreList();

	List<CategoryBean> getAllCategories();

	int updateItem(ItemBean product, Integer category_id);

	int deleteProduct(int id);

	CategoryBean getCategoryById(Integer category_id);
	
	public String getStoreNameByMemberId(int member_id);
	
	public String getStoreIdByName(String store_name);
	
	public Integer getStoreIdByMemberId(Integer store_id);

	List<ItemBean> getMyProducts(int member_id);

	public String getStoreNameByItemId(Integer id);

	List<ItemBean> getProductsByCategory(Integer category_id);

	List<Integer> getAllProductsId();

	List<ItemBean> getAllProductsByStoreStatus();

}
