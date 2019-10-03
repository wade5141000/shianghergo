package com.shianghergo.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.shianghergo.model.CartBean;
import com.shianghergo.model.GroupsCartBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.NotificationBean;
import com.shianghergo.model.StoreBean;
import com.shianghergo.service.CartService;
import com.shianghergo.service.GroupsCartService;
import com.shianghergo.service.MemberService;


@Transactional
@Controller
@SessionAttributes(value= {"loginOK","store"})

public class LoginController {
	@Autowired
	MemberService service;

	@Autowired
	ServletContext context;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	GroupsCartService groupsCartService;

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String getLoginForm(Model model) {
//		MemberBean bb = new MemberBean();
//		model.addAttribute("memberbean", bb);
//		return "login";
//	}

	@RequestMapping(value = "/MemberDL", method = RequestMethod.GET)
	public String welcome(HttpServletRequest request) {
		// TODO 判断有无session，有直接到首页
		if (request.getSession().getAttribute("account") != null
				&& request.getSession().getAttribute("password") != null) {
			return "Member001";
		}

		return "loginNew";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin(HttpServletRequest request) {

		// TODO 判断有无session，有直接到首页
		
		Object mb = request.getSession().getAttribute("loginOK");
		
		if (mb != null) {
			return "Member001";
		}

		return "loginNew";
	}

//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> login(@RequestParam(required = true, value = "account") String account,
//			@RequestParam(required = true, value = "password") String password, HttpServletRequest request) {// @RequestParam前
//		ResultUtil result = new ResultUtil();
//
//		try {
//			if (null != account && account.equals("account") && null != password && password.equals("password")) {
//				// TODO 登陆成功,保存session
//
//				HttpSession session = request.getSession();
//
//				UserToken userToken = new UserToken("account", "password");
//
//				session.setAttribute("userToken", userToken);
//
//				// 设置超时无效
//				// session.setMaxInactiveInterval(20);
//
//			} else {
//				result.setSuccess(false);
//				result.setMsg("用户名或密码错误!");
//			}
//
//		} catch (Exception e) {
//			result.setSuccess(false);
//			result.setMsg("系统内部异常！");
//		}
//		return result.getResult();
//	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String account, String password, Model model,HttpServletRequest rq) {
		MemberBean mb = service.login(account, password);// 前

		StoreBean sb = service.getStoreBeanById(mb.getId());
		
		if(mb != null) {
			if(password.equals(mb.getPassword())) {
				if(mb.getStatus()==1) {
					// 向ModelMap视图中添加一个Session级别存储的属性
					model.addAttribute("loginOK", mb);

					// ===== wade購物車
					HttpSession httpSession = rq.getSession();
					List<CartBean> list2 = cartService.getCartItems(mb.getId());
					httpSession.setAttribute("cartitems", list2);
					long total = 0;
					for(CartBean cb:list2) {
						total += cb.getPrice()*cb.getAmount();
					}
					httpSession.setAttribute("total",total);
					httpSession.setAttribute("its",list2.size());
					// ===== wade購物車
					
					// wade 團購物車
					List<GroupsCartBean> list3 = groupsCartService.getGroupsCartItems(mb.getId());
					httpSession.setAttribute("gcartitems", list3);
					long gtotal = 0;
					for(GroupsCartBean cb:list3) {
						gtotal += cb.getPrice()*cb.getAmount();
					}
					httpSession.setAttribute("gtotal",gtotal);
					httpSession.setAttribute("gits",list3.size());
					// ===== wade團購物車
					
					
					// 判斷header是否登入 wade
					httpSession.setAttribute("header11", 2);
					
					// 顯示通知 wade
					List<NotificationBean> list = cartService.getNotification(mb.getId());
					httpSession.setAttribute("notification", list);
					
					
					return "Member001";
				}
				
				// status == 2
				return "wrongMember";
			}
			
		}
		if(sb !=null) {
			model.addAttribute("store",service.getStoreBeanById(mb.getId()));
		}
		// 帳號或密碼錯誤
		return "loginNew";
	
		
//		System.out.println("login()+++" + mb);
		
		
		
		
		
		
//
//		if (mb != null&& mb.getStatus()!=null) {
//			if (mb.getAccount().equals(account) && mb.getPassword().equals(password) ) {
//				if() {
//					return "Member001";
//				}else {
//					
//				}
//			}else {
//				return "debby/register";
//			}
//		}
//		if(mb.getAccount().equals(account) && mb.getPassword().equals(password)) {
//			return "MemberDL";
//		}
//		return "loginNew";

	}

	/**
	 * 查询所有人员信息
	 * 
	 * @param map 使用的是map保存回显数据
	 * @return
	 */
//    @RequestMapping(value = "/login")
//    public String MemberDL(Map<String, Object> map,String account, String password) {
//        map.put("loginOK", service.login(account, password));
//        /*遍历集合，查看查询到的数据
//         * List<Person> lists = personService.getPersons(); 
//         * Iterator<Person> it = lists.iterator(); 
//         * while(it.hasNext()){ 
//         *      Person p =it.next();
//         *      System.out.println(p.toString());
//         *  }
//         */
//        return "MemberDL";
//    }

	// 退出
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus sessionStatus,HttpServletRequest rq) throws Exception {
//		HttpSession session = request.getSession();
//		session.invalidate();
//		return "redirect:index";
		sessionStatus.setComplete();
		System.out.println("logout已執行");
		
		// wade
		rq.getSession().setAttribute("header11", 1);
		
		
		return "loginNew";
	}

}
