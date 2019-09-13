package com.shianghergo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shianghergo.model.CartBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.service.CartService;
import com.shianghergo.service.ItemService;

@Controller
public class StoreProcessController {
	
	@Autowired
	ItemService itemService;
	@Autowired
	CartService cartService;
	
	@RequestMapping("showitem")
	public String list(Model model,HttpServletRequest re) {
		List<ItemBean> list = itemService.getAllItems();
		model.addAttribute("items", list);
		re.getSession(true).setAttribute("member_id", 10004l);
		return "items";
	}
	
	@RequestMapping("gocart")
	public void gocart(@RequestParam("id") Long id,HttpServletResponse rp,HttpServletRequest re) {
		
		ItemBean ib = itemService.getItemById(id);
		cartService.saveToCart(ib,(long)(re.getSession().getAttribute("member_id")));
		try {
			rp.getWriter().write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updatecart")
	public void updatecart(HttpServletResponse rp,HttpServletRequest re) {
		long mId = (long)(re.getSession().getAttribute("member_id"));
		List<CartBean> list = cartService.getCartItems(mId);
		ObjectMapper mapper = new ObjectMapper();
		String result = "";
		
		try {
			result = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(list);
			rp.getWriter().write(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("cart")
	public String cart(Model model,HttpServletRequest re) {
		long mId = (long)(re.getSession().getAttribute("member_id"));
		List<CartBean> list = cartService.getCartItems(mId);
		model.addAttribute("cartitems",list);
		long total = 0;
		for(CartBean cb:list) {
			total += cb.getPrice()*cb.getAmount();
		}
		model.addAttribute("total",total);
		return "cart";
	}
	
	@RequestMapping("changeAmount")
	public void changeAmount(HttpServletResponse rp,HttpServletRequest re) {
		// long mId = (long)(re.getSession().getAttribute("member_id"));
		// 拿到一個物品
		int total = Integer.parseInt(re.getParameter("total"));
		long id = Long.parseLong(re.getParameter("id"));
		String type = re.getParameter("type");
		CartBean cb = cartService.updateCartBeanById(id, type);
		int newAmount = cb.getAmount();
		if(type.equals("1")) {
			total += cb.getPrice();
		}else if(type.equals("2")) {
			total -= cb.getPrice();
		}
		long totala =cb.getPrice()*newAmount;
		String result = total+","+newAmount+","+id+","+totala;
		System.out.println(result);
		try {
			rp.getWriter().write(result);
		}  catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("delete")
	public void delete(HttpServletRequest re,HttpServletResponse rp) {
		long id = Long.parseLong(re.getParameter("id"));
		int reduce = cartService.deleteCartBeanById(id);
		try {
			rp.getWriter().write(String.valueOf(reduce));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
