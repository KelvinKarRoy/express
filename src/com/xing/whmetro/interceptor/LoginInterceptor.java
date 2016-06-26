package com.xing.whmetro.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xing.whmetro.constants.UsersConstant;
/**
 *  登陆拦截器 
 * @author wangfucai
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	// 实现用户访问页面时的登录验证功能
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String url=request.getRequestURI();
		
		if(url.indexOf("404")!=-1||url.indexOf("500")!=-1)
		{
			return true;
		}
		
		Object sessionObject=request.getSession().getAttribute(UsersConstant.LOGIN_SESSION_USERS);
		
		if(sessionObject==null)
		{
			//如果是ajax请求响应头会有，x-requested-with  
			if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest"))
			{ 
	            response.setHeader("sessionstatus", "timeout");//在响应头设置session状态  
	        }else
	        {
	        	response.sendRedirect(request.getContextPath()+"/login");
	        	return false;
	        }  
		}
		return super.preHandle(request, response, handler);
	}
}
