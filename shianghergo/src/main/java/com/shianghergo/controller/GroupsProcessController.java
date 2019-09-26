package com.shianghergo.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.service.GroupsCartService;
import com.shianghergo.service.GroupsItemService;
import com.shianghergo.service.GroupsOrderDetailService;
import com.shianghergo.service.GroupsOrderService;
import com.shianghergo.service.GroupsService;

@Controller
public class GroupsProcessController {
	
	@Autowired
	GroupsService groupsService;
	@Autowired
	GroupsCartService groupsCartService;
	@Autowired
	GroupsOrderService groupsOrderService;
	@Autowired
	GroupsItemService groupsItemService;
	@Autowired
	GroupsOrderDetailService groupsOrderDetailService;
	
	@RequestMapping("showgroups")
	public String showGroups(Model model,HttpServletRequest rq) {
		rq.getSession(true).setAttribute("member_id", 10001);
		List<GroupsBean> list = groupsService.getAllGroups();
		model.addAttribute("groups",list);
		
		return "wade/groups";
	}
	
	@RequestMapping("group/{id}")
	public String showGroupitems(@PathVariable("id") Integer group_id,Model model,HttpServletRequest rq) {
		Set<Groups_ItemBean> set = groupsService.getGroupItemsById(group_id);
		Iterator<Groups_ItemBean> it = set.iterator();
		model.addAttribute("set",it);
		
		return "wade/groupitems";
	}
	
	@RequestMapping("groupcart")
	public String groupCart(Model model,HttpServletRequest rq) {
		Integer mId = Integer.valueOf(String.valueOf(rq.getSession().getAttribute("member_id")));
		List<GroupsCartBean> list = groupsCartService.getGroupsCartItems(mId);
		model.addAttribute("cartitems",list);
		int total =0;
		for(GroupsCartBean gb : list) {
			total += gb.getAmount()*gb.getPrice();
		}
		model.addAttribute("total",total);
		return "wade/groupscart";
	}
	
	@RequestMapping("addgrouporder")
	public String addGroupOrder(@RequestParam("gid") Integer gId,Model model,HttpServletRequest rq) {
		
		// 先直接給資料 資料應該從購物車來
		Integer mId = 10001;
		int oId = groupsOrderService.addOrder(mId,gId);
//		Set<GroupsOrderDetailBean> list = groupsOrderDetailService.getOrderDetailById(oId);
//		Iterator<GroupsOrderDetailBean> it = list.iterator();
		GroupsOrderBean ob = groupsOrderService.getGroupsOrderById(oId);
		model.addAttribute("order",ob);
		GroupsBean gb = groupsService.getGroupById(gId);
		Iterator<PlaceBean> it = gb.getPlace().iterator();
		model.addAttribute("places",it);
		model.addAttribute("payment",gb.getPayment());
		return "wade/orderform";
	}
	
	@RequestMapping("group/addtocart")
	public void addToCart(@RequestParam("id") Integer id,@RequestParam("gid") Integer gId,HttpServletRequest rq,HttpServletResponse rp) {
		Integer mId = Integer.parseInt(String.valueOf(rq.getSession().getAttribute("member_id")));
		Groups_ItemBean ib = groupsItemService.getGroupsItemById(id);
		int x = groupsCartService.addToCart(mId,ib);
		try {
			rp.getWriter().write(String.valueOf(x));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="orderform",method = RequestMethod.POST)
	public String orderForm(Model model,@RequestParam Integer oId,
			@RequestParam String name,@RequestParam String phone,
			@RequestParam String pay,@RequestParam("place") Integer place_id) {
		
		GroupsOrderBean ob = groupsOrderService.addOrderForm(oId, name, phone, pay, place_id);
		model.addAttribute("order",ob);
		return "wade/gOK";
	}
	
	@RequestMapping("deletegroups")
	public void delete(HttpServletRequest re,HttpServletResponse rp) {
		int id = Integer.parseInt((re.getParameter("id")));
		int reduce = groupsCartService.deleteCartBeanById(id);
		try {
			rp.getWriter().write(String.valueOf(reduce));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("changeGroupsAmount")
	public void changeAmount(HttpServletResponse rp,HttpServletRequest re) {
		// long mId = (long)(re.getSession().getAttribute("member_id"));
		// 拿到一個物品
		int total = Integer.parseInt(re.getParameter("total"));
		int id = Integer.parseInt((re.getParameter("id")));
		String type = re.getParameter("type");
		GroupsCartBean cb = groupsCartService.updateCartBeanById(id, type);
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
}
