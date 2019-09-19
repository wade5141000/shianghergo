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
import org.springframework.web.bind.annotation.RequestParam;

import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.GroupsOrderDetailBean;
import com.shianghergo.model.Groups_ItemBean;
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
		rq.getSession(true).setAttribute("member_id", 10004);
		List<GroupsBean> list = groupsService.getAllGroups();
		model.addAttribute("groups",list);
		
		return "groups";
	}
	
	@RequestMapping("group/{id}")
	public String showGroupitems(@PathVariable("id") Integer group_id,Model model,HttpServletRequest rq) {
		Set<Groups_ItemBean> set = groupsService.getGroupItemsById(group_id);
		Iterator<Groups_ItemBean> it = set.iterator();
		model.addAttribute("set",it);
		
		return "groupitems";
	}
	
	@RequestMapping("groupcart")
	public String groupCart(Model model,HttpServletRequest rq) {
		Integer mId = Integer.valueOf(String.valueOf(rq.getSession().getAttribute("member_id")));
		List<GroupsCartBean> list = groupsCartService.getGroupsCartItems(mId);
		model.addAttribute("cartitems",list);
		return "groupscart";
	}
	
	@RequestMapping("addgrouporder")
	public String addGroupOrder(@RequestParam("gid") Integer gId,Model model,HttpServletRequest rq) {
		Integer mId = Integer.valueOf(String.valueOf(rq.getSession().getAttribute("member_id")));
		// 先直接給資料 資料應該從購物車來
		int oId = groupsOrderService.addOrder(mId,gId,19001);
		Set<GroupsOrderDetailBean> list = groupsOrderDetailService.getOrderDetailById(oId);
		Iterator<GroupsOrderDetailBean> it = list.iterator();
		model.addAttribute("list",it);
		return "temp";
	}
	
	@RequestMapping("group/addtocart")
	public void addToCart(@RequestParam("id") Long id,@RequestParam("gid") Long gId,HttpServletRequest rq,HttpServletResponse rp) {
		Integer mId = Integer.parseInt(String.valueOf(rq.getSession().getAttribute("member_id")));
		Groups_ItemBean ib = groupsItemService.getGroupsItemById(Integer.parseInt(String.valueOf(id)));
		int x = groupsCartService.addToCart(mId,ib);
		try {
			rp.getWriter().write(String.valueOf(x));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
