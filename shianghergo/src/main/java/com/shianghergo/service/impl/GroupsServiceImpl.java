package com.shianghergo.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.GroupsDao;
import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.service.GroupsService;

@Transactional
@Service
public class GroupsServiceImpl implements GroupsService{

	@Autowired
	GroupsDao dao;
	
	@Override
	@Transactional
	public List<GroupsBean> getAllGroups() {
		return dao.getAllGroups();
	}

	@Override
	@Transactional
	public Set<Groups_ItemBean> getGroupItemsById(Integer group_id) {
		return dao.getGroupItemsById(group_id);
	}
	//-----------------以下士權--------------
	@Transactional
	@Override
	public Integer addGroups(GroupsBean gb, Integer member_id,Integer category_id ) {
		return  dao.addGroups(gb,member_id,category_id);
	}
	@Transactional
	@Override
	public void addGroupsItem(Groups_ItemBean groupsitem,int gid) {
		GroupsBean gb = dao.getGroupById(gid);
		groupsitem.setGroupsBean(gb);
		dao.addGroupsItem(groupsitem);
	}
	@Transactional
	@Override
	public GroupsBean getGroupstById(int groupsId) {
		return dao.getGroupsById(groupsId);
	}
	@Transactional
	@Override
	public List<GroupsBean> getGroupsList() {
		return dao.getGroupsList();
	}
	@Transactional
	@Override
	public GroupsBean getGroupById(int groupId) {
		return dao.getGroupById(groupId);
	}
	@Override
	public List<Groups_ItemBean> getAllGroups_item() {
		return dao.getAllGroups_item();
	}
	@Override
	public List<Groups_ItemBean> getGroupsItemByGroups_id(Integer groups_id) {
		return dao.getGroupsItemByGroups_id(groups_id);
	}
	@Override
	public MemberBean getMemberById(Integer memberid) {
		return dao.getMemberById(memberid);
	}
	@Override
	public List<PlaceBean> getPlaceByGroups_id(Integer groups_id) {
		return dao.getPlaceByGroups_id(groups_id);
	}
	@Override
	public void addPlace(PlaceBean pb ,int gid) {
		GroupsBean gb = dao.getGroupById(gid);
		pb.setGroupsBean(gb);
		dao.addPlace(pb);
	}
	@Override
	public List<GroupsBean> getAllGroupsByMember(Integer member_id) {
		return dao.getAllGroupsByMember(member_id);
	}
	@Transactional
	@Override
	public void updategroups(GroupsBean gb,Integer category_id ) {
		dao.updategroups(gb,category_id);
	}
	@Transactional
	@Override
	public void updateName(String name,Integer id) {
		dao.updateName(name,id);
	}
	@Override
	public PlaceBean getPlaceById(Integer pid) {
		return dao.getPlaceById(pid);
	}
	@Override
	public void updateplace(PlaceBean pb) {
		dao.updateplace(pb);
	}
	@Override
	public void updateitem(Groups_ItemBean ib) {
		dao.updateitem(ib);
	}
	@Override
	public Groups_ItemBean getGroup_ItemById(Integer iid) {
		 return dao.getGroup_ItemById(iid);
	}
	@Override
	public void deletegitemById(Integer iid) {
		dao.deletegitemById(iid);
	}
	@Override
	public void deletetoplace(Integer pid) {
		dao.deletetoplace(pid);
	}

	@Override
	public List<CategoryBean> getCategoryList() {
		
		return dao.getCategoryList();
	}



	
}
