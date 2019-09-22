package com.shianghergo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shianghergo.model.Category_ReportBean;
import com.shianghergo.model.Groups_ItemBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.MessageBean;
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
	
	@RequestMapping("leopard/login")
	public String Login() {	
		
		return "leopard/adminLogin";
	}
	
//----------------登入時 取得登入會員的MemberID---------------------------------------------------------	
@RequestMapping("leopard/login.do")
	public String adminLogin(String account, Model model) {

    Integer id = service.loginMember(account);

	model.addAttribute("id", id);
	
	return "leopard/adminIn";

	}
//----------------檢舉資料存入------------------------------------------------------------------------------

	// 會員檢舉會員
	@RequestMapping("leopard/SaveRM")

	public String MreportM(Report_MemberBean rm, ModelMap m, Integer target, HttpServletRequest rq) {

		Integer sid = service.getStoreId(target);

		Integer cid = Integer.valueOf(rq.getParameter("category"));

		Integer id = Integer.valueOf(String.valueOf(m.get("id")));

		rm.setStore_id(sid);

		rm.setCategory_report_id(cid);

		rm.setMember_id(id);

		rm.setTarget(target);

		service.saveReport(rm);

		return "leopard/adminMember";
	}

	// 會員檢舉商店

	@RequestMapping("leopard/SaveRS")
	public String MreportS(Report_StoreBean rb, Category_ReportBean cb, ModelMap m, Integer target,
			HttpServletRequest rq) {

		Integer cid = Integer.valueOf(rq.getParameter("category"));

		Integer id = (Integer) m.get("id");

		rb.setCategory_report_id(cid);
		rb.setMember_id(id);
		rb.setStore_id(target);
		service.saveReport(rb);
		return "leopard/adminMember";

	}

//----------------管理員處理檢舉的違規處理頁面--------------------------------------------------------------

	// 管理員處理商店違規
	@RequestMapping("leopard/processS")
	public String processS(Report_StoreBean rb, HttpServletRequest rq) {
		long id = Long.parseLong(rq.getParameter("id"));

		System.out.println(id);
		service.updateReport(rb, id);

		return "leopard/adminIn";
	}

	// 管理員處理會員違規
	@RequestMapping("leopard/processM")
	public String processM(Report_MemberBean rb, Integer id, MessageBean msg) {

		System.out.println(id);

		service.updateReport(rb, id);

		return "leopard/adminIn";

	}

//----------------顯示資料畫面------------------------------------------------------------------------------	

	// 違規商店資料
	@RequestMapping("leopard/showVS.do")
	public String Sviolation(Model model) {

		List<Report_StoreBean> list = service.getAllStoreBean();

		model.addAttribute("violation", list);

		System.out.println("取得全部檢舉資料" + list.toString());

		return "leopard/adminVS";

	}

	// 違規會員資料
	@RequestMapping("leopard/showVM.do")
	public String Mviolation(Model model) {

		List<Report_MemberBean> list = service.getAll();

		model.addAttribute("violation", list);

		System.out.println("取得全部檢舉資料" + list.toString());

		return "leopard/adminVM";

	}

	// 全部團購商品
	@RequestMapping("leopard/showGroups_item")
	public String getAllGroups_item(Model model) {

		List<Groups_ItemBean> list = service.getAllGroups_item();

		model.addAttribute("groups_item", list);

		System.out.println("取得" + list.toString());

		return "leopard/adminGroupsItem";

	}

	// 全部商品
	@RequestMapping("leopard/showItem")
	public String getAllItem(Model model) {

		List<ItemBean> list = service.getAllItem();

		model.addAttribute("item", list);

		System.out.println("取得" + list.toString());

		return "leopard/adminItem";

	}

	// 顯示全部會員
	@RequestMapping("leopard/member.do")
	public String getMember(String account, Model model) {

		List<MemberBean> mem = service.getMember();

		model.addAttribute("Member", mem);

		return "leopard/adminMember";

	}

	// 顯示全部商店

	@RequestMapping("leopard/store.do")
	public String getStore(Model model) {

		List<StoreBean> sto = service.getStore();

		model.addAttribute("Store", sto);

		return "leopard/adminStore";

	}

//----------------下架團購.商品功能----------------------------------------------------------------------------------		

	// 下架商品
	@RequestMapping("leopard/deletel")
	public String deleteportPage(Integer id) {

		service.deleteItem(id);

		return "leopard/adminIn";

	}

	// 下架團購商品
	@RequestMapping("leopard/deletel1")
	public String deleteIPage(Integer id) {

		service.deleteGroups_item(id);

		return "leopard/adminIn";

	}

//---------------------------------------------------------------------------------------------------------------	

	// 會員畫面的檢舉按鈕
	@RequestMapping("leopard/reportMember")
	public String reportMember(Integer target, Model model) {

		List<Category_ReportBean> list = service.getCategoryReport();

		model.addAttribute("list", list);
		model.addAttribute("target", target);

		return "leopard/MreportM";

	}

	// 商店畫面的檢舉按鈕
	@RequestMapping("leopard/reportStore")
	public String reportStore(Integer target, Model model) {

		List<Category_ReportBean> list = service.getCategoryReport();

		model.addAttribute("list", list);
		model.addAttribute("target", target);

		return "leopard/MreportS";

	}

//-------------------會員跟商店違規通知(警告)------------------------

	// 會員.商店畫面的警告按鈕
	@RequestMapping("leopard/messageMember")
	public String messageMember(Integer target, MessageBean msg) {

		service.caveatMessageBean(msg, target);

		return "leopard/adminIn";
	}
//-------------------會員違規通知(停權)------------------------	

	// 會員畫面的停權按鈕
	@RequestMapping("leopard/stopMember")
	public String stopMember(Integer target, MessageBean msg) {

		service.saveMemberIdToStop(target);
		service.stopMessageBean(msg, target);

		return "leopard/adminIn";

	}

//-------------------商店違規通知(停權)------------------------

	// 商店畫面的停權按鈕
	@RequestMapping("leopard/stopStore")
	public String stopStore(Integer target, MessageBean msg) {

		service.saveStoreIdToStop(target);
		service.stopMessageBean(msg, target);

		return "leopard/adminIn";

	}

//----------------------評價功能(會員)--------------------------

	@RequestMapping("leopard/evaluationMember1")
	public String evaluationMember1(Model model, Integer target, ModelMap m) {

		String member_id = String.valueOf(m.get("id"));

		System.out.println("登入帳號ID:" + member_id + "評價會員:" +target);

		model.addAttribute("target", target);
		model.addAttribute("member_id",member_id);

		return "leopard/MevaluationM";

	}

	@RequestMapping("leopard/evaluationMember2")
	public String evaluationMember2(comment_member cm ,Integer member_id) {

		System.out.println("2" + member_id);
		
		service.savecomment_member(cm, member_id);

		return "leopard/adminIn";

	}

//----------------------評價功能(商家)--------------------------	
	
	@RequestMapping("leopard/evaluationStore1")
	public String evaluationStore1(Model model, Integer Store_id, ModelMap m) {

		String member_id = String.valueOf(m.get("id"));

		System.out.println("登入帳號ID:" + member_id + "評價商家:" + Store_id);

		model.addAttribute("Store_id",Store_id);
		model.addAttribute("member_id",member_id);

		return "leopard/MevaluationS";

	}

	@RequestMapping("leopard/evaluationStore2")
	public String evaluationStore2(comment_store cs ,Integer member_id) {

		System.out.println(cs);
		
		service.savecomment_store(cs, member_id);

		return "leopard/adminIn";

	}
	
//----------------------評價功能(商品)--------------------------		
	
	@RequestMapping("leopard/evaluationItem1")
	public String evaluationItem1(Model model, Integer item_id, ModelMap m) {

		String member_id = String.valueOf(m.get("id"));

		System.out.println("登入帳號ID:" + member_id + "評價商品:" + item_id);

		model.addAttribute("item_id",item_id);
		model.addAttribute("member_id",member_id);

		return "leopard/MevaluationI";

	}
	
	@RequestMapping("leopard/evaluationitem2")
	public String evaluationitem2(comment_item ci ,Integer member_id) {

		System.out.println(ci);
		
		service.savecomment_Item(ci, member_id);

		return "leopard/adminIn";

	}
	
	
	
	
	
}
