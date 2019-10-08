package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.model.GroupsOrderDetailBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.MessageBean;
import com.shianghergo.model.NotificationBean;
import com.shianghergo.model.OrderBean;
import com.shianghergo.model.OrderDetailBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.model.StoreBean;

public interface MemberDao {

	List<MemberBean> getMember();

	void saveMemberIdToStop(Integer target);

	Integer loginMember(String account);

	//--新增的 復原會員權限 家翔// 9/24
		public void recoveryMember(Integer target);

	// 以下 聖捷

	MemberBean checkIDPassword(String userId, String password);// 檢查使用者在登入時輸入的帳號與密碼是否正確。

	boolean idExists(String account);// 判斷參數id(會員帳號)是否已經被現有客戶使用

	void saveMember(MemberBean mb);// 儲存MemberBean物件，將參數mb新增到Member表格內。

	void updateMember(MemberBean mb);// 更新會員資料

	MemberBean queryMember(String account);// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件

	MemberBean getMemberById(Integer id);// 根據id找會員

	MemberBean getMemberByAccount(String account);// 根據帳號找會員

//	List<MemberBean> getMemberByPassword(String password);//根據帳號找會員

	List<MemberBean> getPerson();

	OrderBean getorderById(Integer id);

	List<OrderBean> getMemberOrders(Integer id);

	StoreBean getStoreById(Integer id);
	
//	public StoreBean getStoreBeanById(Integer id);

	List<GroupsBean> getMemberGroups(Integer id);

	List<OrderDetailBean> getMemberOrdersD(Integer id);

	List<GroupsOrderBean> getMemberGroupsOrders(Integer id);

	public List<Groups_ItemBean> getGroupsOrdersD(Integer groups_id);

	List<GroupsOrderDetailBean> getGOrderD(Integer groups_order_info_id);

	public void saveMessage(MessageBean MesgB);

	List<MessageBean> MyMessage(Integer member_id);
	
	public List<MessageBean> getMyMessage(Integer target);

	MessageBean getMessageByMemberId(Integer member_id);

	public List<GroupsOrderBean> getGroupsPerson(Integer id);

	public List<PlaceBean> getMyPlaceByid(Integer id);

	public List<NotificationBean> getNotificationByid(Integer target);

	public void deleteByid(Integer id);
	
	public void deletenotiByid(Integer id);
	

	//用狀態碼查詢正常/停權會員 10/03 
	List<MemberBean> getMemberUSEStatus(Integer status);
	
	List<MessageBean> getMessageByTarget(Integer target);

}
