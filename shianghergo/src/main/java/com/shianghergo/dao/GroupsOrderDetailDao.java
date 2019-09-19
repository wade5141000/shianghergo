package com.shianghergo.dao;

import java.util.Set;

import com.shianghergo.model.GroupsOrderDetailBean;

public interface GroupsOrderDetailDao {
	Set<GroupsOrderDetailBean> getOrderDetailById(Integer id);
}
