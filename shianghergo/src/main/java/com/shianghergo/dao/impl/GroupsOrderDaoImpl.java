package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.GroupsOrderDao;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.model.GroupsOrderDetailBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.PlaceBean;

@Repository
public class GroupsOrderDaoImpl implements GroupsOrderDao{

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Integer addOrder(Integer member_id,Integer gId,Integer pId) {
		Session session = factory.getCurrentSession();
		
		// 加入訂單
		GroupsOrderBean ob = new GroupsOrderBean();
		ob.setGroups_id(gId);
		ob.setMember_id(member_id);
		ob.setStatus(1);
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		ob.setTime(sf.format(new Date()));
		ob.setPayment("面交");
		PlaceBean pb = session.get(PlaceBean.class, pId);
		ob.setPlace(pb);
		
		int total = 0;
		String hql = "from GroupsCartBean c where c.member_id = :id";
		List<GroupsCartBean> list = session.createQuery(hql).setParameter("id", member_id).getResultList();
		for(GroupsCartBean cb : list) {
			total += cb.getAmount()*cb.getPrice();
		}
		ob.setPrice(total);
		int oId = (int)session.save(ob);
		
		// 把訂單加到member
		MemberBean mb = session.get(MemberBean.class, member_id);
		Set<GroupsOrderBean> groupOrders = mb.getGroupOrders();
		groupOrders.add(ob);
		mb.setGroupOrders(groupOrders);
		
		
		// 購物車加到detail和訂單內
		
		Set<GroupsOrderDetailBean> set = ob.getOrderDetail();
		for(GroupsCartBean cb : list) {
			GroupsOrderDetailBean od = new GroupsOrderDetailBean();
			od.setAmount(cb.getAmount());
			od.setGroups_item_id(cb.getGroups_item_id());
			od.setGroups_order_info_id(oId);
			od.setName(cb.getName());
			od.setPrice(cb.getPrice());
			session.save(od);
			set.add(od);
		}
		ob.setOrderDetail(set);
		String hql2 = "delete GroupsCartBean where member_id = :mid";
		session.createQuery(hql2).setParameter("mid", member_id).executeUpdate();
		return oId;
	}

}
