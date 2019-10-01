//package com.shianghergo.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.shianghergo.model.ItemBean;
//import com.shianghergo.service.ProductService;
//
//@Controller
//public class aController {
//	@Autowired
//	ProductService service;
//	@RequestMapping("/index")
//	public String list(Model model,HttpSession session) {
//		List<ItemBean> list = service.getAllProducts();
//		session.setAttribute("products", list);
//		//model.addAttribute("products", list);
//		return "/index";
//	}
//
//}
