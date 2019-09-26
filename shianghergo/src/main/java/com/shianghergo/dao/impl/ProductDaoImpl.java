package com.shianghergo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.ProductDao;
import com.shianghergo.exception.ProductNotFoundException;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.StoreBean;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ItemBean> getAllProducts(){
		String hql = "FROM ItemBean";
		Session session = null;
		List<ItemBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public ItemBean getProductById(int productId) {
		Session session = factory.getCurrentSession();
		ItemBean bb = session.get(ItemBean.class, productId);
		if(bb == null)
			throw new ProductNotFoundException("商品編號:" + productId + "找不到");
		return bb;
	}

	@Override
	public void addProduct(ItemBean product) {
		Session session = factory.getCurrentSession();
		StoreBean cb = getStoreById(product.getStore_id());
		product.setStoreBean(cb);
		session.save(product);
	}

	@Override
	public StoreBean getStoreById(int store_id) {
		StoreBean cb = null;
		Session session = factory.getCurrentSession();
		cb = session.get(StoreBean.class, store_id);
		return cb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<StoreBean> getStoreList() {
		String hql = "FROM StoreBean";
		Session session = factory.getCurrentSession();
		List<StoreBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public List<String> getAllCategories() {
		String hql = "SELECT DISTINCT i.category FROM ItemBean i";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public int updateItem(ItemBean product) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.update(product);
		count++;
		return count;
	}
	
	@Override
	public int deleteProduct(int id) {
		int n = 0;
		Session session = factory.getCurrentSession();
		ItemBean bb = new ItemBean();
		bb.setId(id);
		session.delete(bb);
		n++;
		return n;
	}
}
