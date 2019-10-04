package com.shianghergo.dao;

import java.util.List;
import java.util.Set;


import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.PlaceBean;


public interface GroupsDao {
	
	List<GroupsBean> getAllGroups();
	
	Set<Groups_ItemBean> getGroupItemsById(Integer group_id);
	
	// ---------------------------
	
	Integer addGroups(GroupsBean Groups,Integer member_id,Integer category_id);//新增團
	int addGroupsItem(Groups_ItemBean groupsitme); //新增商品
	GroupsBean getGroupsById(int groupsid);  //取到團的ID
	List<GroupsBean> getGroupsList(); 
	GroupsBean getGroupById(int groupId); //查詢單一團的資料
	List<Groups_ItemBean> getAllGroups_item();
	List<Groups_ItemBean> getGroupsItemByGroups_id(Integer groups_id); //由團ID抓商品
	MemberBean getMemberById(Integer memberid);
	List<PlaceBean> getPlaceByGroups_id(Integer groups_id);
	void addPlace(PlaceBean pb);
	List<GroupsBean> getAllGroupsByMember(Integer member_id);
	void updategroups(GroupsBean gb);
	void updateName(String name, Integer id);
	PlaceBean getPlaceById(Integer pid);
	void updateplace(PlaceBean pb);
	void updateitem(Groups_ItemBean ib);
	Groups_ItemBean getGroup_ItemById(Integer iid);
	void deletegitemById(Integer iid);
	void deletetoplace(Integer pid);
	List<CategoryBean> getCategoryList();
	CategoryBean getCategoryById(Integer category_id);
	List<GroupsBean>  searchToGroups(String name); //查詢開團列表 9/27新增

	List<GroupsBean> getGroupsByCategory_id(Integer category_id);
	
}
