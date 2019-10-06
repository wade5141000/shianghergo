package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.Category_ReportBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.MessageBean;
import com.shianghergo.model.NotificationBean;
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

	List<Report_MemberBean> getProcess(Integer status);

	List<Report_StoreBean> getProcessS(Integer status);

	Integer loginMember(String account);

	public void saveReport(Report_MemberBean report);

	void updateReport(Report_MemberBean rb, Integer id);

	public void saveReport(Report_StoreBean report);

	public void updateReport(Report_StoreBean rb, Long id);

	List<StoreBean> getStore();

	void saveStoreIdToStop(Integer target);

	List<Category_ReportBean> getCategoryReport();

	public Integer getStoreId(Integer target);

	public void savecomment_member(comment_member cm);

	public void savecomment_store(comment_store cs);

	public void savecomment_Item(comment_item ci);

	// --新增的 復原會員權限---// 9/25
	public void recoveryMember(Integer target);

	// --新增的 復原會員權限---// 9/25
	public void recoveryStore(Integer target);

	// --新增的 message改為NotificationBean---// 9/25 /警告
	public void caveatNotification(NotificationBean notification, Integer target ,Integer type);

	// --新增的 message改為NotificationBean---// 9/25 /停權
	public void stopNotification(NotificationBean notification, Integer target , Integer type);

	// --新增的 message改為NotificationBean---// 9/25 /恢復權限
	public void recoveryNotification(NotificationBean notification, Integer target , Integer type);
	
	//用狀態碼查詢正常/停權會員 10/03 
	List<MemberBean> getMemberUSEStatus(Integer status);
	
	//用狀態碼查詢正常/停權商家 10/03 
	public List<StoreBean> getStoreUSEStatus(Integer status);
   
	//用商店ID查詢商店所持有的商品 10/04
	List<ItemBean> getItemByStoreId(Integer store_id);
	
	//用團購號ID查詢團購商品 10/04
	public List<Groups_ItemBean> getGroupsItemByGroupsId(Integer groups_id);
	
	//拿商品平均評價分數
	public double getAverageScoreByItemId(Integer id);
	
	//拿comment_item
	public List<comment_item> getComment_item(Integer item_id);
	
	//拿comment_store
	public List<comment_store> getComment_store(Integer store_id);
	
	GroupsBean getGroupById(Integer gid);
}
