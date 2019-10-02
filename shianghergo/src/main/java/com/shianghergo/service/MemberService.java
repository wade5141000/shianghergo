package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.model.GroupsOrderDetailBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.MessageBean;
import com.shianghergo.model.OrderBean;
import com.shianghergo.model.OrderDetailBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.model.StoreBean;

public interface MemberService {
	MemberBean checkIDPassword(String userId, String password);// 檢查使用者在登入時輸入的帳號與密碼是否正確。

	boolean idExists(String account);// 判斷參數id(會員帳號)是否已經被現有客戶使用

	void saveMember(MemberBean mb);// 儲存MemberBean物件，將參數mb新增到Member表格內。

	void updateMember(MemberBean mb);// 更新會員資料

	MemberBean queryMember(String id);// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件

	MemberBean login(String account, String password);

	public List<MemberBean> getPerson();

	MemberBean getMemberById(Integer id);

	// boolean validateAccount(String account);

	// cartBean getcartById(Integer item_id);

	OrderBean getorderById(Integer id);

	MemberBean getMemberByAccount(String account);

	// List<String> getorder_info(OrderBean OB);

	public List<OrderBean> getMemberOrders(Integer id);

	public StoreBean getStoreById(Integer id);

	public List<GroupsBean> getMemberGroups(Integer id);

	public List<OrderDetailBean> getMemberOrdersD(Integer id);

	public List<GroupsOrderBean> getMemberGroupsOrders(Integer id);

	public List<Groups_ItemBean> getGroupsOrdersD(Integer groups_id);

	public List<GroupsOrderDetailBean> getGOrderD(Integer groups_order_info_id);

	public void saveMessage(MessageBean MesgB,MemberBean mb,Integer target);

	public List<MessageBean> MyMessage(Integer member_id);
	
	public List<MessageBean> getMyMessage(Integer target);

	public MessageBean getMessageByMemberId(Integer member_id);

	public List<GroupsOrderBean> getGroupsPerson(Integer id);

	public List<PlaceBean> getMyPlaceByid(Integer id);

	// int activeUser(String code);//激活會員
	
	StoreBean getStoreBeanById(int member_id);
}
