package com.shianghergo.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shianghergo.model.MemberBean;
import com.shianghergo.model.MessageBean;
import com.shianghergo.service.MemberService;


@Transactional
@Controller
@SessionAttributes("loginOK")
public class MessageController {
	
	@Autowired
	MemberService service;

	@Autowired
	ServletContext context;
	
	

	@RequestMapping("/Message")
	public String GoMessage() {
		return "Message";
	}
	
	@RequestMapping("/AllMember")
	public String getAllMemberList(Model model ) {
		List<MemberBean> list = service.getPerson();
		model.addAttribute("AllMemberList", list);
		System.out.println("getAllMemberList++:"+list);
		return "AllMember";
	}
	
	@RequestMapping(value="/sendMemberMessage")
	public String sendMemberMessage(@RequestParam(value = "target") Integer target,@ModelAttribute("loginOK")MemberBean mb, Model model) {
		System.out.println("target++:"+target);
		MessageBean Mesg = new MessageBean();
//		Mesg.setMember_id(mb.getId());
		model.addAttribute("MessageBean", Mesg);
		model.addAttribute("mm",service.getMemberById(mb.getId()));
		model.addAttribute("mmm",service.getMemberById(target));
		System.out.println("mmm+++:"+service.getMemberById(target));
//		System.out.println("mesg++:"+service.getMessageByMemberId(MesgB.getMember_id()));
		return "Message";
	}
	
	@RequestMapping("/saveMessage")
	public String saveMessage(@RequestParam(value = "member_id") Integer member_id,@RequestParam(value = "target") Integer target,Model model,MessageBean MesgB) {
		service.saveMessage(MesgB,member_id,target);
		return "redirect:/MyMessage";
	}
	
	@RequestMapping("/MyMessage")
	public String getMyMessage(MessageBean MesgB,Model model,@ModelAttribute("loginOK")MemberBean mb) {
		Integer mid = mb.getId();
		model.addAttribute("MyMessage", service.getMyMessage(mid));
//		System.out.println(":"+list);
		return "MyMessage";
	}

}
