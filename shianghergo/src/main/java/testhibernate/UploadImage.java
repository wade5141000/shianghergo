package testhibernate;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet("/uploadimg")
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Member mb = new Member();
	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Session session = HibernateUtils.openSession();
		Transaction tx = session.beginTransaction();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		factory.setSizeThreshold(1024 * 1024);
		List items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator iter = items.iterator();
		
		while(iter.hasNext()) {
			FileItem item = (FileItem) iter.next();
			if(!item.isFormField()){
				byte[] input = item.get();
				mb.setImage(input);
			}else {
				// set other values
				setter(item.getFieldName(),item.getString("UTF-8"));
			}
		}
			
//		Blob blob = Hibernate.getLobCreator(session).createBlob(input);
//		try {
//			InputStream aaa = blob.getBinaryStream();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		session.save(mb);
		tx.commit();
		session.close();
		response.sendRedirect("/jspExercise/showimage.jsp");
	}
	
	public static void setter(String name, String value) {
		if(name.equals("name")) 
			mb.setName(value);
		if(name.equals("address")) 
			mb.setAddress(value);
		if(name.equals("age")) 
			mb.setAge(Integer.parseInt(value));
		if(name.equals("category")) 
			mb.setCategory_id(Long.parseLong(value));;
	}

}
