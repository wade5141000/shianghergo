package com.shianghergo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	
	 @Override
	    public boolean preHandle(HttpServletRequest request,
	            HttpServletResponse response, Object handler) throws Exception {

	        //获取请求的url
	        String url = request.getRequestURI();
	        System.out.println("登入攔截器中抓到的請求url:"+url);
	        //判断url是否公开地址（实际使用时将公开地址配置到配置文件中）
	        //这里假设公开地址是否登陆提交的地址
	        if(url.indexOf("login.action") > 0) {
	            //如果进行登陆提交，放行
	            return true;
	        }

	        //判断session
	        HttpSession session = request.getSession();
	        //从session中取出用户身份信息
	        String account = (String) session.getAttribute("account");
	        if(account != null) {
	            return true;
	        }

	        //执行到这里表示用户身份需要验证，跳转到登陆页面
	        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);

	        return false;
	    }

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}


}
