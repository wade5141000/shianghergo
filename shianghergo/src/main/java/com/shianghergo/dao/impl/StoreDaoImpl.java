package com.shianghergo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.StoreDao;
import com.shianghergo.exception.ProductNotFoundException;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.StoreBean;

@Repository
public class StoreDaoImpl implements StoreDao {
	@Autowired
	SessionFactory factory;

	@Override
	@SuppressWarnings("unchecked")
	public List<StoreBean> getAllStores() {
		String hql = "FROM StoreBean";
		Session session = null;
		List<StoreBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void buildStore(StoreBean sb) {
		Session session = factory.getCurrentSession();
//		StoreBean cb = getStoreById(sb.getId());
//		sb.setMemberBean(cb);
		session.save(sb);
	}

	@Override
	public StoreBean getStoreById(int id) {
		Session session = factory.getCurrentSession();
		StoreBean cb = null;
		cb = session.get(StoreBean.class, id);
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
	public int updateStore(StoreBean sb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.update(sb);
		count++;
		return count;
	}

	@Override
	public void saveStoreIdToStop(Integer target) {

		Session session = factory.getCurrentSession();

		String hql = "FROM StoreBean where id=:id";

		StoreBean sb = (StoreBean) session.createQuery(hql).setParameter("id", target).getSingleResult();
		sb.setStatus(2);
	}

	@Override
	public Integer getStoreId(Integer target) {

		String hql = "select id FROM StoreBean where member_id=:member_id";

		Session session = factory.getCurrentSession();

		Integer list = (Integer) session.createQuery(hql).setParameter("member_id", target).getSingleResult();

		return list;
	}

	@Override
	public boolean checkStoreExist(Integer member_id) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM StoreBean where member_id=:member_id";
		try {
			StoreBean sb = (StoreBean) session.createQuery(hql).setParameter("member_id", member_id).uniqueResult();

			if (sb.getMember_id() != null) {
				exist = true;
			}
		} catch (RuntimeException ex) {
			exist = false;
		}
		System.out.println("exist=" + exist);
		return exist;// 回傳true則帳號不能使用
	}

	// 9/25新增 恢復商店權限
	@Override
	public void recoveryStore(Integer target) {

		Session session = factory.getCurrentSession();

		String hql = "FROM StoreBean where id=:id";

		StoreBean sb = (StoreBean) session.createQuery(hql).setParameter("id", target).getSingleResult();

		sb.setStatus(1);
	}

	@Override
	public StoreBean getStoreByMember_Id(Integer member_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM StoreBean where member_id=:member_id";
		StoreBean sb = (StoreBean) session.createQuery(hql).setParameter("member_id", member_id).getSingleResult();
		
		return sb;
	}
}
