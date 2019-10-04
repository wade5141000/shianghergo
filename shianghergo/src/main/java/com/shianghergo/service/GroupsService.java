package com.shianghergo.service;

import java.util.List;
import java.util.Set;

import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.PlaceBean;


public interface GroupsService {
	List<GroupsBean> getAllGroups();
	Set<Groups_ItemBean> getGroupItemsById(Integer group_id);
	//----------------以下士權------------------
	Integer addGroups(GroupsBean gb , Integer member_id,Integer category_id);
	int addGroupsItem(Groups_ItemBean groupsitem,int idd);
	GroupsBean getGroupstById(int groupsId);
	List<GroupsBean> getGroupsList();
	public GroupsBean getGroupById(int groupId);//查詢單一團的資料
	List<Groups_ItemBean> getAllGroups_item();
	List<Groups_ItemBean> getGroupsItemByGroups_id(Integer groups_id);
	public MemberBean getMemberById(Integer memberid);
	List<PlaceBean> getPlaceByGroups_id(Integer groups_id);
	void addPlace(PlaceBean pb ,int idd);
	List<GroupsBean> getAllGroupsByMember(Integer member_id);
	void updategroups(GroupsBean gb,Integer category_id );
	void updateName(String name,Integer id);
	public PlaceBean getPlaceById(Integer pid);	
	void updateplace(PlaceBean pb);
	void updateitem(Groups_ItemBean ib);
	public Groups_ItemBean getGroup_ItemById(Integer iid);
	void deletegitemById(Integer iid);
	void deletetoplace(Integer pid);
	List<CategoryBean> getCategoryList();
	
	List<GroupsBean> searchToGroups(String name); //查詢開團列表//9/27新增 
	List<GroupsBean> getGroupsByCategory_id(Integer category_id);//團列表的分類顯示
	

	
	
	
}
