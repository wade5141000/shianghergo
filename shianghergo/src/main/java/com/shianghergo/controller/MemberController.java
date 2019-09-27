package com.shianghergo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.shianghergo.model.ItemBean;
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
	public void validateAccount(@RequestParam("account") String account, HttpServletResponse response) {
		System.out.println(account);
//		boolean b = service.idExists(account);
//		if (b) {
//			return Msg.sucess();
//		}
//		return Msg.fail();
		if (service.idExists(account)) {
			try {
				response.getWriter().print(false);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
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
			HttpServletRequest request, Model model) {

		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位:" + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		System.out.println("有沒有阿~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		MultipartFile image = mb.getImage();
		String originalFilename = image.getOriginalFilename();
		System.out.println(originalFilename);
		mb.setFileName(originalFilename);
		String ext = ".jpg";
		String rootDirectory = context.getRealPath("/");

		if (image != null && !image.isEmpty()) {
			byte[] b;
			try {
				b = image.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setCoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}

		System.out.println(mb);
		service.saveMember(mb);

		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, mb.getId() + ext);
			image.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳生異常:" + e.getMessage());
		}

		return "Member001";

	}

	@RequestMapping(value = "/getmemberPicture/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletRequest resp, @PathVariable Integer id) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean bean = service.getMemberById(id);
		if (bean != null) {
			Blob blob = bean.getCoverImage();
			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType("/resources/images/NoImage.jpg");
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filePath) {
		byte[] b = null;
		String realPath = context.getRealPath(filePath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filePath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	
	
	
	
	
	
	
	// 跳转到添加页面
	@RequestMapping(value = "/addMember")
	public String saveMember() {

		return "savepage";
	}

	// 跳转到更新页面，回显数据,model 使用的Model保存回显数据
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
	public String updateMember(@ModelAttribute("loginOK") MemberBean mb) {
		
		if(mb.getImage()!=null) {
			System.out.println("有上傳");
		}else {
			System.out.println("nonono");
		}
		
		
//		System.out.println("updateMember()中" + mb.toString());
//		
		if (mb.getImage() != null) {
			MultipartFile image = mb.getImage();
			String originalFilename = image.getOriginalFilename();
			mb.setFileName(originalFilename);

			if (image != null && !image.isEmpty()) {
				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
				String rootDirectory = context.getRealPath("/");
				byte[] b;
				try {
					b = image.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setCoverImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			}
		}else {
			MemberBean mmb = service.queryMember(mb.getAccount());
			mb.setCoverImage(mmb.getCoverImage());
			mb.setFileName(mmb.getFileName());
		}
	
	
		
		
		
		
		
		service.updateMember(mb);
		// rq.getSession().setAttribute("id", mb.getAccount());
		return "redirect:/Member001";
	}

	/**
	 * 查询所有人员信息
	 * 
	 * @param 保存回显数据
	 * @return
	 */
	@RequestMapping(value = "/Member001")
	public String mian(Model model, @ModelAttribute("loginOK") MemberBean mb) {// ,HttpServletRequest rq
		model.addAttribute("loginOK", mb);
		// model.addAttribute("loginOK",service.queryMember(String.valueOf(rq.getSession().getAttribute("id"))));
		// System.out.println("mian()"+model);
		return "Member001";
	}

}
