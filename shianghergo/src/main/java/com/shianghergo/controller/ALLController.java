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

@Controller
@SessionAttributes(value = "id") // member_id 放在session域讓類中方法都能使用
public class ALLController {

	@Autowired
	GBDBService service;

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

//--後台功能 1.警告2. 停權3.停權取消4.違規處理(商家跟會員)//---------------------------------------

//----------------管理員處理檢舉的違規處理頁面---------------------------------------

	// 管理員處理商店違規
	@RequestMapping("leopard/processS")
	public String processS(Report_StoreBean rb, HttpServletRequest rq, Model model) {

		long id = Long.parseLong(rq.getParameter("id"));

		service.updateReport(rb, id);

		List<Report_StoreBean> list = service.getAllStoreBean();

		model.addAttribute("violation", list);

		return "leopard/adminVS";

	}

	// 管理員處理會員違規
	@RequestMapping("leopard/processM")
	public String processM(Report_MemberBean rb, Integer id, Model model) {

		service.updateReport(rb, id);

		List<Report_MemberBean> list = service.getAll();

		model.addAttribute("violation", list);

		return "leopard/adminVM";

	}

//----------------顯示資料畫面----------------------------------------------	

	// 違規商店資料
	@RequestMapping("leopard/showVS.do")
	public String Sviolation(Model model) {

		List<Report_StoreBean> list = service.getAllStoreBean();

		model.addAttribute("violation", list);

		return "leopard/adminVS";

	}

	// 違規會員資料
	@RequestMapping("leopard/showVM.do")
	public String Mviolation(Model model) {

		List<Report_MemberBean> list = service.getAll();

		model.addAttribute("violation", list);

		return "leopard/adminVM";

	}

	// 全部團購商品
	@RequestMapping("leopard/showGroups_item")
	public String getAllGroups_item(Model model) {

		List<Groups_ItemBean> list = service.getAllGroups_item();

		model.addAttribute("groups_item", list);

		return "leopard/adminGroupsItem";

	}

	// 全部商品
	@RequestMapping("leopard/showItem")
	public String getAllItem(Model model) {

		List<ItemBean> list = service.getAllItem();

		model.addAttribute("item", list);

		return "leopard/adminItem";

	}

	// 顯示全部會員
	@RequestMapping("leopard/member.do")
	public String getMember(String account, Model model) {

		List<Category_ReportBean> list = service.getCategoryReport();
		List<MemberBean> mem = service.getMember();

		model.addAttribute("list", list);
		model.addAttribute("Member", mem);

		return "leopard/adminMember";

	}

	// 顯示全部商店

	@RequestMapping("leopard/store.do")
	public String getStore(Model model) {
		List<Category_ReportBean> list = service.getCategoryReport();
		List<StoreBean> sto = service.getStore();

		model.addAttribute("list", list);
		model.addAttribute("Store", sto);

		return "leopard/adminStore";

	}

//----------------下架團購.商品功能------------------------------	

	// 下架商品
	@RequestMapping("leopard/deletel")
	public String deleteportPage(Integer id, Model model) {

		service.deleteItem(id);

		List<ItemBean> list = service.getAllItem();

		model.addAttribute("item", list);

		return "leopard/adminItem";

	}

	// 下架團購商品
	@RequestMapping("leopard/deletel1")
	public String deleteIPage(Integer id, Model model) {

		service.deleteGroups_item(id);

		List<Groups_ItemBean> list = service.getAllGroups_item();

		model.addAttribute("groups_item", list);

		return "leopard/adminGroupsItem";

	}

//-------------------會員違規通知(警告)--9/24改成NotificationBean--------

	// 會員.商店畫面的警告按鈕
	@RequestMapping("leopard/NotificationMember")
	public String NotificationMember(Integer target, NotificationBean notification, Model model) {

		service.caveatNotification(notification, target);
		List<Category_ReportBean> list = service.getCategoryReport();
		List<MemberBean> mem = service.getMember();

		model.addAttribute("list", list);
		model.addAttribute("Member", mem);

		return "leopard/adminMember";

	}

//-------------商店違規通知(警告) ---9/24 新增//	
	@RequestMapping("leopard/NotificationStore")
	public String NotificationStore(Integer target, NotificationBean notification, Model model) {

		service.caveatNotification(notification, target);

		List<StoreBean> sto = service.getStore();

		model.addAttribute("Store", sto);

		return "leopard/adminStore";
	}

//-------------------會員違規通知(停權)--9/24改成NotificationBean	----	

	// 會員畫面的停權按鈕
	@RequestMapping("leopard/stopMember")
	public String stopMember(Integer target, NotificationBean notification, Model model) {

		service.saveMemberIdToStop(target);
		service.stopNotification(notification, target);

		List<Category_ReportBean> list = service.getCategoryReport();
		List<MemberBean> mem = service.getMember();

		model.addAttribute("list", list);
		model.addAttribute("Member", mem);

		return "leopard/adminMember";
	}

//-------------------商店違規通知(停權)-9/24改成NotificationBean----

	// 商店畫面的停權按鈕
	@RequestMapping("leopard/stopStore")
	public String stopStore(Integer target, NotificationBean notification, Model model) {

		service.saveStoreIdToStop(target);
		service.stopNotification(notification, target);

		List<StoreBean> sto = service.getStore();

		model.addAttribute("Store", sto);

		return "leopard/adminStore";

	}

//---------------新增的功能 取消停權(會員)  9/24-------------------

	@RequestMapping("leopard/recoveryMember")
	public String recoveryMember(Integer target, Model model, NotificationBean notification) {

		service.recoveryMember(target);
		service.recoveryNotification(notification, target);
		List<MemberBean> mem = service.getMember();

		model.addAttribute("Member", mem);

		return "leopard/adminMember";

	}

//---------------新增的功能 取消停權(商店)9/24-------------------	

	@RequestMapping("leopard/recoveryStore")
	public String recoveryStore(Integer target, Model model, NotificationBean notification) {

		service.recoveryStore(target);
		service.recoveryNotification(notification, target);
		List<StoreBean> sto = service.getStore();

		model.addAttribute("Store", sto);

		return "leopard/adminStore";

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
