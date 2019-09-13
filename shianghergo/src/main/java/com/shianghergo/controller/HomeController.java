package com.shianghergo.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value = { "/", "/index" })
	public String index() {
		return "index";
	}
	
	// index 的圖片
	@RequestMapping("showimg")
	public void showimg(OutputStream op, HttpServletRequest rq, HttpServletResponse rp) {
		String path = "/WEB-INF/views/res/static/img/hot3.png";
		rp.setContentType("image");
		
		try (InputStream is = rq.getServletContext().getResourceAsStream(path);){
			byte[] b = new byte[1024];
			int len;
			while ((len = is.read(b)) != -1) {
				op.write(b,0,len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
