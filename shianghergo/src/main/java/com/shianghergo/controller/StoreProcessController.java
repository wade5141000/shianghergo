package com.shianghergo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shianghergo.model.CartBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.OrderBean;
import com.shianghergo.model.OrderDetailBean;
import com.shianghergo.service.CartService;
import com.shianghergo.service.ItemService;
import com.shianghergo.service.OrderDetailService;
import com.shianghergo.service.OrderService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
public class StoreProcessController {
	
	@Autowired
	ItemService itemService;
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	
	@RequestMapping("showitem")
	public String list(Model model,HttpServletRequest re) {
		List<ItemBean> list = itemService.getAllItems();
		model.addAttribute("items", list);
		re.getSession(true).setAttribute("member_id", 10004);
		return "items";
	}
	
	@RequestMapping("gocart")
	public void gocart(@RequestParam("id") Integer id,HttpServletResponse rp,HttpServletRequest re) {
		
		ItemBean ib = itemService.getItemById(id);
		cartService.saveToCart(ib,(int)(re.getSession().getAttribute("member_id")));
		try {
			rp.getWriter().write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updatecart")
	public void updatecart(HttpServletResponse rp,HttpServletRequest re) {
		int mId = (int)(re.getSession().getAttribute("member_id"));
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
		int mId = (int)(re.getSession().getAttribute("member_id"));
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
		int id = Integer.parseInt((re.getParameter("id")));
		String type = re.getParameter("type");
		CartBean cb = cartService.updateCartBeanById(id, type);
		int newAmount = cb.getAmount();
		if(type.equals("1")) {
			total += cb.getPrice();
		}else if(type.equals("2")) {
			total -= cb.getPrice();
		}
		int totala =cb.getPrice()*newAmount;
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
		int id = Integer.parseInt((re.getParameter("id")));
		int reduce = cartService.deleteCartBeanById(id);
		try {
			rp.getWriter().write(String.valueOf(reduce));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("order/{orderid}")
	public String order(@PathVariable("orderid") Integer order_id,Model model,HttpServletRequest re,HttpServletResponse rp) {
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		int rdn = (int) (Math.random() * 100000);
		String orderNumber = "TradeNumber" + rdn;
		// 訂單編號
		obj.setMerchantTradeNo(orderNumber);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tradetime = df.format(new Date());
		// 訂單時間
		obj.setMerchantTradeDate(tradetime);
		
//		long mId = (long)(re.getSession().getAttribute("member_id"));
//		List<CartBean> list = cartService.getCartItems(mId);
		List<OrderDetailBean> list = orderDetailService.getOrderDetail(order_id);
		int price = 0;
		String itemName = "";
		for(int i=0;i<list.size();i++) {
			OrderDetailBean ob = list.get(i);
			price += (ob.getAmount()*ob.getPrice());
			if(i==0) {
				itemName += ob.getName();
			}else {
				itemName += "#" + ob.getName();
			}
		}
		obj.setTotalAmount(String.valueOf(price));
		obj.setItemName(itemName);
		obj.setTradeDesc("test Description");
		obj.setReturnURL("http:/localhost:8080/shianghergo");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("N");
		//  (返回商店按鈕 無付款結果)
		obj.setClientBackURL("http:/localhost:8080/shianghergo/orderlist");
		// 直接重新導向 (有付款結果)
		// obj.setOrderResultURL("http:/localhost:8080/mvcExercise/ECPayResult.do");
		String form = all.aioCheckOut(obj, null);
		model.addAttribute("form",form);
		orderService.updateStatus(order_id);
		return "ECPayForm";
	}
	
	@RequestMapping("orderlist")
	public String orderList(Model model,HttpServletRequest re) {
		int mId = (int)(re.getSession().getAttribute("member_id"));
		List<OrderBean> list = orderService.getOrderBeanByMemeber(mId);
		model.addAttribute("orders",list);
		return "myorderlist";
	}
	
	@RequestMapping("orderdetail/{id}")
	public String orderDetail(@PathVariable("id") Integer id,Model model,HttpServletRequest re) {
		List<OrderDetailBean> list = orderDetailService.getOrderDetail(id);
		model.addAttribute("details",list);
		model.addAttribute("order_id",id);
		return "detail";
	}
	
	@RequestMapping("addorder")
	public String addOrder(Model model,HttpServletRequest re) {
		
		int mId = (int)re.getSession().getAttribute("member_id");
		int order_id = orderService.addOrder(mId);
		List<OrderDetailBean> list = orderDetailService.getOrderDetail(order_id);
		model.addAttribute("details",list);
		model.addAttribute("order_id",order_id);
		return "detail";
	}
	
	
	
}
