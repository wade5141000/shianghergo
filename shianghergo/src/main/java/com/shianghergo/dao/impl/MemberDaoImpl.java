package com.shianghergo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.MemberDao;
import com.shianghergo.exception.UserException;
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


@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMember() {

		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean";

		List<MemberBean> list = session.createQuery(hql).getResultList();

		return list;
	}

	@Override
	public void saveMemberIdToStop(Integer target) {

		Session session = factory.getCurrentSession();

		String hql = "FROM  MemberBean where id=:id";

		MemberBean mb = (MemberBean) session.createQuery(hql).setParameter("id", target).getSingleResult();

		mb.setStatus(2);
	}

	@Override
	public Integer loginMember(String account) {

	String hql = "select id FROM MemberBean where account =:account";

    Session session = factory.getCurrentSession();

	Integer id = (Integer) session.createQuery(hql).setParameter("account", account).getSingleResult();
	
	return id;
		
	}
	@Override
	public MemberBean checkIDPassword(String userId, String password) {// 檢查使用者在登入時輸入的帳號與密碼是否正確。

		return null;
	}

	@Override
	public boolean idExists(String account) {// 判斷參數id(會員帳號)是否已經被現有客戶使用
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM MemberBean WHERE account = :account";
		try {
			MemberBean mb = (MemberBean) session.createQuery(hql).setParameter("account", account).uniqueResult();
			System.out.println("~mb=" + mb);

			if (mb.getAccount() != null) {
				exist = true;
			}
		} catch (RuntimeException ex) {
			exist = false;
		}
		System.out.println("exist=" + exist);
		return exist;// 回傳true則帳號不能使用

	}

	@Override
	public MemberBean queryMember(String account) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean  WHERE account = :account";
		try {
			mb = (MemberBean) session.createQuery(hql).setParameter("account", account).uniqueResult();
		} catch (NoResultException ex) {
			mb = null;
		}
		return mb;

	}

	@Override
	public void saveMember(MemberBean mb) {// 儲存MemberBean物件，將參數mb新增到Member表格內。
		Session session = factory.getCurrentSession();
		session.save(mb);
	}

	@Override
	public MemberBean getMemberById(Integer id) {
		Session session = factory.getCurrentSession();
		MemberBean mb = session.get(MemberBean.class, id);
		if (mb == null)
			throw new UserException("編號:" + id + "找不到");
		return mb;
	}

	@Override
	public void updateMember(MemberBean mb) {
//		int n = 0;
//		MemberBean Mb = null;
//		Session session = factory.getCurrentSession();
//		Mb = session.get(MemberBean.class, mb.getId());
//		mb.setAccount(Mb.getAccount());
//		mb.setPassword(Mb.getPassword());
//		mb.setName(Mb.getName());
//		mb.setPhone(Mb.getPhone());
//		mb.setEmail(Mb.getEmail());
//		mb.setBirthday(Mb.getBirthday());
//		mb.setAddress(Mb.getAddress());
//		session.evict(Mb);
//		session.saveOrUpdate(mb);
//		n++;
//		return n;
		Session session = factory.getCurrentSession();
		session.update(mb);

	}

	@Override
	public MemberBean getMemberByAccount(String account) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.account = :account";
		mb = (MemberBean) session.createQuery(hql).setParameter("account", account).uniqueResult();
		// System.out.println("getMemberByAccount:"+mb);
		return mb;
	}
//	
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<MemberBean> getMemberByPassword(String password) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM MemberBean m WHERE m.password = :password";
//		List<MemberBean> list = new ArrayList<>();
//		list = session.createQuery(hql).setParameter("password", password).getResultList();
//		return list;
//	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getPerson() {
		String hql = "FROM MemberBean";
		Session session = null;
		List<MemberBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;

	}

//	@Override
//	public cartBean getcartById(Integer item_id) {
//		cartBean cb = null;
//		Session session = factory.getCurrentSession();
//		String hql = "FROM cartBean c WHERE c.item_id = :item_id";
//		cb = (cartBean) session.createQuery(hql).setParameter("item_id", item_id).uniqueResult();
//		//System.out.println("getMemberByAccount:"+mb);
//		return cb;
//	}

	@Override
	public OrderBean getorderById(Integer id) {
		OrderBean ob = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean o WHERE o.id = :id";
		ob = (OrderBean) session.createQuery(hql).setParameter("id", id).uniqueResult();
		// System.out.println("getMemberByAccount:"+mb);
		return ob;
	}

//	@SuppressWarnings("unchecked")
//	public List<String> getorder_info(OrderBean OB){
//		String hql = "FROM OrderBean OB WHERE OB.member_id=:member_id";
//		Session session = factory.getCurrentSession();
//		List<String> list = new ArrayList<>();
//		list = session.createQuery(hql).getResultList();
//		return list;
//	}
	@Override
	public StoreBean getStoreById(Integer id) {
//		String hql = "FROM StoreBean WHERE id=:id";
		Session session = factory.getCurrentSession();

//		List<StoreBean> list = session.createQuery("hql").setParameter("id", id).getResultList();
		return session.get(StoreBean.class, id);
	}

	


//	@SuppressWarnings("unchecked")
//	@Override
//	public StoreBean getStoreBeanById(Integer id) {
//		
//		StoreBean sb = null;
//		String hql = "FROM StoreBean WHERE member_id=:id";
//		Session session = factory.getCurrentSession();
//		sb = (StoreBean) session.createQuery(hql).setParameter("id", id).uniqueResult();
//
//		
//		return sb;
//	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getMemberOrders(Integer id) {
		String hql = "FROM OrderBean WHERE member_id=:idd";
		Session session = factory.getCurrentSession();
		List<OrderBean> list = session.createQuery(hql).setParameter("idd", id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsBean> getMemberGroups(Integer id) {
		String hql = "FROM GroupsBean WHERE member_id=:iddd";
		Session session = factory.getCurrentSession();
		List<GroupsBean> list = session.createQuery(hql).setParameter("iddd", id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetailBean> getMemberOrdersD(Integer id) {
		String hql = "FROM OrderDetailBean WHERE order_id=:id";
		Session session = factory.getCurrentSession();
		List<OrderDetailBean> list = session.createQuery(hql).setParameter("id", id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsOrderBean> getMemberGroupsOrders(Integer id) {
		String hql = "FROM GroupsOrderBean WHERE member_id=:iddd";
		Session session = factory.getCurrentSession();
		List<GroupsOrderBean> list = session.createQuery(hql).setParameter("iddd", id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Groups_ItemBean> getGroupsOrdersD(Integer groups_id) {
		String hql = "FROM Groups_ItemBean WHERE groups_id=:groups_id";
		Session session = factory.getCurrentSession();
		List<Groups_ItemBean> list = session.createQuery(hql).setParameter("groups_id", groups_id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsOrderDetailBean> getGOrderD(Integer groups_order_info_id) {
		String hql = "FROM GroupsOrderDetailBean WHERE groups_order_info_id=:id";
		Session session = factory.getCurrentSession();
		List<GroupsOrderDetailBean> list = session.createQuery(hql).setParameter("id", groups_order_info_id).getResultList();
		return list;
	}

	@Override
	public void saveMessage(MessageBean MesgB) {// 儲存MemberBean物件，將參數mb新增到Member表格內。
		Session session = factory.getCurrentSession();
		session.save(MesgB);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> MyMessage(Integer member_id) {
		String hql = "FROM MessageBean WHERE member_id=:id ";
		Session session = factory.getCurrentSession();
		List<MessageBean> list = session.createQuery(hql).setParameter("id", member_id).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getMyMessage(Integer target) {
		String hql = "FROM MessageBean WHERE target=:id ";
		Session session = factory.getCurrentSession();
		List<MessageBean> list = session.createQuery(hql).setParameter("id", target).getResultList();
		return list;
	}

	@Override
	public MessageBean getMessageByMemberId(Integer member_id) {
		Session session = factory.getCurrentSession();
		MessageBean mb = session.get(MessageBean.class, member_id);
		if (mb == null)
			throw new UserException("編號:" + member_id + "找不到");
		return mb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupsOrderBean> getGroupsPerson(Integer id) {
		String hql = "FROM GroupsOrderBean WHERE groups_id=:id";
		Session session = factory.getCurrentSession();
		List<GroupsOrderBean> list = session.createQuery(hql).setParameter("id", id).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PlaceBean> getMyPlaceByid(Integer id) {
		String hql = "FROM PlaceBean WHERE id=:id";
		Session session = factory.getCurrentSession();
		List<PlaceBean> list = session.createQuery(hql).setParameter("id", id).getResultList();
		return list;
	}
	
	@Override
	public void deleteByid(Integer id) {
		Session session = factory.getCurrentSession();
		MessageBean contacts = (MessageBean) session.get(MessageBean.class, id);
		session.delete(contacts);
	}

	
	//--------------新增功能(復原會員權限) 9/25 家翔-----------------------
	
	
		public void recoveryMember(Integer target) {

			Session session = factory.getCurrentSession();

			String hql = "FROM  MemberBean where id=:id";

			MemberBean mb = (MemberBean) session.createQuery(hql).setParameter("id", target).getSingleResult();

			mb.setStatus(1);
		
		}

		
	
//		@Override
//		public StoreBean getStoreBeanById(int member_id) {
//			Session session = factory.getCurrentSession();
//			
//			String hql = "FROM StoreBean where member_id=:member_id";
//
//			StoreBean sb = (StoreBean) session.createQuery(hql).setParameter("member_id", member_id).getSingleResult();
//			
//		
//			return sb;
//		}
//	
}
