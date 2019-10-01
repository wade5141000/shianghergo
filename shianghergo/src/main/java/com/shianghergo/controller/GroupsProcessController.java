package com.shianghergo.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.GroupsOrderBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.service.GroupsCartService;
import com.shianghergo.service.GroupsItemService;
import com.shianghergo.service.GroupsOrderDetailService;
import com.shianghergo.service.GroupsOrderService;
import com.shianghergo.service.GroupsService;

@Controller
@SessionAttributes("loginOK")
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
	public String groupCart(@ModelAttribute("loginOK")MemberBean member,Model model,HttpServletRequest rq) {
		Integer mId = member.getId();
		List<GroupsCartBean> list = groupsCartService.getGroupsCartItems(mId);
		model.addAttribute("gcartitems",list);
		int total =0;
		for(GroupsCartBean gb : list) {
			total += gb.getAmount()*gb.getPrice();
		}
		model.addAttribute("gtotal",total);
		return "wade/groupscart";
	}
	
	@RequestMapping("addgrouporder")
	public String addGroupOrder(@ModelAttribute("loginOK")MemberBean member,@RequestParam("gid") Integer gId,Model model,HttpServletRequest rq) {
		
		// 先直接給資料 資料應該從購物車來
		Integer mId = member.getId();
		int oId = groupsOrderService.addOrder(mId,gId);
//		Set<GroupsOrderDetailBean> list = groupsOrderDetailService.getOrderDetailById(oId);
//		Iterator<GroupsOrderDetailBean> it = list.iterator();
		GroupsOrderBean ob = groupsOrderService.getGroupsOrderById(oId);
		model.addAttribute("order",ob);
		GroupsBean gb = groupsService.getGroupById(gId);
		Iterator<PlaceBean> it = gb.getPlace().iterator();
		model.addAttribute("places",it);
		model.addAttribute("payment",gb.getPayment());
		
		HttpSession httpSession = rq.getSession();
		List<GroupsCartBean> list3 = groupsCartService.getGroupsCartItems(mId);
		httpSession.setAttribute("gcartitems", list3);
		long gtotal = 0;
		for(GroupsCartBean cb:list3) {
			gtotal += cb.getPrice()*cb.getAmount();
		}
		httpSession.setAttribute("gtotal",gtotal);
		
		
		return "wade/orderform";
	}
	
	@RequestMapping("addtocart")
	public void addToCart(@ModelAttribute("loginOK")MemberBean member,@RequestParam("itemid") Integer item_id,@RequestParam("gid") Integer gId,HttpServletRequest rq,HttpServletResponse rp) {
		Integer mId = member.getId();
//		System.out.println(member.getId());
//		System.out.println(member.getName());
		Groups_ItemBean ib = groupsItemService.getGroupsItemById(item_id);
		int x = groupsCartService.addToCart(mId,ib);
		
		HttpSession httpSession = rq.getSession();
		List<GroupsCartBean> list3 = groupsCartService.getGroupsCartItems(mId);
		httpSession.setAttribute("gcartitems", list3);
		long gtotal = 0;
		for(GroupsCartBean cb:list3) {
			gtotal += cb.getPrice()*cb.getAmount();
		}
		httpSession.setAttribute("gtotal",gtotal);
		
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
		model.addAttribute("orderDetail",ob.getOrderDetail());
		
		return "wade/gOK";
	}
	
	@RequestMapping("deletegroups")
	public void delete(HttpServletRequest re,HttpServletResponse rp) {
		int id = Integer.parseInt((re.getParameter("id")));
		GroupsCartBean gcb = groupsCartService.getGroupsCartItemById(id);
		int mId = gcb.getMember_id();
		int reduce = groupsCartService.deleteCartBeanById(id);
		
		HttpSession httpSession = re.getSession();
		List<GroupsCartBean> list3 = groupsCartService.getGroupsCartItems(mId);
		httpSession.setAttribute("gcartitems", list3);
		long gtotal = 0;
		for(GroupsCartBean cb:list3) {
			gtotal += cb.getPrice()*cb.getAmount();
		}
		httpSession.setAttribute("gtotal",gtotal);
		
		
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
		int mId = cb.getMember_id();
		int newAmount = cb.getAmount();
		if(type.equals("1")) {
			total += cb.getPrice();
		}else if(type.equals("2")) {
			total -= cb.getPrice();
		}
		int totala =cb.getPrice()*newAmount;
		String result = total+","+newAmount+","+id+","+totala;
		System.out.println(result);
		
		
		HttpSession httpSession = re.getSession();
		List<GroupsCartBean> list3 = groupsCartService.getGroupsCartItems(mId);
		httpSession.setAttribute("gcartitems", list3);
		long gtotal = 0;
		for(GroupsCartBean gcb:list3) {
			gtotal += gcb.getPrice()*gcb.getAmount();
		}
		httpSession.setAttribute("gtotal",gtotal);
		
		
		try {
			rp.getWriter().write(result);
		}  catch (IOException e) {
			e.printStackTrace();
		}
	}
}
