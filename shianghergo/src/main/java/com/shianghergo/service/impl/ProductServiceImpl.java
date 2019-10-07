package com.shianghergo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.ProductDao;
import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.StoreBean;
import com.shianghergo.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;

	@Transactional
	@Override
	public List<ItemBean> getAllProducts() {
		return dao.getAllProducts();
	}
	
	@Transactional
	@Override
	public List<ItemBean> getRProducts() {
		return dao.getRProducts();
	}

	@Transactional
	@Override
	public ItemBean getProductById(int productId) {
		return dao.getProductById(productId);
	}

	@Transactional
	@Override
	public int addProduct(ItemBean product,Integer category_id) {
		return dao.addProduct(product, category_id);
	}

	@Transactional
	@Override
	public StoreBean getStoreById(int store_id) {
		return dao.getStoreById(store_id);
	}

	@Transactional
	@Override
	public List<StoreBean> getStoreList() {
		return dao.getStoreList();
	}

	@Transactional
	@Override
	public List<CategoryBean> getAllCategories() {
		return dao.getAllCategories();
	}

	@Transactional
	@Override
	public void updateItem(ItemBean product,Integer category_id) {
		ItemBean oldItemBean = dao.getProductById(product.getId());
		oldItemBean.setName(product.getName());
		oldItemBean.setCategory_id(product.getCategory_id());
		oldItemBean.setReserve(product.getReserve());
		oldItemBean.setPrice(product.getPrice());
		oldItemBean.setDetail(product.getDetail());		
		
		if(product.getCoverImage()!=null) {
			oldItemBean.setFileName(product.getFileName());
			oldItemBean.setCoverImage(product.getCoverImage());
		}
		
		if (product.getId() != null)
			dao.updateItem(oldItemBean, category_id);
		else
			System.out.println("product.id = null !!");
	}

	@Transactional
	@Override
	public int deleteProduct(int id) {
		int n = 0;
		n = dao.deleteProduct(id);
		return n;
	}
	
	@Transactional
	@Override
	public String getStoreNameByMemberId(int member_id) {
		return dao.getStoreNameByMemberId(member_id);
	}

	@Transactional
	@Override
	public String getStoreIdByName(String store_name) {
		return dao.getStoreIdByName(store_name);
	}
	
	@Transactional
	@Override
	public Integer getStoreIdByMemberId(int member_id) {
		return dao.getStoreIdByMemberId(member_id);
	}
	
	@Transactional
	@Override
	public List<ItemBean> getMyProducts(int member_id) {
		return dao.getMyProducts(member_id);
	}

	@Transactional
	@Override
	public String getStoreNameByItemId(Integer id) {
		return dao.getStoreNameByItemId(id);
	}
	
	@Transactional
	@Override
	public List<ItemBean> getProductsByCategory(Integer category_id) {
		return dao.getProductsByCategory(category_id);
	}
	
	@Transactional
	@Override
	public List<Integer> getAllProductsId() {
		return dao.getAllProductsId();
	}

}
