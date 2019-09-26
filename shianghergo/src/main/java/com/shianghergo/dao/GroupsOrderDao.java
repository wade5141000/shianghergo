package com.shianghergo.dao;

import com.shianghergo.model.GroupsOrderBean;

public interface GroupsOrderDao {
	Integer addOrder(Integer member_id,Integer gId);
	GroupsOrderBean getGroupsOrderById(Integer id);
	GroupsOrderBean addOrderForm(Integer oId, String name, String phone, String pay, Integer place_id);
}
