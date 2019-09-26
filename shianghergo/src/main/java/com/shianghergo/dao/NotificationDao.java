package com.shianghergo.dao;

import com.shianghergo.model.NotificationBean;

public interface NotificationDao {

     
	public void caveatNotification(NotificationBean notification ,Integer target);
	
	
	public void stopNotification(NotificationBean notification ,Integer target);

	public void recoveryNotification(NotificationBean notification, Integer target);

}