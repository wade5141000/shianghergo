package com.shianghergo.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.CategoryReportDao;
import com.shianghergo.dao.GroupsItemDao;
import com.shianghergo.dao.ItemDao;
import com.shianghergo.dao.MemberDao;
import com.shianghergo.dao.MessageDao;
import com.shianghergo.dao.NotificationDao;
import com.shianghergo.dao.ReportMemberDao;
import com.shianghergo.dao.ReportStoreDao;
import com.shianghergo.dao.StoreDao;
import com.shianghergo.dao.comment_itemDao;
import com.shianghergo.dao.comment_memberDao;
import com.shianghergo.dao.comment_storeDao;
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
import com.shianghergo.service.GBDBService;

@Transactional
@Service
public class GBDBServiceImp implements GBDBService {

	@Autowired
	CategoryReportDao cdao;
	@Autowired
	GroupsItemDao gdao;
	@Autowired
	ItemDao idao;
	@Autowired
	MemberDao mdao;
	@Autowired
	MessageDao msgdao;
	@Autowired
	ReportMemberDao rmdao;
	@Autowired
	ReportStoreDao rsdao;
	@Autowired
	StoreDao sdao;
	@Autowired
	comment_memberDao cmdao;
	@Autowired
	comment_storeDao csdao;
	@Autowired
	comment_itemDao cidao;
	@Autowired
	NotificationDao noDao;

	@Override
	public void deleteGroups_item(Integer id) {

		gdao.deleteGroups_item(id);

	}

	@Override
	public List<Groups_ItemBean> getAllGroups_item() {

		return gdao.getAllGroups_item();
	}

	@Override
	public List<ItemBean> getAllItem() {
		return idao.getAllItems();
	}

	@Override
	public void deleteItem(Integer id) {

		idao.deleteItem(id);

	}

	@Override
	public List<MemberBean> getMember() {

		return mdao.getMember();
	}

	@Override
	public void saveMemberIdToStop(Integer target) {

		mdao.saveMemberIdToStop(target);

	}

	@Override
	public void caveatMessageBean(MessageBean msg, Integer target) {

		msgdao.caveatMessageBean(msg, target);

	}

	@Override
	public void stopMessageBean(MessageBean msg, Integer target) {

		msgdao.stopMessageBean(msg, target);

	}

	@Override
	public void saveReport(Report_MemberBean report) {

		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/ HH:mm");

		report.setTime(ft.format(date));
		report.setStatus(1);
		rmdao.saveReport(report);

	}

	@Override
	public void updateReport(Report_MemberBean rb, Integer id) {

		rmdao.updateReport(rb, id);

	}

	@Override
	public void saveReport(Report_StoreBean report) {

		Date date = new Date();

		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd/ HH:mm");

		report.setStatus(1);
		report.setTime(ft.format(date));
		report.setContents(report.getContents());
		rsdao.saveReport(report);

	}

	@Override
	public void updateReport(Report_StoreBean rb, Long id) {

		rsdao.updateReport(rb, id);

	}

	@Override
	public List<StoreBean> getStore() {

		return sdao.getAllStores();
	}

	@Override
	public void saveStoreIdToStop(Integer target) {

		sdao.saveStoreIdToStop(target);

	}

	@Override
	public List<Category_ReportBean> getCategoryReport() {

		return cdao.getCategoryReport();
	}

	@Override
	public Integer getStoreId(Integer target) {

		return sdao.getStoreId(target);
	}

	@Override
	public void savecomment_member(comment_member cm) {

		cmdao.savecomment_member(cm);
	}

	@Override
	public void savecomment_store(comment_store cs) {

		csdao.savecomment_store(cs);

	}

	@Override
	public void savecomment_Item(comment_item ci) {

		cidao.savecomment_Item(ci);

	}

	@Override
	public Integer loginMember(String account) {

		return mdao.loginMember(account);
	}

	@Override
	public void recoveryMember(Integer target) {

	
		mdao.recoveryMember(target);
		
	}

	@Override
	public void recoveryStore(Integer target) {

		sdao.recoveryStore(target);
	}

	// ------ 9/25改過 message改成NotificationBean
	@Override
	public void caveatNotification(NotificationBean notification, Integer target ,Integer type) {

		noDao.caveatNotification(notification, target, type);

	}

	// ------ 9/25改過 message改成NotificationBean
	@Override
	public void stopNotification(NotificationBean notification, Integer target , Integer type) {

		noDao.stopNotification(notification, target ,type);
	}

	@Override
	public void recoveryNotification(NotificationBean notification, Integer target , Integer type) {

		noDao.recoveryNotification(notification, target ,type);
		
		
	}

	@Override
	public List<Report_MemberBean> getProcess(Integer status) {
	
		return rmdao.getProcess(status);
	}

	@Override
	public List<Report_StoreBean> getProcessS(Integer status) {
	
		return rsdao.getProcessS(status);
	}

	@Override
	public List<MemberBean> getMemberUSEStatus(Integer status) {
	
		return mdao.getMemberUSEStatus(status);
	}

	@Override
	public List<StoreBean> getStoreUSEStatus(Integer status) {
		
		
		return sdao.getStoreUSEStatus(status);
	}

	@Override
	public List<ItemBean> getItemByStoreId(Integer store_id) {
	
		return idao.getItemByStoreId(store_id);
	}

	@Override
	public List<Groups_ItemBean> getGroupsItemByGroupsId(Integer groups_id) {
		
		return gdao.getGroupsItemByGroupsId(groups_id);
	}

	@Override
	public double getAverageScoreByItemId(Integer id) {
		return cidao.getAverageScoreByItemId(id);
	}

	@Override
	public List<comment_item> getComment_item(Integer item_id) {
		return cidao.getComment_item(item_id);
	}
	
	@Override
	public List<comment_store> getComment_store(Integer store_id) {
		return csdao.getComment_store(store_id);
	}

	@Override
	public GroupsBean getGroupById(Integer gid) {
		return gdao.getGroupById(gid);
	}
}
