package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.Groups_ItemBean;

public interface GroupsCartService {
	List<GroupsCartBean> getGroupsCartItems(Integer member_id);
	int addToCart(Integer mId,Groups_ItemBean ib);
}
