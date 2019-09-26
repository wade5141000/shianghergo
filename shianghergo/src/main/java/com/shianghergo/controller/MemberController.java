package com.shianghergo.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shianghergo.model.MemberBean;
import com.shianghergo.service.MemberService;


@Transactional
@Controller
@SessionAttributes("loginOK")
public class MemberController {
	@Autowired
	MemberService service;

	@Autowired
	ServletContext context;
	
	

	@RequestMapping("/MemberDL")
	public String MemberDL() {
		return "MemberDL";
	}
	
	@RequestMapping("/goMember001")
	public String aboutMe() {
		return "Member001";
	}
	
	@RequestMapping("/MemberIndex")
	public String MemberIndex() {
		return "MemberIndex";
	}
	
	

//	@RequestMapping(value = "/goRegisterPage", method = RequestMethod.GET)
//	@ResponseBody
//	public boolean isAccountExists(HttpServletResponse response,
//	        @RequestParam String account) throws IOException {
//		if(service.idExists(account)!=true) {
//			return true;	
//		}
//		return false;
//	}

	@RequestMapping(value = "/validateAccount")
	public void validateAccount(@RequestParam("account") String account,HttpServletResponse response) {
		System.out.println(account);
//		boolean b = service.idExists(account);
//		if (b) {
//			return Msg.sucess();
//		}
//		return Msg.fail();
		if(service.idExists(account)) {
			try {
				response.getWriter().print(false);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

//	@RequestMapping(value="/validateAccount", method=RequestMethod.POST)
//	@ResponseBody
//    public String validateName(@RequestParam String account,MemberBean mb){
//        if(account.equals(mb.getAccount())){
//            return "true";
//        }
//        return "false";
//    }
	
//	String result;
//	public String getResult() {
//	    return result;
//	}
	 

	@RequestMapping(value = "/goRegisterPage", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		MemberBean bb = new MemberBean();
		model.addAttribute("memberbean", bb);
		return "register";
	}

	@RequestMapping(value = "/goRegisterPage", method = RequestMethod.POST)
	public String AddNewMember(@ModelAttribute("memberbean") MemberBean mb, BindingResult result,
			HttpServletRequest request,Model model) {
//		Map<String, String> errorMsg = new HashMap<>();
//		request.setAttribute("error", errorMsg);
//		if (mb.getAccount() != null) {
//			errorMsg.put("id", "帳號已存在，請重新輸入帳號");
//		}
////		MultipartFile img = (MultipartFile) mb.getImage();
////		System.out.println(img);
////		System.out.println(mb);
////		String originalFilename = img.getOriginalFilename();//獲取圖片名稱
////		mb.setFileName(originalFilename);
////		if (img != null && !img.isEmpty()) {
////			try {
////				byte[] b = img.getBytes();
////				Blob blob = new SerialBlob(b);
////				mb.setCoverImage(blob);
////			} catch (Exception e) {
////				e.printStackTrace();
////				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
////			}
////		}
		System.out.println(mb);
		service.saveMember(mb);
////		try {
////			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
////			String rootDirectory = context.getRealPath("/");
////			File imageFolder = new File(rootDirectory, "image");
////			if (!imageFolder.exists())
////				imageFolder.mkdir();
////			File file2 = new File(imageFolder, mb.getId() + ext);
////			img.transferTo(file2);
////		} catch (Exception e) {
////			e.printStackTrace();
////			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
////		}
		return "Member001";

	}	
	//跳转到添加页面
    @RequestMapping(value = "/addMember")
    public String saveMember() {

        return "savepage";
    }
    
     //跳转到更新页面，回显数据,model 使用的Model保存回显数据
    @RequestMapping(value = "/doupdate")
    public String doupdate(@RequestParam(value = "account") String account, Model model) {
        model.addAttribute("Member", service.queryMember(account));
        System.out.println(account);
        System.out.println("doupdate已執行");
        return "member00";
    }

    /**
     * 更新数据
     * 
     * @param person
     * @return
     */
                           
    @RequestMapping("/updateMember")
    public String updateMember(@ModelAttribute("loginOK")MemberBean mb) {
        System.out.println("updateMember()中"+mb.toString());
        service.updateMember(mb);
        //rq.getSession().setAttribute("id", mb.getAccount());
        return "redirect:/Member001";
    }
    
    /**
     * 查询所有人员信息
     * 
     * @param 保存回显数据
     * @return
     */
    @RequestMapping(value = "/Member001")
    public String mian(Model model,@ModelAttribute("loginOK")MemberBean mb) {//,HttpServletRequest rq
    	model.addAttribute("loginOK",mb);
    	//model.addAttribute("loginOK",service.queryMember(String.valueOf(rq.getSession().getAttribute("id"))));
    	//System.out.println("mian()"+model);
        return "Member001";
    }


}
