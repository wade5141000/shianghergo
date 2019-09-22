package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.Category_ReportBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.MessageBean;
import com.shianghergo.model.Report_MemberBean;
import com.shianghergo.model.Report_StoreBean;
import com.shianghergo.model.StoreBean;
import com.shianghergo.model.comment_item;
import com.shianghergo.model.comment_member;
import com.shianghergo.model.comment_store;


public interface GBDBService {

	public void deleteGroups_item(Integer id);

	List<Groups_ItemBean> getAllGroups_item();

	List<ItemBean> getAllItem();

	public void deleteItem(Integer id);

	List<MemberBean> getMember();

	void saveMemberIdToStop(Integer target);

	public void caveatMessageBean(MessageBean msg, Integer target);

	public void stopMessageBean(MessageBean msg, Integer target);

	public List<Report_MemberBean> getAll();
	
	Integer loginMember(String account);

	public void saveReport(Report_MemberBean report);

	void updateReport(Report_MemberBean rb, Integer id);

	public List<Report_StoreBean> getAllStoreBean();

	public void saveReport(Report_StoreBean report);

	public void updateReport(Report_StoreBean rb, Long id);

	List<StoreBean> getStore();

	void saveStoreIdToStop(Integer target);

	List<Category_ReportBean> getCategoryReport();

	public Integer getStoreId(Integer target);

	public void savecomment_member(comment_member cm, Integer member_id);

	public void savecomment_store(comment_store cs, Integer member_id);

	public void savecomment_Item(comment_item ci ,Integer member_id);
	
}
