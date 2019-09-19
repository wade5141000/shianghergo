package com.shianghergo.service;

import java.util.List;
import java.util.Set;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;


public interface GroupsService {
	List<GroupsBean> getAllGroups();
	Set<Groups_ItemBean> getGroupItemsById(Integer group_id);
}
