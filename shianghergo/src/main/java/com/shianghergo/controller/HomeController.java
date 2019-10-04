package com.shianghergo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.NotificationBean;
import com.shianghergo.service.CartService;
import com.shianghergo.service.GroupsService;
import com.shianghergo.service.ProductService;

@Controller
@SessionAttributes("loginOK")
public class HomeController {

	private static int temp = 1;
	@Autowired
	GroupsService groupsService;

	@Autowired
	CartService cartService;

	@Autowired
	ProductService service;

	@RequestMapping("/goRegisterPage")
	public String goRegisterPage() {
		// model.addAttribute("title", "登入");
		return "register";
	}

	// ------------------------- 以上聖捷

	@RequestMapping(value = { "/", "/index" })
	public String index(HttpServletRequest rq, Model model) {
		HttpSession httpSession = rq.getSession();

		if (temp == 1) {
			httpSession.setAttribute("header11", 1);
			temp++;
		}

		List<CategoryBean> list = groupsService.getCategoryList();
		httpSession.setAttribute("categoryList", list);
		List<ItemBean> list2 = service.getAllProducts();
		model.addAttribute("aaa", list2);

		List<CategoryBean> list3 = groupsService.getCategoryList();
		httpSession.setAttribute("categoryList", list3);
		List<GroupsBean> list4 = groupsService.getAllGroups();
		model.addAttribute("bbb", list4);

		return "index";
	}

	@RequestMapping("oldindex")
	public String oldIndex() {
		return "wade/index";
	}

	// 前端測試
	@RequestMapping("/testhead")
	public String TestHead() {
		return "eric/header";
	}

	@RequestMapping("/testfoot")
	public String TestFoot() {
		return "eric/foot";
	}

	@RequestMapping("/testgok")
	public String Testgok() {
		return "wade/hotsell";
	}

//	@RequestMapping("/showNotification")
//	public String showNotification(@SessionAttribute("loginOK") MemberBean member,HttpServletRequest rq) {
//		List<NotificationBean> list = cartService.getNotification(member.getId());
//		HttpSession session = rq.getSession();
//		session.setAttribute("notification", list);
//		
//		
//		return "";
//	}

	// 前端測試尾端

//  顯示 index 的圖片
//	@RequestMapping("showimg")
//	public void showimg(OutputStream op, HttpServletRequest rq, HttpServletResponse rp) {
//		String path = "/WEB-INF/views/res/static/img/hot3.png";
//		rp.setContentType("image");
//		
//		try (InputStream is = rq.getServletContext().getResourceAsStream(path);){
//			byte[] b = new byte[1024];
//			int len;
//			while ((len = is.read(b)) != -1) {
//				op.write(b,0,len);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}

	// wade 測試圖片上傳 -1
	@RequestMapping("testimg1")
	public String imaage1() {

		return "NewFile";
	}

	// wade 測試圖片上傳 -2
	@RequestMapping("testimg")
	public String imaage(@RequestParam("idPic") MultipartFile img, HttpServletRequest request) {
		if (img.isEmpty()) {
			System.out.println("沒東西");
		} else {
			System.out.println("有東西");
			System.out.println("getOriginalFilename:" + img.getOriginalFilename());

			// idPic
//			System.out.println("getName:" + img.getName());

			// shianghergo\
//			System.out.println("getRealPath(/): " + request.getSession().getServletContext().getRealPath("/"));
			
//			HttpHeaders headers = new HttpHeaders();
//			headers.setContentType(MediaType.IMAGE_JPEG);

			GroupsBean gb = groupsService.getGroupById(17001);
			
			String shianghergo = request.getSession().getServletContext().getRealPath("/");
			shianghergo += "images/groupsImg/" + gb.getId() +".jpg";
			
			File tempF = new File(shianghergo);

			try {
				if (!tempF.exists()) {
					tempF.createNewFile();
					img.transferTo(tempF);
				} else {
					img.transferTo(tempF);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
//			try {
//				byte[] temp = img.getBytes();
//				InputStream a = img.getInputStream();
//				a.read();
//				FileOutputStream out = new FileOutputStream();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			

//			File saveFile = new File("C:\\Users\\User\\Desktop\\存到這先\\temp.jpg");
//			try {
//				img.transferTo(saveFile);
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}

		}

		return "NewFile";
	}

	// wade 測試圖片顯示 -3
	@RequestMapping("testimg3")
	public void imaage3(HttpServletResponse rp) {
		
		
		
		File tempF = new File("C:\\Users\\User\\Desktop\\存到這先\\groupsImg\\"+ 17001 + ".jpg");
		try {
			int n = 0;
			byte[] bb = new byte[1024];
			
			
			FileInputStream in = new FileInputStream(tempF);		
			ServletOutputStream out = rp.getOutputStream();
			
			while ((n = in.read(bb)) != -1) {
                out.write(bb, 0, n);
            }

            out.close();
            in.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
