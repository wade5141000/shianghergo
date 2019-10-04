package com.shianghergo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shianghergo.model.Category_ReportBean;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.NotificationBean;
import com.shianghergo.model.Report_MemberBean;
import com.shianghergo.model.Report_StoreBean;
import com.shianghergo.model.StoreBean;
import com.shianghergo.model.comment_item;
import com.shianghergo.model.comment_member;
import com.shianghergo.model.comment_store;
import com.shianghergo.service.GBDBService;
import com.shianghergo.service.GroupsService;

@Controller
@SessionAttributes(value = "id") // member_id 放在session域讓類中方法都能使用
public class ALLController {

	@Autowired
	GBDBService service;

	@Autowired
	GroupsService gservice;

//------------登入------------------------------------	

	// 轉管理員登入頁面
	@RequestMapping("leopard/login")
	public String Login() {

		return "leopard/adminLogin";
	}

	// 測試會員
	@RequestMapping("leopard/testlogin")
	public String testLogin() {

		return "leopard/testLogin";
	}

//----------------登入時會員取得會員的MemberID--------------
	@RequestMapping("leopard/testlogin.do")
	public String testLogin(String account, Model model) {

		Integer id = service.loginMember(account);

		model.addAttribute("id", id);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<MemberBean> mem = service.getMember();

		model.addAttribute("list", list);
		model.addAttribute("Member", mem);

		return "leopard/adminMember";

	}

// 管理員登入 //
	@RequestMapping("leopard/login.do")
	public String adminLogin(String account, String password, Model model) {

		if (account.equals("admin") && password.equals("1009")) {

			List<Category_ReportBean> list = service.getCategoryReport();
			List<MemberBean> mem = service.getMember();

			model.addAttribute("list", list);
			model.addAttribute("Member", mem);

			return "leopard/adminMember";

		} else {

			return "leopard/adminLogin";

		}

	}

	// 後台---------------------------------------------會員-----------------------------------------------------

	// ---------------顯示全部會員---------------//

	@RequestMapping("leopard/member.do")
	public String getMember(Model model) {

		List<MemberBean> mem = service.getMember();

		model.addAttribute("Member", mem);

		return "leopard/adminMember";

	}

	// ---------------依照status查詢會員---------------//
	@RequestMapping("leopard/memberStatus")
	public String MemberOK(Model model, Integer status) {

		List<MemberBean> mem = service.getMemberUSEStatus(status);

		model.addAttribute("Member", mem);

		return "leopard/adminMember";

	}

	// ---------------警告---------------//

	// 會員警告
	@RequestMapping("leopard/NotificationMember")
	public void NotificationMember(Integer target, NotificationBean notification) {

		service.caveatNotification(notification, target);

	}

	// ---------------停權---------------//

	// 會員停權
	@RequestMapping("leopard/stopMember")
	public void stopMember(Integer target, NotificationBean notification) {

		service.saveMemberIdToStop(target);
		service.stopNotification(notification, target);

	}

	// ---------------恢復權限---------------//

	// 會員恢復權限
	@RequestMapping("leopard/recoveryMember")
	public void recoveryMember(Integer target, NotificationBean notification) {

		service.recoveryMember(target);
		service.recoveryNotification(notification, target);

	}

	// 後台---------------------------------------------商家-----------------------------------------------------

	// ---------------顯示全部商家---------------//

	@RequestMapping("leopard/store.do")
	public String getStore(Model model) {

		List<StoreBean> sto = service.getStore();

		model.addAttribute("Store", sto);

		return "leopard/adminStore";

	}

	// ---------------依照status查詢會員---------------//

	@RequestMapping("leopard/storeStatus")
	public String StoreOK(Model model, Integer status) {

		if (status == 1) {

			List<StoreBean> sto = service.getStoreUSEStatus(status);

			model.addAttribute("Store", sto);

			return "leopard/adminStore";

		} else

		{

			List<StoreBean> sto = service.getStoreUSEStatus(status);

			model.addAttribute("Store", sto);

			return "leopard/adminStore";
		}

	}

	// ---------------警告---------------//

	// 商家警告
	@RequestMapping("leopard/NotificationStore")
	public void NotificationStop(Integer target, NotificationBean notification) {

		service.caveatNotification(notification, target);

	}

	// ---------------停權---------------//

	// 商家停權
	@RequestMapping("leopard/stopStore")
	public String stopStore(Integer targetS, Integer target, NotificationBean notification, Model model) {

		service.saveStoreIdToStop(targetS);
		service.stopNotification(notification, target);

		List<StoreBean> sto = service.getStore();
		model.addAttribute("Store", sto);

		return "leopard/adminStore";

	}

	// ---------------恢復權限---------------//

	// 商家恢復權限
	@RequestMapping("leopard/recoveryStore")
	public String recoveryStore(Integer targetS, Integer target, NotificationBean notification, Model model) {

		service.recoveryStore(targetS);
		service.recoveryNotification(notification, target);
		List<StoreBean> sto = service.getStore();
		model.addAttribute("Store", sto);

		return "leopard/adminStore";

	}

	// 後台---------------------------------------------商品-----------------------------------------------------

	// ---------------顯示所有商品---------------//
	@RequestMapping("leopard/showItem")
	public String getAllItem(Model model) {

		List<ItemBean> item = service.getAllItem();
		List<StoreBean> store = service.getStore();

		model.addAttribute("store", store);
		model.addAttribute("item", item);

		return "leopard/adminItem";

	}

	@RequestMapping("leopard/storeIdItem")
	public String storeIdItem(Integer store_id, Model model) {

		List<StoreBean> store = service.getStore();
		List<ItemBean> item = service.getItemByStoreId(store_id);

		model.addAttribute("store", store);
		model.addAttribute("item", item);

		return "leopard/adminItem";

	}

	// ---------------下架商品---------------//
	@RequestMapping("leopard/deleteItem")
	public void deleteItem(Integer id) {

		service.deleteItem(id);

	}

	// 後台---------------------------------------------團購商品-----------------------------------------------------

	// ---------------顯示所有團購商品---------------//
	@RequestMapping("leopard/showGroups_item")
	public String getAllGroups_item(Model model) {

		List<Groups_ItemBean> list = service.getAllGroups_item();
		List<GroupsBean> group = gservice.getAllGroups();

		model.addAttribute("group", group);
		model.addAttribute("groups_item", list);

		return "leopard/adminGroupsItem";

	}

	@RequestMapping("leopard/groupIdItem")
	public String groupIdItem(Integer groups_id, Model model) {

		List<GroupsBean> group = gservice.getAllGroups();
		List<Groups_ItemBean> list = service.getGroupsItemByGroupsId(groups_id);


		model.addAttribute("group", group);
		model.addAttribute("groups_item", list);

		return "leopard/adminGroupsItem";

	}

	// ---------------下架團購商品---------------//
	@RequestMapping("leopard/deletel1")
	public void deleteIPage(Integer id) {

		service.deleteGroups_item(id);

	}

// 後台---------------------------------------------違規處理會員-----------------------------------------------------	

	// ---------------顯示所有違規會員---------------//

	@RequestMapping("leopard/showVM.do")
	public String Mviolation(Model model) {

		List<Report_MemberBean> list = service.getProcess(1);

		model.addAttribute("violation", list);

		return "leopard/adminVM";

	}

	// ---------------依照status查詢違規會員資料---------------//
	@RequestMapping("leopard/reportStatusM")
	public String MviolationOK(Model model, Integer status) {

		if (status == 1) {

			List<Report_MemberBean> list = service.getProcess(status);

			model.addAttribute("violation", list);

			return "leopard/adminVM";

		} else {

			List<Report_MemberBean> list = service.getProcess(status);

			model.addAttribute("violation", list);

			return "leopard/adminVM";

		}

	}

	// ---------------處理違規會員---------------//
	@RequestMapping("leopard/processM")
	public String processM(Report_MemberBean rb, Integer id, Model model) {

		service.updateReport(rb, id);

		List<Report_MemberBean> list = service.getProcess(1);

		model.addAttribute("violation", list);

		return "leopard/adminVM";

	}

	// 後台---------------------------------------------違規處理商家-----------------------------------------------------

	// ---------------顯示所有違規商家---------------//

	@RequestMapping("leopard/showVS.do")
	public String Sviolation(Model model) {

		List<Report_StoreBean> list = service.getProcessS(1);

		model.addAttribute("violation", list);

		return "leopard/adminVS";

	}

	// ---------------依照status查詢違規會員資料---------------//
	@RequestMapping("leopard/reportStatusS")

	public String SviolationOK(Model model, Integer status) {

		List<Report_StoreBean> list = service.getProcessS(status);

		model.addAttribute("violation", list);

		return "leopard/adminVS";

	}

	// 管理員處理商店違規
	@RequestMapping("leopard/processS")
	public String processS(Report_StoreBean rb, HttpServletRequest rq, Model model) {

		long id = Long.parseLong(rq.getParameter("id"));

		service.updateReport(rb, id);

		List<Report_StoreBean> list = service.getProcessS(1);

		model.addAttribute("violation", list);

		return "leopard/adminVS";

	}

//前台功能 -------------------會員檢舉跟評價-----------------------

	// 測試的顯示會員畫面
	@RequestMapping("leopard/reportAndevaMember")
	public String reportAndevaMember(Model model) {

		List<Category_ReportBean> list = service.getCategoryReport();
		List<MemberBean> mem = service.getMember();

		model.addAttribute("list", list);
		model.addAttribute("Member", mem);

		return "leopard/ReportevaluationMember";

	}

	// 會員檢舉會員
	@RequestMapping("leopard/SaveRM")

	public String MreportM(Report_MemberBean rm, Integer target, Model model) {

		Integer sid = service.getStoreId(target);

		rm.setStore_id(sid);

		service.saveReport(rm);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<MemberBean> mem = service.getMember();

		model.addAttribute("list", list);
		model.addAttribute("Member", mem);

		return "leopard/ReportevaluationMember";
	}

	// 會員評價會員
	@RequestMapping("leopard/evaluationMember")
	public String evaluationMember2(comment_member cm, ModelMap m, Model model) {

		service.savecomment_member(cm);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<MemberBean> mem = service.getMember();
		model.addAttribute("list", list);
		model.addAttribute("Member", mem);

		return "leopard/ReportevaluationMember";

	}

//------------------會員檢舉評價商家--------------------------	

	// 測試的顯示商店畫面
	@RequestMapping("leopard/reportAndevaStore")
	public String reportAndevaStore(Model model) {

		List<Category_ReportBean> list = service.getCategoryReport();
		List<StoreBean> sto = service.getStore();

		model.addAttribute("list", list);
		model.addAttribute("Store", sto);

		return "leopard/ReportevaluationStore";

	}

	// 會員檢舉商家

	@RequestMapping("leopard/SaveRS")
	public String MreportS(Report_StoreBean rb, Model model) {

		service.saveReport(rb);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<StoreBean> sto = service.getStore();

		model.addAttribute("list", list);
		model.addAttribute("Store", sto);

		return "leopard/ReportevaluationStore";

	}
	
	@RequestMapping("hao/SaveRS")
	public String haoMreportS(Report_StoreBean rb, Model model) {

		service.saveReport(rb);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<StoreBean> sto = service.getStore();
		model.addAttribute("list", list);
		model.addAttribute("Store", sto);

		return "hao/getStoreByProduct?id="+rb.getMember_id();
	}

	// 會員評價商家
	@RequestMapping("leopard/evaluationStore")
	public String evaluationStore2(comment_store cs, Model model) {

		service.savecomment_store(cs);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<StoreBean> sto = service.getStore();

		model.addAttribute("list", list);
		model.addAttribute("Store", sto);

		return "leopard/ReportevaluationStore";

	}
	
	@RequestMapping("/hao/evaluationStore")
	public String evaluationStore3(comment_store cs, Model model) {

		service.savecomment_store(cs);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<StoreBean> sto = service.getStore();

		model.addAttribute("list", list);
		model.addAttribute("Store", sto);

		return "getStoreByProduct?id=" + cs.getMember_id(); 

	}

//----------------------會員評價商品--------------------------		

	// 測試的顯示商品畫面
	@RequestMapping("leopard/reportAndevaItem")
	public String reportAndevaItem(Model model) {

		List<ItemBean> list = service.getAllItem();

		model.addAttribute("item", list);

		return "leopard/ReportevaluationItem";

	}

	@RequestMapping("leopard/evaluationitem")
	public String evaluationitem2(comment_item ci, Model model) {

		service.savecomment_Item(ci);

		List<ItemBean> list = service.getAllItem();

		model.addAttribute("item", list);
		return "leopard/ReportevaluationItem";

	}

}
