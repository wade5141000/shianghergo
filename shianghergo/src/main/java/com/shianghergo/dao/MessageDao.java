package com.shianghergo.dao;

import com.shianghergo.model.MessageBean;

public interface MessageDao {

     
	public void caveatMessageBean(MessageBean msg ,Integer target);
	
	
	public void stopMessageBean(MessageBean msg ,Integer target);

	
	
}
