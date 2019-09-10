//package testhibernate;
//
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.Blob;
//import org.hibernate.Hibernate;
//import org.hibernate.HibernateException;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.cfg.Configuration;
//
//public class HibernateTest extends TestCase {
//	private Session session;
//
//	protected void setUp() throws Exception {
//		try {
//			Configuration config = new Configuration().configure();
//			SessionFactory sf = config.buildSessionFactory();
//			session = sf.openSession();
//		} catch (HibernateException e) {
//			e.printStackTrace();
//		}
//	}
//
//	protected void tearDown() throws Exception {
//		try {
//			session.close();
//		} catch (HibernateException e) {
//			e.printStackTrace();
//		}
//	}
//
////	public void testSave() throws FileNotFoundException, IOException {
////		User user = new User();
////		user.setName("jordan");
////		FileInputStream in = new FileInputStream("C://test.gif");
////		Blob photo = Hibernate.createBlob(in);
////		user.setPhoto(photo);
////		Transaction tx = null;
////		try {
////			tx = session.beginTransaction();
////			session.saveOrUpdate(user);
////			tx.commit();
////		} catch (HibernateException e) {
////			if (tx != null)
////				tx.rollback();
////			e.printStackTrace();
////		} finally {
////			in.close();
////		}
////	}
//
////	public void testLoad() throws Exception {
////		try {
////			User user = (User) session.load(User.class, new Integer(1));
////			Blob photo = user.getPhoto();
////			InputStream in = photo.getBinaryStream();
////			FileOutputStream out = new FileOutputStream("C://out//test2.gif");
////			byte[] buf = new byte[1024];
////			int len;
////			while ((len = in.read(buf)) != -1) {
////				out.write(buf, 0, len);
////			}
////			in.close();
////			out.close();
////		} catch (HibernateException e) {
////			e.printStackTrace();
////		}
//	}
//}