package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.Groups_ItemBean;

public interface GroupsCartDao {
	List<GroupsCartBean> getGroupsCartItems(Integer member_id);
	int addToCart(Integer mId, Groups_ItemBean ib);
}
