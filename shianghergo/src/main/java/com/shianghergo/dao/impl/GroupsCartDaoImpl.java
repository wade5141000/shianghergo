package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.GroupsCartDao;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.Groups_ItemBean;

@Repository
public class GroupsCartDaoImpl implements GroupsCartDao{

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsCartBean> getGroupsCartItems(Integer member_id) {
		Session session = factory.getCurrentSession();
		String hql = "from GroupsCartBean c where c.member_id = :id";
		List<GroupsCartBean> list = session.createQuery(hql).setParameter("id", member_id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int addToCart(Integer mId, Groups_ItemBean ib) {
		// 回傳 1 處理成功 回傳 2 有非本店商品
		Session session = factory.getCurrentSession();
		String hql = "from GroupsCartBean c where c.member_id = :id";
		List<GroupsCartBean> list = session.createQuery(hql).setParameter("id",mId).getResultList();
		boolean flag = true;
		for(GroupsCartBean cb : list) {
			if(!cb.getGroups_id().equals(ib.getGroupsBean().getId())) {
				return 2;
			}else {
				if(cb.getGroups_item_id().equals(ib.getId())) {
					GroupsCartBean cb2 = session.get(GroupsCartBean.class, cb.getId());
					cb2.setAmount(cb2.getAmount()+1);
					flag = false;
					return 1;
				}
			}
		}
		
		if(flag) {
			GroupsCartBean cb3 = new GroupsCartBean();
			cb3.setAmount(1);
			cb3.setGroups_id(ib.getGroupsBean().getId());
			cb3.setGroups_item_id(ib.getId());
			cb3.setMember_id(mId);
			cb3.setName(ib.getName());
			cb3.setPrice(ib.getPrice());
			session.save(cb3);
		}
		return 1;
	}

	@Override
	public int deleteCartBeanById(Integer cart_id) {
		Session session = factory.getCurrentSession();
		GroupsCartBean cb = session.get(GroupsCartBean.class, cart_id);
		int reduce = (int) (cb.getAmount()*cb.getPrice());
		session.delete(cb);
		return reduce;
	}

	@Override
	public GroupsCartBean getGroupsCartBeanById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.get(GroupsCartBean.class, id);
	}
}
