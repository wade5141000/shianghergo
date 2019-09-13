package testhibernate;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class Practice {

	public static void main(String[] args) {
	
		Session session = HibernateUtils.openSession();
		Transaction tx = session.beginTransaction();
		
		Member mb = session.get(Member.class, 31l);
		
		mb.setName("更新成功");

//		session.save(mb);
		
		tx.commit();
		session.close();
		System.out.println(mb);
	}
	

}
