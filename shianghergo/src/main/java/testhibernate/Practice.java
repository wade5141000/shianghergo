package testhibernate;

import java.sql.Blob;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Practice {

	public static void main(String[] args) {
	
		Session session = HibernateUtils.openSession();
		Transaction tx = session.beginTransaction();
		
		
		Member mb = new Member();
		mb.setName("圖片哥");
		mb.setAge(27);
		mb.setCategory_id(4l);
		
		
		
		session.save(mb);
		
		tx.commit();
		session.close();
		System.out.println(mb);
	}
	

}
