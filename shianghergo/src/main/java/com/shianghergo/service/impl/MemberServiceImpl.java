package com.shianghergo.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shianghergo.dao.MemberDao;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.model.GroupsOrderDetailBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.MessageBean;
import com.shianghergo.model.OrderBean;
import com.shianghergo.model.OrderDetailBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.model.StoreBean;
import com.shianghergo.service.MemberService;


@Transactional
@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public MemberBean checkIDPassword(String userId, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean idExists(String account) {
		boolean exist = false;
		exist = dao.idExists(account);
		return exist;
	}

	@Override
	public void saveMember(MemberBean mb) {
		java.util.Date d = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeNow = sdf.format(d);
		mb.setRegister_Time(timeNow);
		dao.saveMember(mb);
	}

	@Override
	public void updateMember(MemberBean mb) {
//		MemberBean oldmb = dao.getMemberByAccount(mb.getAccount());
//		
//		
//		if(mb.getCoverImage() != null) {
//			oldmb.setFileName(mb.getFileName());
//			oldmb.setCoverImage(mb.getCoverImage());
//		}
		
		
		
		 dao.updateMember(mb);

	}

	@Override
	public MemberBean queryMember(String account) {
		
		return dao.queryMember(account);
	}


	@Override
	public MemberBean login(String account, String password) {//前
		MemberBean mmb = dao.getMemberByAccount(account);//後
		//if(mmb==null) throw new UserException("帳號不存在");
//		if(!mb.getAccount().equals(account)) throw new UserException("帳號/密碼不正確");
		System.out.println("MemberServiceImpl帳號印出:"+account);
		System.out.println("MemberServiceImpl密碼印出:"+password);
//		System.out.println(mb);
//		if(!mb.getPassword().equals(password)) throw new UserException("帳號/密碼不正確");
		return mmb;
	}

	@Override
	public List<MemberBean> getPerson() {
		return dao.getPerson();
	}

	@Override
	public MemberBean getMemberById(Integer id) {
		return dao.getMemberById(id);
	}

//	@Override
//	public cartBean getcartById(Integer item_id) {
//		return dao.getcartById(item_id);
//	}

	@Override
	public OrderBean getorderById(Integer id) {
		return dao.getorderById(id);
	}

	@Override
	public MemberBean getMemberByAccount(String account) {
		return dao.getMemberByAccount(account);
	}

	@Override
	public List<OrderBean> getMemberOrders(Integer id) {
		return dao.getMemberOrders(id);
	}

	@Override
	public StoreBean getStoreById(Integer id) {
		return dao.getStoreById(id);
	}

	@Override
	public List<GroupsBean> getMemberGroups(Integer id) {
		return dao.getMemberGroups(id);
	}

	@Override
	public List<OrderDetailBean> getMemberOrdersD(Integer id) {
		return dao.getMemberOrdersD(id);
	}

	@Override
	public List<GroupsOrderBean> getMemberGroupsOrders(Integer id) {
		return dao.getMemberGroupsOrders(id);
	}

	@Override
	public List<Groups_ItemBean> getGroupsOrdersD(Integer groups_id) {
		return dao.getGroupsOrdersD(groups_id);
	}

	@Override
	public List<GroupsOrderDetailBean> getGOrderD(Integer groups_order_info_id) {
		return dao.getGOrderD(groups_order_info_id);
	}

	@Override
	public void saveMessage(MessageBean MesgB,MemberBean mb,Integer target) {
		MesgB.setTarget(target);
		MesgB.setMemberBean(mb);
		java.util.Date d = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeNow = sdf.format(d);
		MesgB.setTime(timeNow);
		dao.saveMessage(MesgB);
		
	}

	@Override
	public List<MessageBean> MyMessage(Integer member_id) {
		return dao.MyMessage(member_id);
	}

	@Override
	public MessageBean getMessageByMemberId(Integer member_id) {
		return dao.getMessageByMemberId(member_id);
	}

	@Override
	public List<GroupsOrderBean> getGroupsPerson(Integer id) {
		return dao.getGroupsPerson(id);
	}

	@Override
	public List<PlaceBean> getMyPlaceByid(Integer id) {
		return dao.getMyPlaceByid(id);
	}

	@Override
	public List<MessageBean> getMyMessage(Integer target) {
		return dao.getMyMessage(target);
	}

//	@Override
//	public List<String> getorder_info(OrderBean OB) {
//		return dao.getorder_info(OB);
//	}

	

//	 @Override
//	    public MemberBean login(String account, String password) {
//	        HashMap<String, Object> mm = new HashMap<>();
//	      /*  UserExample userExample = new UserExample();
//	        userExample.createCriteria().andLoginnameEqualTo(loginname);*/
//	        List<MemberBean> users = MemberBean.getAccount();//根据用户名在数据库查找对应的用户
//	        String UserException = "";
//	        if ((users.size() == 0)) {//如果size=0就是没找到这个用户
//	            mm.put(UserException, "不存在!");
//	         
//	        }
//	         if ((users.size() > 1)) {//如果size>1就是这数据有问题了，不应该存在两个一样的用户名
//	            mm.put("status", "401");
//	            mm.put(msg, "error!");
//	        }
//	 
//	        MemberBean user = users.get(0);//取集合里第一个
//	        if (!password.equals(user.getPassword())) {
//	            mm.put("status", "401");
//	            mm.put(msg, "密码错误！");
//	        } else {
//	            mm.put("status", "200");
//	            mm.put(msg, "登陆成功!");
//	        }
//	        return mm;//把map集合里的状态码和信息提示返回给controller
//	    }


}
