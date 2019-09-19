package com.shianghergo.service;

import java.util.Set;

import com.shianghergo.model.GroupsOrderDetailBean;

public interface GroupsOrderDetailService {
	Set<GroupsOrderDetailBean> getOrderDetailById(Integer id);
}
