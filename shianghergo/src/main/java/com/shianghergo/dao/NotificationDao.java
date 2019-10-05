package com.shianghergo.dao;

import com.shianghergo.model.NotificationBean;

public interface NotificationDao {

     
	public void caveatNotification(NotificationBean notification ,Integer target , Integer type);
	
	public void stopNotification(NotificationBean notification ,Integer target , Integer type);

	public void recoveryNotification(NotificationBean notification, Integer target , Integer type);

}