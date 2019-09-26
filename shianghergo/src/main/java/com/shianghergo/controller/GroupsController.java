package com.shianghergo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;

import com.shianghergo.model.PlaceBean;
import com.shianghergo.service.GroupsService;



@Controller
@SessionAttributes(value = "mid")

public class GroupsController {

	@Autowired
	GroupsService service;
	@Autowired
	ServletContext context;
	@Autowired
	HttpSession session;
	@Autowired
	SessionFactory factory;

//	int temp = 0;

	@RequestMapping("/frank/admin")
	public String login() {
		return "frank/admin";
	}

	// ----------------登入---------------
	@RequestMapping("/frank/login")
	public String login(Model model, String account) {
		String hql = "select id FROM MemberBean where account =:account";
		Session session = factory.openSession();

		Integer id = (Integer) session.createQuery(hql).setParameter("account", account).getSingleResult();
		model.addAttribute("mid", id);
		System.out.println("111:  " + id);
		return "frank/home";

	}

	// --------------------取的開團表單----------------------
	@RequestMapping(value = "/frank/Groups1", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		GroupsBean gb = new GroupsBean();

		java.util.Date d = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String timeNow = sdf.format(d);
		List<CategoryBean> list =service.getCategoryList();
		model.addAttribute("now", timeNow);

		model.addAttribute("groupsBean", gb);
		model.addAttribute("category",list );
		System.out.println(list);

		
		return "frank/addGroups";
	}

	// -------------------------開團 並把會員member_id 放入------------
	@RequestMapping(value = "/frank/Groups1", method = RequestMethod.POST)
	public String processAddNewProductForm(Model model, @ModelAttribute("groupsBean") GroupsBean gb,
			BindingResult result, HttpServletRequest request, @ModelAttribute("mid") Integer member_id,
			@RequestParam("categoryBean") Integer category_id) {

		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位:" + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		System.out.println("有沒有阿~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		MultipartFile productImage = gb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		System.out.println(originalFilename);
//		gib.setFileName(originalFilename);
		String ext = ".jpg";
		String rootDirectory = context.getRealPath("/");

		if (productImage != null && !productImage.isEmpty()) {
			byte[] b;
			try {
				b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				gb.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		 if(gb.getPayment().length() !=1) {
			 gb.setPayment("3");
		 }
		
		
		Integer id = service.addGroups(gb, member_id,category_id);
		System.out.println("-----------------------------");
		System.out.println(id);

		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, gb.getId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳生異常:" + e.getMessage());
		}
		
		
		

		return "redirect:/frank/showgroup?gid=" + id;
	}
	// return "forward:/anotherFWD": 轉發(forward)給能夠匹配給 /anotherFWD的控制器方法
	// 將與下一棒的程式共用同一個請求物件
	// return "anotherFWD": 也是轉發，但Spring框架會視anotherFWD為視圖的邏輯名稱來尋找
	// 對應的視圖，然後由該視圖來產生回應

//	@ModelAttribute("category")
//	public Map<Integer, String> getCompanyList() {
//		Map<Integer, String> categoryMap = new HashMap<>();
//		List<CategoryBean> list = service.getCategoryList();
//		for (CategoryBean cb : list) {
//			categoryMap.put(cb.getId(),cb.getName());
//		}
//		
//		return categoryMap;
//	}
//	
	
	
	
	
	
	
	

	// ----------------新增商品取的表單-----------------------
	@RequestMapping(value = "/frank/additem", method = RequestMethod.GET)
	public String AddNewGroupsItemForm(@RequestParam("gid") Integer gid, Model model) {
		System.out.println("測試" + gid);
		Groups_ItemBean gib = new Groups_ItemBean();

		model.addAttribute("groupsitemBean", gib);
		model.addAttribute("gid", gid);

		System.out.println("測試1" + gid);
		return "frank/addGroupsItem2";

	}

	@RequestMapping(value = "/frank/additem", method = RequestMethod.POST)
	public String getAddNewProductForm(@RequestParam("gid") Integer gid,@ModelAttribute("groupsitemBean") Groups_ItemBean gib, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位:" + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		MultipartFile productImage = gib.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		System.out.println(originalFilename);
//		gib.setFileName(originalFilename);
		String ext = ".jpg";
		String rootDirectory = context.getRealPath("/");

		if (productImage != null && !productImage.isEmpty()) {
			byte[] b;
			try {
				b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				gib.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}

		service.addGroupsItem(gib, gid);

		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, gib.getId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳生異常:" + e.getMessage());
		}
		return "redirect:/frank/showgroup?gid=" + gid;
	}

	//--------------------------------取商品圖片---------------------------------
	@RequestMapping(value = "/frank/getPicture/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletRequest resp, @PathVariable Integer id) {
		String filePath = "C:\\Users\\User\\git\\shianghergo\\shianghergo\\src\\main\\webapp\\images\\hello.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "1.png";
		int len = 0;
		System.out.println("---------------------------------------------------");
		Groups_ItemBean bean =  service.getGroup_ItemById(id);
		if (bean != null) {
			Blob blob = bean.getImage();
//			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	//--------------------------------取團圖片---------------------------------
		@RequestMapping(value = "/frank/getgroupPicture/{id}", method = RequestMethod.GET)
		public ResponseEntity<byte[]> getgroupPicture(HttpServletRequest resp, @PathVariable Integer id) {
			String filePath = "C:\\Users\\User\\git\\shianghergo\\shianghergo\\src\\main\\webapp\\images\\hello.png";
			byte[] media = null;
			HttpHeaders headers = new HttpHeaders();
			String filename = "1.png";
			int len = 0;
			System.out.println("---------------------------------------------------");
			GroupsBean bean =  service.getGroupById(id);
			if (bean != null) {
				Blob blob = bean.getImage();
//				filename = bean.getFileName();
				if (blob != null) {
					try {
						len = (int) blob.length();
						media = blob.getBytes(1, len);
					} catch (SQLException e) {
						throw new RuntimeException("ProductController的getPicture()發生SQLException:" + e.getMessage());
					}
				} else {
					media = toByteArray(filePath);
					filename = filePath;
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			String mimeType = context.getMimeType(filename);
			MediaType mediaType = MediaType.valueOf(mimeType);
			System.out.println("mediaType = " + mediaType);
			headers.setContentType(mediaType);
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
			return responseEntity;
		}
	
	
	
	
	private byte[] toByteArray(String filePath) {
		byte[] b = null;
		String realPath = context.getRealPath(filePath);
		System.out.println(realPath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filePath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	
	
	
	
	
	// -----------------------新增商品------------------
//	@RequestMapping(value = "/frank/additem", method = RequestMethod.POST)
//	public String AddNewGroupsIteForm(@RequestParam("gid") Integer gid,
//			@ModelAttribute("groupsitemBean") Groups_ItemBean gib, GroupsBean gb) {
//
//		System.out.println("有進來嗎" + gid);
//
//		service.addGroupsItem(gib, gid);
//
//		return "redirect:/frank/showgroup?gid=" + gid;
//	}


////---------------新增商品 取的表單 並把groups_id 放入-------------------
//	@RequestMapping(value = "/item", method = RequestMethod.GET)
//	public String getAddNewGroupsItemForm(Model model, HttpServletRequest rq) {
//
//		Groups_ItemBean gbid = new Groups_ItemBean();
//		String gid = rq.getParameter("id");
//		System.out.println("00000000000000000000000000");
//		System.out.println(gid);
//
//		model.addAttribute("groupsitemBean", gbid);
//		rq.getSession(true).setAttribute("gid", gid);
//
//		return "addGroupsItem";
//	}
//
////-----------------------新增商品------------------
//	@RequestMapping(value = "/item", method = RequestMethod.POST)
//	public String processAddNewGroupsIteForm(@ModelAttribute("groupsitemBean") Groups_ItemBean gbid,
//			BindingResult result, HttpServletRequest request) {
////		gbid.setGroups_id(temp);
//
//		System.out.println("進來了");
//		int gid = Integer.parseInt(String.valueOf(request.getSession().getAttribute("gid")));
//		service.addGroupsItem(gbid, gid);
//		System.out.println("idd= " + gid);
//
//		return "addGroupsItem";
//	}

	// ----------------新增地址-----------------------
	@RequestMapping(value = "/frank/addplace", method = RequestMethod.GET)
	public String AddNewPlaceForm(@RequestParam("gid") Integer gidd, Model model, HttpServletRequest rq) {
		System.out.println("測試" + gidd);
		PlaceBean pb = new PlaceBean();

		model.addAttribute("placeBean", pb);
		model.addAttribute("gid", gidd);

		System.out.println("測試1" + gidd);
		return "frank/addPlace2";

	}

	// -----------------------新增地址------------------
	@RequestMapping(value = "/frank/addplace", method = RequestMethod.POST)
	public String AddNewPlaceForm(@RequestParam("gid") Integer gid, @ModelAttribute("placeBean") PlaceBean pb,
			GroupsBean gb) {

		System.out.println("有進來嗎" + gid);

		service.addPlace(pb, gid);

		return "redirect:/frank/showgroup?gid=" + gid;
	}

//	//-----------------------新增地址取的表單------------------
//		@RequestMapping(value = "/place", method = RequestMethod.GET)
//		public String processAddNewPlaceForm(Model model, HttpServletRequest rq) {
//
//			PlaceBean pb = new PlaceBean();
//
//			model.addAttribute("placeBean", pb);
//
//			return "addPlace";
//		}
//
//	//-----------------------新增地址------------------
//		@RequestMapping(value = "/place", method = RequestMethod.POST)
//		public String processAddNewPlaceForm(@ModelAttribute("placeBean") PlaceBean pb, BindingResult result,
//				HttpServletRequest request) {
//
//			System.out.println("進來了");
//
//			int idd = Integer.parseInt(String.valueOf(request.getSession().getAttribute("gid")));
//
//			service.addPlace(pb, idd);
//
//			return "addPlace";
//		}

//--------------------團購列表---------------------------
	@RequestMapping("/frank/groups")
	public String list(Model model) {
		List<GroupsBean> list = service.getAllGroups();
		model.addAttribute("groups", list);
//		return "frank/groups";
		return "frank/Ngroup";
	}

//-------------------------某一個團購頁面---------------------------
	@RequestMapping("/frank/group") // 查詢單一產品
	public String getGroupsById(@RequestParam("id") Integer id, @RequestParam("mid") Integer mid, Model model,
			Integer groups_id, GroupsBean gb) {
		System.out.println("id: " + id);
		System.out.println("mid:  " + mid);

		model.addAttribute("group", service.getGroupById(id)); // 取團的資料

		model.addAttribute("groups_id", service.getGroupsItemByGroups_id(gb.getId())); // 取商品的資料

		model.addAttribute("member_id", service.getMemberById(mid)); // 取會員的資料

		model.addAttribute("place", service.getPlaceByGroups_id(gb.getId())); // 取地址的資料

//		System.out.println("測試21"+gb.getMemberBean().getId());

//		System.out.println("groups_id");
		return "frank/group";
	}

	// -----------------查詢所有商品(測試用)-----------------
	@RequestMapping("/frank/queryByGroups_id") // 查詢單一產品
	public String getAllGroups_idList(Model model) {
		List<Groups_ItemBean> list = service.getAllGroups_item();
		model.addAttribute("groups_idList", list);
		System.out.println(list);
		return "frank/itemm";
		
	}

	// -------------------團主資料------------------
	@RequestMapping("/frank/memberdata") // 查詢單一產品
	public String getMemberById(@RequestParam("mmid") Integer mmid, Model model) {

		System.out.println("member mid:  " + mmid);

		model.addAttribute("member", service.getMemberById(mmid)); // 取會員的資料

		return "frank/memberdata";
	}

	// -----------------------------我開的團------------------------------
	@RequestMapping("/frank/mygroups") // 查詢單一產品
	public String getAllGroupsListByMember(Model model, GroupsBean gb, @ModelAttribute("mid") Integer member_id) {

		model.addAttribute("mygroups", service.getAllGroupsByMember(member_id));
		return "frank/mygroups";
	}

	// ---------------------------某一團的詳細資料--------------------------
	@RequestMapping("/frank/showgroup")
	public String getALLGroupById(@RequestParam("gid") Integer gid, Model model, GroupsBean gb) {

		model.addAttribute("updategroup", service.getGroupById(gid)); // 取團的資料

		return "frank/showgroup";
	}

	// ------------------------修改團的表單-----------------
	@RequestMapping(value = "/frank/updatetogroup", method = RequestMethod.GET)
	public String updatetogroups(@RequestParam("gid") Integer gid, Model model) {
		List<CategoryBean> list =service.getCategoryList();
		model.addAttribute("category",list );
		model.addAttribute("updategroup", service.getGroupById(gid));
		GroupsBean gb = new GroupsBean();

		model.addAttribute("upgroupsBean", gb);

		return "frank/updategroup";

	}

	// ---------------------修改團的資料-----------------
	@RequestMapping(value = "/frank/updatetogroup", method = RequestMethod.POST)
	public String updatetogroups(@RequestParam("name") String name, @RequestParam("end_time") String end_time,
			@RequestParam("detail") String detail, @RequestParam("payment") String payment,
			@RequestParam("id") Integer id,@RequestParam("categoryBean") Integer category_id,
			@ModelAttribute("upgroupsBean") GroupsBean gb,BindingResult result, HttpServletRequest request) {
			
		if (gb.getProductImage() != null) {
			MultipartFile productImage = gb.getProductImage();
			String originalFilename = productImage.getOriginalFilename();
		System.out.println("1111111111111111111111111111111111111111111111111111111111111111");

			if (productImage != null && !productImage.isEmpty()) {
				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
				String rootDirectory = context.getRealPath("/");
				System.out.println("2222222222222222222222222222222222222222222222222222222");
				byte[] b;
				try {
					b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					gb.setImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			}
		}
		gb.setId(id);
		

//		gb.setName(name);
//		gb.setEnd_time(end_time);
//		gb.setDetail(detail);
//		gb.setPayment(payment);
//		gb.setId(id);
			
		
		 if(gb.getPayment().length() !=1) {
			 gb.setPayment("3");
		 }
		service.updategroups(gb,category_id);

		return "redirect:/frank/showgroup?gid=" + id;
	}



	
	// -----------------------修改商品的表單-------------------
	@RequestMapping(value = "/frank/updatetogroup_item", method = RequestMethod.GET)
	public String updatetogroup_item(@RequestParam("gid") Integer gid, @RequestParam("iid") Integer iid, Model model,
			GroupsBean gb) {
		Groups_ItemBean gib = new Groups_ItemBean();

		model.addAttribute("upgroupsitemBean", gib);
		model.addAttribute("updategitem", service.getGroup_ItemById(iid));

		return "frank/updategroup_item";

	}

	// ---------------------修改商品的資料-----------------
	@RequestMapping(value = "/frank/updatetogroup_item", method = RequestMethod.POST)
	public String updatetogroup_item(@RequestParam("gid") Integer gid, @RequestParam("name") String name,
			@RequestParam("detail") String detail, @RequestParam("price") Integer price,
			@RequestParam("iid") Integer iid,@ModelAttribute("upgroupsitemBean") Groups_ItemBean ib) {

			System.out.println("hellllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllo");
//		if (ib.getProductImage() != null) {
			if (ib.getProductImage() != null) {
				MultipartFile productImage = ib.getProductImage();
				String originalFilename = productImage.getOriginalFilename();
			

				if (productImage != null && !productImage.isEmpty()) {
					String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
					String rootDirectory = context.getRealPath("/");
					byte[] b;
					try {
						b = productImage.getBytes();
						Blob blob = new SerialBlob(b);
						ib.setImage(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
					}
				}
			}
			ib.setId(iid);
			service.updateitem(ib);

		return "redirect:/frank/showgroup?gid=" + gid ;
	}

	
	// -----------------------修改地址的表單-------------------
		@RequestMapping(value = "/frank/updatetoplace", method = RequestMethod.GET)
		public String updatetoplace(@RequestParam("gid") Integer gid, @RequestParam("pid") Integer pid, Model model,
				GroupsBean gb) {

			model.addAttribute("updateplace", service.getPlaceById(pid));

			return "frank/updateplace";

		}

		// ---------------------修改地址的資料-----------------
		@RequestMapping(value = "/frank/updatetoplace", method = RequestMethod.POST)
		public String updatetoplace(@RequestParam("gid") Integer gid, @RequestParam("address") String address,
				@RequestParam("time") String time, @RequestParam("pid") Integer pid) {

			PlaceBean pb = new PlaceBean();
			pb.setAddress(address);
			pb.setTime(time);
			pb.setId(pid);

			service.updateplace(pb);

			return "redirect:/frank/showgroup?gid=" + gid;
		}

	
	
	
	
	
	
	
	
	
	
	
	
	// ----------------------刪除商品---------------------------
	@RequestMapping(value = "/frank/deletetogroup_item")
	public String deletetogroup_item(@RequestParam("gid") Integer gid, @RequestParam("iid") Integer iid, Model model) {

//			service.deletegitemById(iid);
//			 String x = service.getGroup_ItemById(iid);
//			session.removeAttribute(x);
		service.deletegitemById(iid);

//			Session session = factory.getCurrentSession();		
//			session.delete(service.getGroup_ItemById(iid));

		return "redirect:/frank/showgroup?gid=" + gid;
	}

	// -----------------------刪除地址------------------------
	@RequestMapping(value = "/frank/deletetoplace")
	public String deletetoplace(@RequestParam("gid") Integer gid, @RequestParam("pid") Integer pid, Model model) {

//			service.deletegitemById(iid);
//			 String x = service.getGroup_ItemById(iid);
//			session.removeAttribute(x);
		service.deletetoplace(pid);

//			Session session = factory.getCurrentSession();		
//			session.delete(service.getGroup_ItemById(iid));

		return "redirect:/frank/showgroup?gid=" + gid;
	}

	// ------------------單獨修改一欄資料-------------
//	@RequestMapping("/frank/updatename") // 查詢單一產品
//	public void upda(HttpServletResponse rp, HttpServletRequest rq) {
//
//		String name = rq.getParameter("name");
//		Integer id = Integer.parseInt(rq.getParameter("id"));
//		System.out.println("name----------" + name);
//		System.out.println("id----------" + id);
//
//		service.updateName(name, id);
//		try {
//			PrintWriter out = rp.getWriter();
//			out.write(name);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
	@RequestMapping("/frank/Ngroup")
	public String Ngroup() {
		return "frank/Ngroup";
	}
}
