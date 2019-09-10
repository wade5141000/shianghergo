package testecpay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ECPayResult.do")
public class ECPay2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hihihi");
		String checkValue = request.getParameter("CheckMacValue");
		String price = request.getParameter("TradeAmt");
		String status = request.getParameter("RtnCode");
		String tradeDate = request.getParameter("TradeDate");
		System.out.println(checkValue);
		System.out.println(price);
		System.out.println(status);
		System.out.println(tradeDate);
		if(status.equals("1")) {
			System.out.println("success");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("gogogo");
		doGet(request, response);
	}

}
