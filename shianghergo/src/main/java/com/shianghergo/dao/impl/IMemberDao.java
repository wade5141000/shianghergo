package com.shianghergo.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.MemberDao;
import com.shianghergo.model.MemberBean;


@Repository
public class IMemberDao implements MemberDao {

	@Autowired
	SessionFactory factory;

	@Override
	public List<MemberBean> getMember() {

		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean";

		List<MemberBean> list = session.createQuery(hql).getResultList();

		return list;

	}

	@Override
	public void saveMemberIdToStop(Integer target) {

		Session session = factory.getCurrentSession();

		String hql = "FROM  MemberBean where id=:id";

		MemberBean mb = (MemberBean) session.createQuery(hql).setParameter("id", target).getSingleResult();

		mb.setStatus(2);

		
	}

	@Override
	public Integer loginMember(String account) {
		

	String hql = "select id FROM MemberBean where account =:account";

    Session session = factory.getCurrentSession();

	Integer id = (Integer) session.createQuery(hql).setParameter("account", account).getSingleResult();
	
	
	return id;
		
			
	}

}
