package com.shianghergo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shianghergo.model.SearchBean;
import com.shianghergo.service.SearchService;


@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
		
//接收資料
	@RequestMapping("/Search.controller")
	public String method(String title, String filter, Model model,HttpSession session) {
		System.out.println("資料有進來：" + title);
		System.out.println("資料有進來："+ filter);
//呼叫model
		List<SearchBean> Searchlist = searchService.findSearchByName(title);
//		System.out.println("後端Searchlist="+Searchlist);
		
		session.setAttribute("searchList", Searchlist);
		
		List<SearchBean> Searchlist1 =(List<SearchBean>) session.getAttribute("searchList");

		System.out.println("session 裡有"+Searchlist1);
//呼叫view
			return "eric/information";
	}
	@RequestMapping("/eric/a")
	public String methoda() {
		return "/eric/a";
	}
	@RequestMapping("/eric/b")
		public String methodb() {
			return "/eric/b";
	}
	@RequestMapping("/eric/c")
	public String methodc() {
		return "/eric/c";
}
}
