package com.zdnet.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PermissionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub\
		if(request.getRequestURI().endsWith("login.do")){
			return true;
		}
		if(request.getRequestURI().endsWith(".do")){
			if(request.getSession().getAttribute("user") == null){
				response.sendRedirect("login.do");
				return false;
				
			}
			return true;
		}
		if(!request.getRequestURI().endsWith("adminLogin.action") && !request.getRequestURI().endsWith("login.html")){
			if(request.getSession().getAttribute("admin") == null){
				response.sendRedirect("page/back/permission.html");
				return false;
				
			}
		}
		return true;
	}
}
