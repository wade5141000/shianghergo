package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.Groups_ItemBean;

public interface GroupsItemDao {
	Groups_ItemBean getGroupsItemById(Integer id);
	void deleteGroups_item(Integer id);  //下架商品
	List<Groups_ItemBean>  getAllGroups_item();        //顯示全部商品
	
}
