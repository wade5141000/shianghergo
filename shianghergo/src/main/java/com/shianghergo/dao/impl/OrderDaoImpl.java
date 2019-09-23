package com.shianghergo.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shianghergo.dao.OrderDao;
import com.shianghergo.model.CartBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.OrderBean;
import com.shianghergo.model.OrderDetailBean;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getOrderBeanByMemeber(Integer member_id) {
		Session session = factory.getCurrentSession();
		String hql = "from OrderBean o where o.member_id = :id";
		List<OrderBean> list = session.createQuery(hql).setParameter("id", member_id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Integer addOrder(Integer member_id) {
		Session session = factory.getCurrentSession();
		String hql = "from CartBean c where c.member_id = :id";
		List<CartBean> list = session.createQuery(hql).setParameter("id", member_id).getResultList();
		OrderBean ob = new OrderBean();
		int total = 0;
		for(int i=0;i<list.size();i++) {
			CartBean cb = list.get(i);
			total += cb.getPrice()*cb.getAmount();
		}
		ob.setMember_id(member_id);
		ob.setItem_count(list.size());
		ob.setPrice(total);
		ob.setPayment("信用卡");
		ob.setStatus(2);
		SimpleDateFormat fd = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String time = fd.format(new Date());
		ob.setOrder_time(time);
		int id = (int) session.save(ob);
		
		// 把訂單加到member
		MemberBean mb = session.get(MemberBean.class, member_id);
		Set<OrderBean> orders = mb.getOrders();
		orders.add(ob);
		mb.setOrders(orders);
		
		// 購物車加到detail和訂單內
		
		Set<OrderDetailBean> detail = ob.getOrderDetail();
		for(int i=0;i<list.size();i++) {
			CartBean cb = list.get(i);
			OrderDetailBean od = new OrderDetailBean();
			od.setOrder_id(id);
			od.setItem_id(cb.getItem_id());
			od.setName(cb.getName());
			od.setStore_id(cb.getStore_id());
			od.setAmount(cb.getAmount());
			od.setPrice(cb.getPrice());
			session.save(od);
			detail.add(od);
		}
		ob.setOrderDetail(detail);
		
		String hql2 = "delete CartBean where member_id = :mid";
		session.createQuery(hql2).setParameter("mid", member_id).executeUpdate();
		return id;
	}

	@Override
	public void updateStatus(Integer order_id) {
		Session session = factory.getCurrentSession();
		OrderBean ob = session.get(OrderBean.class, order_id);
		ob.setStatus(1);
		
		SimpleDateFormat sp = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		
		ob.setPay_time(sp.format(new Date()));
		
	}

}
