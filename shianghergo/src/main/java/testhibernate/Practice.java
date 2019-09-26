package testhibernate;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shianghergo.model.ItemBean;
import com.shianghergo.model.StoreBean;
import com.shianghergo.service.StoreService;
import com.shianghergo.service.impl.StoreServiceImpl;

public class Practice {

	public static void main(String[] args) {
	
//		Session session = HibernateUtils.openSession();
//		Transaction tx = session.beginTransaction();
//		Member mb = session.get(Member.class, 31l);
//		mb.setName("更新成功");
////		session.save(mb);
//		tx.commit();
//		session.close();
//		System.out.println(mb);
		
		ItemBean ib1 = new ItemBean();
		ib1.setName("aaa");
		ItemBean ib2 = new ItemBean();
		ib2.setName("bbb");
		ItemBean ib3 = new ItemBean();
		ib3.setName("ccc");
		
		Set<ItemBean> set = new HashSet<>();
		set.add(ib1);
		set.add(ib2);
		set.add(ib3);
		
		Object[] aaa = set.toArray();
		for(int i=0;i<aaa.length;i++) {
			ItemBean qq = (ItemBean)aaa[i];
			System.out.println(qq.getName());
		}
		
	}
	

}
