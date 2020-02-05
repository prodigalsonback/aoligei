package com.chenyr.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class Interceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("usid") == null) {
			String basePath = request.getScheme() + "://" + request.getServerName() + ":"  + request.getServerPort()+request.getContextPath();
			//AJAX
			if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))){
	            response.setHeader("REDIRECT", "REDIRECT");
	            response.setHeader("CONTEXTPATH", basePath+"/login.do");
	        }else{
	            response.sendRedirect(basePath + "/login.do");
	        }
			return false;
		} else {
			return true;
		}
	}

}
