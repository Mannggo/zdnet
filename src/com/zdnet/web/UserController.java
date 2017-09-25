package com.zdnet.web;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zdnet.domain.User;
import com.zdnet.service.UserService;
import com.zdnet.service.impl.UserServiceImpl;
import com.zdnet.utils.MailSender;

@Controller
public class UserController {
	@Resource
	UserService userService;
	//用户登录
	@RequestMapping("login.do")
	public String login(String uemail, String upassword,HttpServletRequest request){
		if("".equals(uemail) || uemail == null || "".equals(upassword)|| upassword == null){
			return "WEB-INF/page/login.jsp";
		}
		Map map = new HashMap();
		map.put("uemail", uemail);
		map.put("upassword", upassword);
		List<User> user = userService.selectUser(map);
		if(user.size() == 1){
			request.getSession().setAttribute("user", user.get(0));
			
			return "index.do";
		}else{
			request.setAttribute("msg", "账户密码错误");
			return "WEB-INF/page/login.jsp";
		}
	}
	//用户注销
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "login.do";
	}
	
	//注册时发送验证码到邮箱
	@RequestMapping("sendIdcode.do")
	public void send(String uemail,HttpServletRequest request,HttpServletResponse response) throws Exception{
		Writer out = response.getWriter();
		Map<String, String> map = new HashMap<String, String>();
		map.put("uemail", uemail);
		if(userService.selectUser(map).size() == 0){
			int idcode = (int)(Math.random()*(9999-1000+1))+1000;
			request.getSession().setAttribute("idcode", String.valueOf(idcode));
			new MailSender.Builder("您在仲恺豆瓣注册的验证码为："+String.valueOf(idcode),uemail ).Subject("仲恺豆瓣注册验证邮件").send();
			out.write("sendsuccess");
		}else{
			out.write("hasexist");
		}
		
	}
	//根据验证码注册
	@RequestMapping("regist.do")
	public void regist(User user,HttpServletRequest request,HttpServletResponse response,String idcode) throws IOException{
		Writer out = response.getWriter();
		if(idcode.equals(request.getSession().getAttribute("idcode"))){
			user.setUentereddate(new Date(System.currentTimeMillis()));
			userService.insertUser(user);
			
			out.write("insertsuccess");
		}else{
			out.write("idcodeerror");
		}
		
	}
	//修改头像
	@RequestMapping("changePic.do")
	public String changePic(@RequestParam("upic")MultipartFile upic,HttpServletRequest request) throws IllegalStateException, IOException{
		String upicaddr = new Date().getTime()+"";
		User user = (User) request.getSession().getAttribute("user");
		File newFile = new File(request.getSession().getServletContext().getRealPath("/userpics/")+upicaddr);
		upic.transferTo(newFile);
		
		if(!user.getUpicaddr().equals("default.png")){
			String delupicaddr = user.getUpicaddr();
			File delFile = new File(request.getSession().getServletContext().getRealPath("/userpics/")+delupicaddr);
			delFile.delete();
			
		}
		user.setUpicaddr(upicaddr);
		userService.updateUser(user);
		return "userInfo.do";
	}
	//修改昵称
	@RequestMapping("changeName.do")
	public String changeName(String newname,HttpServletRequest request,HttpServletResponse response) throws IOException{
		User user = (User) request.getSession().getAttribute("user");
		user.setUnickname(newname);
		userService.updateUser(user);
		request.getSession().setAttribute("user", user);
		return "userInfo.do";
	}
	//收藏图书
	@RequestMapping("collectBook.do")
	public String collectBook(Integer bid,HttpServletRequest request){
		Integer uid = ((User) request.getSession().getAttribute("user")).getUid();
		Map map = new HashMap();
		map.put("uid", uid);
		map.put("bid", bid);
		userService.addBookCollection(map);
		return "infoBook.do?bid="+bid;
	}
	//收藏电影
	@RequestMapping("collectFilm.do")
	public String collectFilm(Integer fid,HttpServletRequest request){
		Integer uid = ((User) request.getSession().getAttribute("user")).getUid();
		Map map = new HashMap();
		map.put("uid", uid);
		map.put("fid", fid);
		userService.addFilmCollection(map);
		return "infoFilm.do?fid="+fid;
	}
	//收藏音乐
	@RequestMapping("collectMusic.do")
	public String collectMusic(Integer mid,HttpServletRequest request){
		Integer uid = ((User) request.getSession().getAttribute("user")).getUid();
		Map map = new HashMap();
		map.put("uid", uid);
		map.put("mid", mid);
		userService.addMusicCollection(map);
		return "infoMusic.do?mid="+mid;
	}
	
	
	
}
