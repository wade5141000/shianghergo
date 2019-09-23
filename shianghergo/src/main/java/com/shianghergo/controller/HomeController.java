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
	
	// Excel未完成
	@RequestMapping("/productfile.do")
	public void CreateExcel(HttpServletRequest request,HttpServletResponse response) {
		try {
//			Workbook wb = Workbook.getWorkbook(new File("C:\\Project\\workspace\\jspExercise\\src\\main\\webapp\\resources\\template.xls"));
			Workbook wb = Workbook.getWorkbook(new File("C:\\GitVC\\repository\\shianghergo\\src\\main\\webapp\\resources\\template.xls"));
			WritableWorkbook wwb = Workbook.createWorkbook(new File("C:\\GitVC\\repository\\shianghergo\\src\\main\\webapp\\resources\\output_test.xls"), wb);
			WritableSheet sheet = wwb.getSheet(0);
			WritableFont writeFont = new WritableFont(WritableFont.ARIAL, 12, WritableFont.BOLD);
			WritableCellFormat writeFormat = new WritableCellFormat(writeFont);
			writeFormat.setAlignment(Alignment.CENTRE);
			writeFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			writeFormat.setBorder(Border.LEFT, BorderLineStyle.THIN, Colour.BLACK);
			writeFormat.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.BLACK);
			writeFormat.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.BLACK);
			writeFormat.setBorder(Border.BOTTOM, BorderLineStyle.THIN, Colour.BLACK);
			for(int i=4;i<=10;i++) {
				for(int j=3;j<=4;j++) {
					if(j%2==1) {
						String x = "商品"+(i-3);
						Label label = new Label(i,j,x,writeFormat);
						sheet.addCell(label);
					}else {
						int price = 50;
						Label label = new Label(i,j,String.valueOf(price*2*i),writeFormat);
						sheet.addCell(label);
					}
					
				}
			}
			wwb.write();
			wwb.close();
			wb.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//---------------------------------------------------------------------------------
		OutputStream out;
		try {
			out = response.getOutputStream();
//			response.setContentType("application/vnd.ms-excel");
			FileInputStream fis = new FileInputStream(new File("C:\\Project\\workspace\\jspExercise\\src\\main\\webapp\\resources\\output_test.xls"));
			response.reset();
//			response.setContentType("bin");
			response.setContentType("application/octet-stream; charset=iso-8859-1;");
			response.setHeader("content-disposition","attachment; filename="+"test_from_download.xls");
			byte[] b = new byte[1000];
			int len;
			while( (len=fis.read(b)) > 0) {
				out.write(b,0,len);
			}
			fis.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
