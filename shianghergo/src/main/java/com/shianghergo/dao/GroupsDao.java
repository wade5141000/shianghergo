package com.shianghergo.dao;

import java.util.List;
import java.util.Set;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;


public interface GroupsDao {
	
	List<GroupsBean> getAllGroups();
	
	Set<Groups_ItemBean> getGroupItemsById(Integer group_id);
}
