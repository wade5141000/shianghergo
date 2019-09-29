package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.comment_itemDao;
import com.shianghergo.model.comment_item;


@Repository
public class Icomment_itemDao implements comment_itemDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void savecomment_Item(comment_item ci) {

		Session session = factory.getCurrentSession();

		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd HH:mm");

		ci.setTime(ft.format(date));

		session.save(ci);

	}

}
