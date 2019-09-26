package com.shianghergo.service;

import com.shianghergo.model.GroupsOrderBean;

public interface GroupsOrderService {
	Integer addOrder(Integer member_id,Integer gId);
	GroupsOrderBean getGroupsOrderById(Integer id);
	GroupsOrderBean addOrderForm(Integer oId,String name,String phone,String pay,Integer place_id);
}
