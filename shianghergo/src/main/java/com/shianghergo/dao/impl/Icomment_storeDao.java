package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.comment_storeDao;
import com.shianghergo.model.comment_store;


@Repository
public class Icomment_storeDao implements comment_storeDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void savecomment_store(comment_store cs, Integer member_id) {

		Session session = factory.getCurrentSession();

	
		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd HH:mm");

		cs.setMember_id(member_id);

		cs.setTime(ft.format(date));

		session.save(cs);


	}

}
