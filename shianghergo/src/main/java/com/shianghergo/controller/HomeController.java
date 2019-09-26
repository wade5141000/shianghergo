package com.shianghergo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@Controller
public class HomeController {
	
	@RequestMapping("/goRegisterPage")
	public String goRegisterPage() {
		//model.addAttribute("title", "登入");
		return "register";
	}
	
	//------------------------- 以上聖捷

	@RequestMapping(value = { "/", "/index" })
	public String index() {
		return "index";
	}
	
	@RequestMapping("oldindex")
	public String oldIndex() {
		return "wade/index";
	}
	
	// 前端測試
	
	@RequestMapping("/test")
	public String Test() {
		return "html/index";
	}
	@RequestMapping("/test1")
	public String Test1() {
		return "html/buytoday";
	}
	@RequestMapping("/test2")
	public String Test2() {
		return "html/commodity";
	}
	@RequestMapping("/test3")
	public String Test3() {
		return "html/details";
	}
	@RequestMapping("/test4")
	public String Test4() {
		return "html/group";
	}
	@RequestMapping("/test5")
	public String Test5() {
		return "html/information";
	}
	@RequestMapping("/test6")
	public String Test6() {
		return "html/login";
	}
//	@RequestMapping("/test7")
//	public String Test7() {
//		return "shopcart";
//	}
	
	// 前端測試尾端
	
//  顯示 index 的圖片
//	@RequestMapping("showimg")
//	public void showimg(OutputStream op, HttpServletRequest rq, HttpServletResponse rp) {
//		String path = "/WEB-INF/views/res/static/img/hot3.png";
//		rp.setContentType("image");
//		
//		try (InputStream is = rq.getServletContext().getResourceAsStream(path);){
//			byte[] b = new byte[1024];
//			int len;
//			while ((len = is.read(b)) != -1) {
//				op.write(b,0,len);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
	
	
}
