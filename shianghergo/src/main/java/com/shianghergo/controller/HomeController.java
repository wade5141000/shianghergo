package com.shianghergo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shianghergo.model.CategoryBean;
import com.shianghergo.service.GroupsService;

@Controller
public class HomeController {
	
	@Autowired
	GroupsService groupsService;
	
	@RequestMapping("/goRegisterPage")
	public String goRegisterPage() {
		//model.addAttribute("title", "登入");
		return "register";
	}
	
	//------------------------- 以上聖捷

	@RequestMapping(value = { "/", "/index" })
	public String index(HttpServletRequest rq) {
		HttpSession httpSession = rq.getSession();
		
		List<CategoryBean> list = groupsService.getCategoryList();
		
		httpSession.setAttribute("categoryList", list);
		return "index";
	}
	
	@RequestMapping("oldindex")
	public String oldIndex() {
		return "wade/index";
	}
	
	// 前端測試
	@RequestMapping("/fortest")
	public String forTest() {
		return "wade/test";
	}
	
	
	@RequestMapping("/test")
	public String Test() {
		return "html/index";
	}
	@RequestMapping("/test1")
	public String Test1() {
		return "html/buytoday";
	}
	@RequestMapping("/test2")
	public String Test2() {
		return "html/commodity";
	}
	@RequestMapping("/test3")
	public String Test3() {
		return "html/details";
	}
	@RequestMapping("/test4")
	public String Test4() {
		return "html/group";
	}
	@RequestMapping("/test5")
	public String Test5() {
		return "html/information";
	}
	@RequestMapping("/test6")
	public String Test6() {
		return "html/login";
	}
//	@RequestMapping("/test7")
//	public String Test7() {
//		return "shopcart";
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
	
	
}
