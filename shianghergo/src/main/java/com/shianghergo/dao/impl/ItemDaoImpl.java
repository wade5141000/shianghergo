package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.ItemDao;
import com.shianghergo.model.ItemBean;

@Repository
public class ItemDaoImpl implements ItemDao {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ItemBean> getAllItems() {
		
		Session session = factory.getCurrentSession();
		String hql = "from ItemBean";
		List<ItemBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

	@Override
	public ItemBean getItemById(Integer id) {
		Session session = factory.getCurrentSession();
		ItemBean ib = session.get(ItemBean.class, id);
		return ib;
	}
	
	@Override
	public void deleteItem(Integer id) {
		
		Session session = factory.getCurrentSession();
	
		String hql = "FROM ItemBean where id =:id";
		
		ItemBean one = session.get(ItemBean.class,id);
		
		System.out.println(one);
		
		session.delete(one);

	}
	
	
}
