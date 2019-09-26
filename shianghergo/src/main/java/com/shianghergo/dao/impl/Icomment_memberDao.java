package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.comment_memberDao;
import com.shianghergo.model.comment_member;


@Repository
public class Icomment_memberDao implements comment_memberDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void savecomment_member(comment_member cm, Integer member_id) {
			
		Session session = factory.getCurrentSession();
		
		
		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		
		cm.setMember_id(member_id);

		cm.setTime(ft.format(date));

		session.save(cm);	
		

		
	}

	
}
