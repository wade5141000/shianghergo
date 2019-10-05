package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.NotificationDao;
import com.shianghergo.model.NotificationBean;

@Repository
public class INotificationDao implements NotificationDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void caveatNotification(NotificationBean notification, Integer target, Integer type) {

		Session session = factory.getCurrentSession();

		if (type == 1) {

			notification.setContents("帳號因違反商城相關規範，故觸犯情節為輕微給予警告提醒，請會員務必遵守商城規範");

		} else {

			notification.setContents("帳號所屬[ 商店 ]因違反商城相關規範，故觸犯情節為輕微給予警告提醒，請會員務必遵守商城規範");

		}

		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
		String now = ft.format(date);
		notification.setTarget(target);
		notification.setTitle("管理員通知");
		notification.setTime(now);
		notification.setStatus(1);

		session.save(notification);

	}

	@Override
	public void stopNotification(NotificationBean notification, Integer target, Integer type) {

		Session session = factory.getCurrentSession();

		if (type == 1) {

			notification.setContents("帳號因違反商城相關規範之情節重大，故給予停權處分，對處分有相關疑慮可與客服人員聯絡詳談。");

		} else {

			notification.setContents("帳號所屬[ 商店 ]因違反商城相關規範之情節重大，故給予停權處分，對處分有相關疑慮可與客服人員聯絡詳談。");

		}
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
		String now = ft.format(date);
		notification.setTarget(target);
		notification.setTitle("管理員通知");
		notification.setTime(now);
		notification.setStatus(1);

		session.save(notification);

	}

	@Override
	public void recoveryNotification(NotificationBean notification, Integer target, Integer type) {

		Session session = factory.getCurrentSession();

		if (type == 1) {

			notification.setContents("帳號因停權時效已過，故恢復使用者使用權限。");

		} else {

			notification.setContents("帳號所屬[ 商店 ]因停權時效已過，故恢復商店使用權限。");

		}

		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
		String now = ft.format(date);

		notification.setTarget(target);
		notification.setTitle("管理員通知");
		notification.setTime(now);
		notification.setStatus(1);

		session.save(notification);

	}

}
