package com.zdnet.web;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.security.auth.login.LoginContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zdnet.domain.Admin;
import com.zdnet.service.AdminService;

@Controller
public class AdminController {
	@Resource
	AdminService adminService;
	/*
	 * 删除管理员
	 */
	@RequestMapping("delAdmin.action" )
	public String delAdmin(Integer aid){
		adminService.delAdminByAid(aid);
		return "showAllAdmins.action";
	}
	/*
	 * 转到管理员登录页面
	 */
	
	@RequestMapping("backLogin.action")
	public String toLogin(){
		return "redirect:page/back/login.html";
		
	}
	//管理员根据账户密码登陆
	@RequestMapping("adminLogin.action")
	public String login(String account, String apassword,HttpServletResponse response,HttpServletRequest request) throws IOException{
		String msg = adminService.checkByAccountAndPsw(account, apassword);
		Writer out = response.getWriter();
		if(msg.equals("checktrue")){
			Map map = new HashMap<String, String>();
			map.put("account", account);
			request.getSession().setAttribute("admin", adminService.selectAdmin(map).get(0));
			out.write(msg);
			return null;
		}
		out.write(msg);
		return null;
	}
	
	/*
	 * 管理员注销
	 */
	@RequestMapping("adminLogout.action")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:page/back/login.html";
		
	}
	
	/*
	 * 新增管理员
	 */
	@RequestMapping("insertAdmin.action")
	public String insert(Admin admin){
		
		adminService.insertAdmin(admin);
		return "showAllAdmins.action";
	}
	
	/*
	 * 跳转管理员管理页面
	 */
	
	@RequestMapping("showAllAdmins.action")
	public String showAllAdmins(HttpServletRequest request){
		Map map = new HashMap();
		map.put("aisroot", "0");
		request.setAttribute("allAdmins", adminService.selectAdmin(map));
		
		return "page/back/setting.jsp";
		
	}
}
