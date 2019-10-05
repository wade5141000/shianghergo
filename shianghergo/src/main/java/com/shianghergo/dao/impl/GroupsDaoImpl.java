package com.shianghergo.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.GroupsDao;
import com.shianghergo.exception.ProductNotFoundException;
import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.model.comment_member;

@Repository
public class GroupsDaoImpl implements GroupsDao {

	@Autowired
	SessionFactory factory;

	@Override
	public Set<Groups_ItemBean> getGroupItemsById(Integer group_id) {
		Session session = factory.getCurrentSession();
//		String hql = "from GroupsItemBean g where g.groups_id = :id";
//		List<GroupsItemBean> list = session.createQuery(hql).setParameter("id", group_id).getResultList();
		GroupsBean gb = session.get(GroupsBean.class, group_id);
		return gb.getGroupsitem();
	}

	// ------------以下士權---------------
	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsBean> getAllGroups() {
		String hql = "FROM GroupsBean";
		Session session = null;
		List<GroupsBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public Integer addGroups(GroupsBean group, Integer member_id, Integer category_id) {
		Session session = factory.getCurrentSession();
		MemberBean x = getMemberById(member_id);
		group.setMemberBean(x);
		CategoryBean y = getCategoryById(category_id);
		group.setCategoryBean(y);

		Integer id = (Integer) session.save(group);

		Set<GroupsBean> set = new HashSet<GroupsBean>();
		set = x.getGroupsbean();//
		set.add(group);
		x.setGroupsbean(set);
		return id;
	}

	@Override
	public int addGroupsItem(Groups_ItemBean groupsitem) {
		Session session = factory.getCurrentSession();
		GroupsBean x = groupsitem.getGroupsBean();

		GroupsBean gb = getGroupsById(x.getId());

		int iid = (int)session.save(groupsitem);
		Set<Groups_ItemBean> set = new HashSet<Groups_ItemBean>();
		set = gb.getGroupsitem();
		set.add(groupsitem);
		gb.setGroupsitem(set);
		
		return iid;
	}

	@Override
	public void addPlace(PlaceBean pb) {
		Session session = factory.getCurrentSession();
		GroupsBean x = pb.getGroupsBean();
		GroupsBean gb = getGroupsById(x.getId());

		session.save(pb);
		Set<PlaceBean> set = new HashSet<PlaceBean>();
		set = gb.getPlace();
		set.add(pb);
		gb.setPlace(set);

	}

	@Override
	public GroupsBean getGroupsById(int groupsId) {
		GroupsBean gb = null;
		Session session = factory.getCurrentSession();
		gb = session.get(GroupsBean.class, groupsId);

		return gb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsBean> getGroupsList() {
		String hql = "FROM GroupsBean";
		Session session = factory.getCurrentSession();
		List<GroupsBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public GroupsBean getGroupById(int groupId) {
		Session session = factory.getCurrentSession();
		GroupsBean gb = session.get(GroupsBean.class, groupId);
		if (gb == null)
			throw new ProductNotFoundException("商品編號:" + groupId + "找不到");
		return gb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Groups_ItemBean> getAllGroups_item() {
		String hql = "FROM Groups_ItemBean";
		Session session = factory.getCurrentSession();
		List<Groups_ItemBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Groups_ItemBean> getGroupsItemByGroups_id(Integer groups_id) {
		String hql = "FROM Groups_ItemBean WHERE groups_id=:groups_id";
		List<Groups_ItemBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("groups_id", groups_id).getResultList();
		System.out.println(list + "55555555");
		return list;
	}

	@Override
	public MemberBean getMemberById(Integer memberid) {

		Session session = factory.getCurrentSession();
		MemberBean mb = session.get(MemberBean.class, memberid);
		return mb;
	}

	@Override
	public CategoryBean getCategoryById(Integer category_id) {

		Session session = factory.getCurrentSession();
		CategoryBean cb = session.get(CategoryBean.class, category_id);
		return cb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlaceBean> getPlaceByGroups_id(Integer groups_id) {
		String hql = "FROM PlaceBean WHERE groups_id=:groups_id";
		List<PlaceBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("groups_id", groups_id).getResultList();
		System.out.println("66666" + list);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsBean> getAllGroupsByMember(Integer member_id) {

		String hql = "FROM GroupsBean WHERE member_id=:member_id";
		List<GroupsBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("member_id", member_id).getResultList();
		System.out.println(list + "55555555");
		return list;
	}

	@Override
	public void updategroups(GroupsBean gb) {

		Session session = factory.getCurrentSession();
//		GroupsBean x = session.get(GroupsBean.class, gb.getId());

//		CategoryBean y = getCategoryById(category_id);
//		x.setCategoryBean(y);
//		gb.setCategoryBean(y);

//		x.setName(gb.getName());
//		x.setEnd_time(gb.getEnd_time());
//		x.setDetail(gb.getDetail());
//		x.setPayment(gb.getPayment());
		session.update(gb);

		return;
	}

	@Override
	public void updateName(String name, Integer id) {
		Session session = factory.getCurrentSession();
		GroupsBean gb = session.get(GroupsBean.class, id);
		gb.setName(name);
	}

	@Override
	public PlaceBean getPlaceById(Integer pid) {
		Session session = factory.getCurrentSession();
		PlaceBean pb = session.get(PlaceBean.class, pid);
		return pb;

	}

	@Override
	public void updateplace(PlaceBean pb) {
		Session session = factory.getCurrentSession();
		PlaceBean x = session.get(PlaceBean.class, pb.getId());
		x.setAddress(pb.getAddress());
		x.setTime(pb.getTime());

		return;

	}

	@Override
	public void updateitem(Groups_ItemBean ib) {
		Session session = factory.getCurrentSession();
//		Groups_ItemBean x = session.get(Groups_ItemBean.class, ib.getId());
//	

//		x.setName(ib.getName());
//		x.setDetail(ib.getDetail());
//		x.setPrice(ib.getPrice());
//		x.setImage(ib.getImage());
		session.update(ib);
		return;

	}

	@Override
	public Groups_ItemBean getGroup_ItemById(Integer iid) {

		Session session = factory.getCurrentSession();
		Groups_ItemBean ib = session.get(Groups_ItemBean.class, iid);
		if (ib == null)
			throw new ProductNotFoundException("商品編號:" + iid + "找不到");
		return ib;
	}

	@Override
	public void deletegitemById(Integer iid) {

//		Session session = factory.getCurrentSession();
//		Groups_ItemBean gib = new Groups_ItemBean(iid);
//		
//		
//		session.delete(gib);
		Session session = factory.getCurrentSession();
		session.delete(getGroup_ItemById(iid));

	}

	@Override
	public void deletetoplace(Integer pid) {
		Session session = factory.getCurrentSession();
		session.delete(getPlaceById(pid));

	}

	@Override
	public List<CategoryBean> getCategoryList() {
		String hql = "FROM CategoryBean";
		Session session = factory.getCurrentSession();
		List<CategoryBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

//	@Override
//	public Groups_ItemBean getGroup_ItemByGroups_id(Integer groups_id) {
//		Session session = factory.getCurrentSession();
//		Groups_ItemBean gib = session.get(Groups_ItemBean.class, groups_id);
//		return gib;
//	}

	// 9/27 新增搜查開團
	@Override
	public List<GroupsBean> searchToGroups(String name) {

		String hql = "from GroupsBean Where name LIKE '%" + name + "%'";

		Session session = factory.getCurrentSession();

		@SuppressWarnings("unchecked")
		List<GroupsBean> data = session.createQuery(hql).getResultList();

		return data;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsBean> getGroupsByCategory_id(Integer category_id) {
		String hql = "From GroupsBean Where category_id =:category_id ";

		List<GroupsBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		
		 list = session.createQuery(hql).setParameter("category_id", category_id).getResultList();

		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<comment_member> getAllCommentByMember(Integer member_id) {
		String hql = "FROM comment_member WHERE member_id=:member_id";
		List<comment_member> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("member_id", member_id).getResultList();
		System.out.println(list + "55555555");
		return list;
	}

}
