package com.shianghergo.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.shianghergo.exception.UserException;


public class MyIntercptor extends HandlerInterceptorAdapter {
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
	        System.out.println("before");
	      //创建session
			HttpSession session =request.getSession();
			
			//无需登录，允许访问的地址
			String[] allowUrls =new String[]{"toLogin","login"};
				
			//获取请求地址
			String url =request.getRequestURL().toString();
			
			//获得session中的用户
			 Object user = session.getAttribute("loginOK");
			 System.out.println("获得session中的用户:"+user);
			
			for (String strUrl : allowUrls) {
				if(url.contains(strUrl))
				{
					return true;
				}
			}
			
			if(user ==null)
			{
				throw new UserException("您尚未登陸！");	
									
			}
			//重定向
			response.sendRedirect(request.getContextPath()+"/login");
				

	        return true;
	    }//进入Handler方法之前执行。可以用于身份认证、身份授权。比如如果认证没有通过表示用户没有登陆，需要此方法拦截不再往下执行（return false），否则就放行（return true）。

	    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

	    }//进入Handler方法之后，返回ModelAndView之前执行。可以看到该方法中有个modelAndView的形参。应用场景：从modelAndView出发：将公用的模型数据（比如菜单导航之类的）在这里传到视图，也可以在这里同一指定视图。

	    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
	        System.out.println("after");
	    }//执行Handler完成之后执行。应用场景：统一异常处理，统一日志处理等。
	}
	

