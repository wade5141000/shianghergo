package com.shianghergo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shianghergo.model.CartBean;
import com.shianghergo.model.ItemBean;
import com.shianghergo.model.MemberBean;
import com.shianghergo.model.OrderBean;
import com.shianghergo.model.OrderDetailBean;
import com.shianghergo.model.StoreBean;
import com.shianghergo.service.CartService;
import com.shianghergo.service.ItemService;
import com.shianghergo.service.OrderDetailService;
import com.shianghergo.service.OrderService;
import com.shianghergo.service.ProductService;
import com.shianghergo.service.StoreService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
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
@SessionAttributes("loginOK")
public class StoreProcessController {
	
	@Autowired
	ItemService itemService;
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	
	@Autowired
	ProductService pService;
	@Autowired
	ServletContext context;
	
	@Autowired
	StoreService storeService;
	
	
	@RequestMapping("showitem")
	public String list(Model model,HttpServletRequest re) {
		List<ItemBean> list = itemService.getAllItems();
		model.addAttribute("items", list);
		return "wade/items";
	}
	
	@RequestMapping("gocart")
	public void gocart(@ModelAttribute("loginOK")MemberBean member,@RequestParam("itemid") Integer item_id,HttpServletResponse rp,HttpServletRequest re) {
		
		ItemBean ib = itemService.getItemById(item_id);
		cartService.saveToCart(ib,member.getId());
		
		HttpSession httpSession = re.getSession();
		List<CartBean> list2 = cartService.getCartItems(member.getId());
		httpSession.setAttribute("cartitems", list2);
		long total2 = 0;
		for(CartBean ccb:list2) {
			total2 += ccb.getPrice()*ccb.getAmount();
		}
		httpSession.setAttribute("total",total2);
		httpSession.setAttribute("its",list2.size());
		
		
		try {
			rp.getWriter().write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updatecart")
	public void updatecart(@ModelAttribute("loginOK")MemberBean member,HttpServletResponse rp,HttpServletRequest re) {
		int mId = member.getId();
		List<CartBean> list = cartService.getCartItems(mId);
		ObjectMapper mapper = new ObjectMapper();
		String result = "";
		
		HttpSession httpSession = re.getSession();
		List<CartBean> list2 = cartService.getCartItems(mId);
		httpSession.setAttribute("cartitems", list2);
		long total2 = 0;
		for(CartBean ccb:list2) {
			total2 += ccb.getPrice()*ccb.getAmount();
		}
		httpSession.setAttribute("total",total2);
		httpSession.setAttribute("its",list2.size());
		
		try {
			result = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(list);
			rp.getWriter().write(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("cart")
	public String cart(@ModelAttribute("loginOK")MemberBean member, Model model,HttpServletRequest re) {
		Integer mId = member.getId();
		if(mId == null) {
			System.out.println("not login");
			return "index";
		}
		List<CartBean> list = cartService.getCartItems(mId);
		model.addAttribute("cartitems",list);
		long total = 0;
		for(CartBean cb:list) {
			total += cb.getPrice()*cb.getAmount();
		}
		model.addAttribute("total",total);
		model.addAttribute("its",list.size());
		return "wade/cart";
	}
	
	@RequestMapping("changeAmount")
	public void changeAmount(HttpServletResponse rp,HttpServletRequest re) {
		// long mId = (long)(re.getSession().getAttribute("member_id"));
		// 拿到一個物品
		int total = Integer.parseInt(re.getParameter("total"));
		int id = Integer.parseInt((re.getParameter("id")));
		String type = re.getParameter("type");
		CartBean cb = cartService.updateCartBeanById(id, type);
		int newAmount = cb.getAmount();
		if(type.equals("1")) {
			total += cb.getPrice();
		}else if(type.equals("2")) {
			total -= cb.getPrice();
		}
		int totala =cb.getPrice()*newAmount;
		String result = total+","+newAmount+","+id+","+totala;
		System.out.println(result);
		
		
		HttpSession httpSession = re.getSession();
		List<CartBean> list2 = cartService.getCartItems(cb.getMember_id());
		httpSession.setAttribute("cartitems", list2);
		long total2 = 0;
		for(CartBean ccb:list2) {
			total2 += ccb.getPrice()*ccb.getAmount();
		}
		httpSession.setAttribute("total",total2);
		httpSession.setAttribute("its",list2.size());
		
		try {
			rp.getWriter().write(result);
		}  catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("delete")
	public void delete(HttpServletRequest re,HttpServletResponse rp) {
		int id = Integer.parseInt((re.getParameter("id")));
		CartBean cb = cartService.getCartBeanById(id);
		int mId = cb.getMember_id();
		
		int reduce = cartService.deleteCartBeanById(id);
		
		
		HttpSession httpSession = re.getSession();
		List<CartBean> list2 = cartService.getCartItems(mId);
		httpSession.setAttribute("cartitems", list2);
		long total2 = 0;
		for(CartBean ccb:list2) {
			total2 += ccb.getPrice()*ccb.getAmount();
		}
		httpSession.setAttribute("total",total2);
		httpSession.setAttribute("its",list2.size());
		
		
		try {
			rp.getWriter().write(String.valueOf(reduce));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value= {"order/{orderid}","orderdetail/order/{orderid}"})
	public String order(@PathVariable("orderid") Integer order_id,Model model,HttpServletRequest re,HttpServletResponse rp) {
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		int rdn = (int) (Math.random() * 100000);
		String orderNumber = "TradeNumber" + rdn;
		// 訂單編號
		obj.setMerchantTradeNo(orderNumber);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tradetime = df.format(new Date());
		// 訂單時間
		obj.setMerchantTradeDate(tradetime);
		
//		long mId = (long)(re.getSession().getAttribute("member_id"));
//		List<CartBean> list = cartService.getCartItems(mId);
		List<OrderDetailBean> list = orderDetailService.getOrderDetail(order_id);
		int price = 0;
		String itemName = "";
		for(int i=0;i<list.size();i++) {
			OrderDetailBean ob = list.get(i);
			price += (ob.getAmount()*ob.getPrice());
			if(i==0) {
				itemName += ob.getName() +" * "+ob.getAmount();
			}else {
				itemName += "#" + ob.getName()+" * "+ob.getAmount();
			}
		}
		obj.setTotalAmount(String.valueOf(price));
		obj.setItemName(itemName);
		obj.setTradeDesc("test Description");
		obj.setReturnURL("http:/localhost:8080/shianghergo");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("N");
		//  (返回商店按鈕 無付款結果)
		obj.setClientBackURL("http:/localhost:8080/shianghergo/payResult?oId="+order_id);
		// 直接重新導向 (有付款結果)
		// obj.setOrderResultURL("http:/localhost:8080/mvcExercise/ECPayResult.do");
		String form = all.aioCheckOut(obj, null);
		model.addAttribute("form",form);
		orderService.updateStatus(order_id);
		return "wade/ECPayForm";
	}
	
	@RequestMapping("payResult")
	public String payResult(Model model,@RequestParam("oId")Integer oId) {
		
		System.out.println("pay result:" + oId);
		OrderBean ob = orderService.getOrderById(oId);
		model.addAttribute("order",ob);
		return "wade/payresult";
	}
	
	@RequestMapping("orderdetail/{id}")
	public String orderDetail(@PathVariable("id") Integer id,Model model,HttpServletRequest re) {
		List<OrderDetailBean> list = orderDetailService.getOrderDetail(id);
		model.addAttribute("details",list);
		model.addAttribute("order_id",id);
		return "wade/detail";
	}
	
	@RequestMapping("addorder")
	public String addOrder(@ModelAttribute("loginOK")MemberBean member,Model model,HttpServletRequest re) {
		
		int mId = member.getId();
		int order_id = orderService.addOrder(mId);
		List<OrderDetailBean> list = orderDetailService.getOrderDetail(order_id);
		OrderBean ob = orderService.getOrderById(order_id);
		model.addAttribute("details",list);
		model.addAttribute("order",ob);
		
		
		HttpSession httpSession = re.getSession();
		List<CartBean> list2 = cartService.getCartItems(mId);
		httpSession.setAttribute("cartitems", list2);
		long total2 = 0;
		for(CartBean ccb:list2) {
			total2 += ccb.getPrice()*ccb.getAmount();
		}
		httpSession.setAttribute("total",total2);
		httpSession.setAttribute("its",list2.size());
		
		
		return "wade/detail";
	}
	
	@RequestMapping(value = "wade/getPicture/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletRequest resp, @PathVariable Integer id) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ItemBean bean = pService.getProductById(id);
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
		String mimeType = context.getMimeType(filename);
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
	
	@RequestMapping("/productfile.s")
	public void CreateExcel(HttpServletRequest request,HttpServletResponse response,Integer store_id) {
		store_id = 20001;
		StoreBean sb = storeService.getStoreById(store_id);
		Object[] items = sb.getItems().toArray();
		File file = new File("C:\\GitVC\\repository\\shianghergo\\src\\main\\webapp\\resources\\"+sb.getName()+".xls");
		try {
//			Workbook wb = Workbook.getWorkbook(new File("C:\\Project\\workspace\\jspExercise\\src\\main\\webapp\\resources\\template.xls"));
			Workbook wb = Workbook.getWorkbook(new File("C:\\GitVC\\repository\\shianghergo\\src\\main\\webapp\\resources\\template.xls"));
			WritableWorkbook wwb = Workbook.createWorkbook(file, wb);
			WritableSheet sheet = wwb.getSheet(0);
			WritableFont writeFont = new WritableFont(WritableFont.ARIAL, 12, WritableFont.BOLD);
			WritableCellFormat writeFormat = new WritableCellFormat(writeFont);
			writeFormat.setAlignment(Alignment.CENTRE);
			writeFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			writeFormat.setBorder(Border.LEFT, BorderLineStyle.THIN, Colour.BLACK);
			writeFormat.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.BLACK);
			writeFormat.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.BLACK);
			writeFormat.setBorder(Border.BOTTOM, BorderLineStyle.THIN, Colour.BLACK);
			
			Label la = new Label(0,0,sb.getName(),writeFormat);
			sheet.addCell(la);
			
			for(int i=4;i<items.length+4;i++) {
				for(int j=3;j<=4;j++) {
					if(j%2==1) {
						ItemBean ib = (ItemBean) items[i-4];
						String name = ib.getName();
						Label label = new Label(i,j,name,writeFormat);
						sheet.addCell(label);
					}else {
						ItemBean ib = (ItemBean) items[i-4];
						int price = ib.getPrice();
						Label label = new Label(i,j,String.valueOf(price),writeFormat);
						sheet.addCell(label);
					}
				}
			}
//			for(int i=4;i<=10;i++) {
//				for(int j=3;j<=4;j++) {
//					if(j%2==1) {
//						String x = "商品"+(i-3);
//						Label label = new Label(i,j,x,writeFormat);
//						sheet.addCell(label);
//					}else {
//						int price = 50;
//						Label label = new Label(i,j,String.valueOf(price*2*i),writeFormat);
//						sheet.addCell(label);
//					}
//					
//				}
//			}
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
			FileInputStream fis = new FileInputStream(file);
			response.reset();
//			response.setContentType("bin");
			response.setContentType("application/octet-stream; charset=iso-8859-1;");
//			response.setContentType("application/octet-stream; charset=UTF-8;");
			
//			attachment;
//            filename="$encoded_fname";
//            filename*=utf-8''$encoded_fname
			String fileName = sb.getName()+".xls";
			fileName = URLEncoder.encode(fileName, "UTF-8");
			
			response.setHeader("content-disposition","attachment; filename*=UTF-8''"+fileName);
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
