package testecpay;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;



@WebServlet("/testECPay")
public class ECPay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		int rdn = (int) (Math.random() * 10000);
		String orderNumber = "testOrderNumber" + rdn;
		obj.setMerchantTradeNo(orderNumber);
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tradetime = df.format(new Date());
		obj.setMerchantTradeDate(tradetime);
		String price = request.getParameter("price");
		obj.setTotalAmount(price);
		obj.setTradeDesc("test Description");
		String product = request.getParameter("product");
		obj.setItemName(product);
		// 必填
		obj.setReturnURL("http:/localhost:8080/mvcExercise");

		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("N");
		//  (返回商店按鈕 無付款結果)
		obj.setClientBackURL("http:/localhost:8080/mvcExercise/ECPayResult.do");
		// 直接重新導向 (有付款結果)
		obj.setOrderResultURL("http:/localhost:8080/mvcExercise/ECPayResult.do");
		
		
		String form = all.aioCheckOut(obj, null);
		request.setAttribute("form", form);
		RequestDispatcher rd = request.getRequestDispatcher("ECPayForm.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
