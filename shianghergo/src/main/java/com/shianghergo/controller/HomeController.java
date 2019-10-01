package com.shianghergo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shianghergo.model.CategoryBean;
import com.shianghergo.model.ItemBean;
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
		//model.addAttribute("title", "登入");
		return "register";
	}
	
	//------------------------- 以上聖捷

	@RequestMapping(value = { "/", "/index" })
	public String index(HttpServletRequest rq,Model model) {
		HttpSession httpSession = rq.getSession();
		
		if(temp == 1) {
			httpSession.setAttribute("header11", 1);
			temp++;
		}
		
		
		
		List<CategoryBean> list = groupsService.getCategoryList();
		httpSession.setAttribute("categoryList", list);
		List<ItemBean> list2 = service.getAllProducts();
		model.addAttribute("aaa",list2);
		
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
	
	
}
