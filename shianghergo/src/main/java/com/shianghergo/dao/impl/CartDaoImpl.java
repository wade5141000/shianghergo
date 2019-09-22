package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.CartDao;
import com.shianghergo.model.CartBean;
import com.shianghergo.model.ItemBean;

@Repository
public class CartDaoImpl implements CartDao{

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public void saveToCart(ItemBean ib,Integer member_id) {
		Session session = factory.getCurrentSession();
		
		String hql = "from CartBean c where c.member_id = :id";
		List<CartBean> list = session.createQuery(hql).setParameter("id", member_id).getResultList();
		boolean flag = true;
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getItem_id().equals(ib.getId())) {
				CartBean cb = session.get(CartBean.class, list.get(i).getId());
				cb.setAmount(cb.getAmount()+1);
				flag = false;
			}
		}
		if(flag) {
			CartBean cb = new CartBean();
			cb.setMember_id(member_id);
			cb.setItem_id(ib.getId());
			cb.setStore_id(ib.getStore_id());
			cb.setPrice(ib.getPrice());
			cb.setName(ib.getName());
			cb.setAmount(1);
			session.save(cb);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CartBean> getCartItems(Integer member_id) {
		Session session = factory.getCurrentSession();
		String hql = "from CartBean c where c.member_id = :id";
		List<CartBean> list = session.createQuery(hql).setParameter("id", member_id).getResultList();
		return list;
	}

	@Override
	public CartBean getCartBeanById(Integer cart_id) {
		Session session = factory.getCurrentSession();
		CartBean cb = session.get(CartBean.class, cart_id);
		return cb;
	}
	
	@Override
	public int deleteCartBeanById(Integer cart_id) {
		Session session = factory.getCurrentSession();
		CartBean cb = session.get(CartBean.class, cart_id);
		int reduce = (int) (cb.getAmount()*cb.getPrice());
		session.delete(cb);
		return reduce;
	}

}
