package com.zdnet.web;

import java.io.IOException;
import java.io.Writer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zdnet.dao.UserDao;
import com.zdnet.domain.Activity;
import com.zdnet.domain.User;
import com.zdnet.service.ActivityService;
import com.zdnet.utils.MailSender;
@Controller
public class ActivityController {
	@Resource
	ActivityService activityService;
	@Resource
	UserDao UserDao;
	//格式化日期对象
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	//后台展示所有活动
	@RequestMapping("showAllActivities.action")
	public String showAllActivities(int page,HttpServletRequest request){
		int begin = (page-1)*20;
		int limit = 20;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		List<Map> list = activityService.selectAllActivities(map);
		int count = activityService.selectCount();
		request.getSession().setAttribute("allActs", list);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		System.out.println("daole1");
		return "page/back/showAllActivities.jsp";
	}
	//后台根据aid删除活动
	@RequestMapping("delActivity.action")
	public String delActivity(Integer aid,String uemail,String aname) throws Exception{
		activityService.deleteActivityByAid(aid);
		if(uemail != null && !"".equals(uemail))
			new MailSender.Builder("很遗憾，你在仲恺豆瓣发起的活动'"+aname+"'未通过审核，请尝试重新发起",uemail ).Subject("仲恺豆瓣活动审核通知邮件").send();
		return "showAllActivities.action?page=1";
		
	}
	//后台进入审核活动页面
	@RequestMapping("checkActivities.action")
	public String checkActivities(HttpServletRequest request){
		List<Map> list = activityService.selectNoPassActivities();
		request.getSession().setAttribute("passActs", list);
		request.getSession().setAttribute("count", list.size());
		return "/page/back/checkActivities.jsp";
	}
	//后台根据aid通过审核活动
	@RequestMapping("passActivity.action")
	public String passAct(Activity activity,String uemail,String aname) throws Exception{
		activity.setAispass(1);
		activityService.updateActivity(activity);
		new MailSender.Builder("恭喜你，你在仲恺豆瓣发起的活动:'"+aname+"'已通过审核,请登录查看",uemail ).Subject("仲恺豆瓣活动审核通知邮件").send();
		
		return "checkActivities.action";
	}
	//用户uid报名活动
	@RequestMapping("joinAct.do")
	public String joinAct( HttpServletRequest request, Integer aid){
		activityService.joinAct(aid,((User)request.getSession().getAttribute("user")).getUid());
		return "infoAct.do?aid="+aid;
	}
	//用户发起活动ajax
	@RequestMapping("insertAct.do")
	public String insertAct(Activity act,String deadline,String holdDate,HttpServletRequest request,HttpServletResponse response) throws ParseException, IOException{
		if(act.getAname() == null || "".equals(act.getAname())){
			return"WEB-INF/page/insertAct.jsp";
		}
		act.setAdeadline(sdf.parse(deadline));
		act.setAholddate(sdf.parse(holdDate));
		act.setAentereddate(new Date(System.currentTimeMillis()));
		act.setUid(((User)request.getSession().getAttribute("user")).getUid());
		Writer out = response.getWriter();
		activityService.insertActivity(act);
		out.write("success");
		return null;
	}
}

