package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.MessageDao;
import com.shianghergo.model.MessageBean;


@Repository
public class IMessageBeanDao implements MessageDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void caveatMessageBean(MessageBean msg, Integer target) {
	
		Session session = factory.getCurrentSession();

		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
		msg.setTitle("管理員通知");
//		msg.setMember_id(777777);
		msg.setContents("因違規警告一次作為處罰，若情節嚴重將停權處分，詳情聯絡客服人員");
		msg.setTarget(target);
		msg.setTime(ft.format(date));
		msg.setStatus(2);
		
		session.save(msg);	
		
	}

	@Override
	public void stopMessageBean(MessageBean msg, Integer target) {
	
		Session session = factory.openSession();

		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
		msg.setTitle("管理員通知");
//		msg.setMember_id(777777);
		msg.setContents("因違規情節嚴重，停權數日，有疑慮可連絡客服為您處理。");
		msg.setTarget(target);
		msg.setTime(ft.format(date));
		msg.setStatus(2);
		
		session.save(msg);	
		
		
	}
	

}
