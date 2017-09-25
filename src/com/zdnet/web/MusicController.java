package com.zdnet.web;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zdnet.domain.Music;
import com.zdnet.service.MusicService;

@Controller
public class MusicController {
	@Resource
	MusicService musicService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	@RequestMapping("delMusic.action")
	
	//删除某个音乐条目
	public String delMusic(int mid,String pageprop,HttpServletRequest request){
		Map map = new HashMap<String, String>();
		map.put("mid", mid);
		String delmpicaddr =(String) musicService.selectMusic(map).get(0).get("mpicaddr");
		String delmfileaddr =(String) musicService.selectMusic(map).get(0).get("mfileaddr");
		System.out.println(new File(request.getSession().getServletContext().getRealPath("/musicpics/")+delmpicaddr).delete());
		System.out.println(new File(request.getSession().getServletContext().getRealPath("/musicfiles/")+delmfileaddr).delete());
		musicService.deleleMusicById(mid);
		if(pageprop.equals("showall"))
			return "showAllMusics.action?page=1";
		else {
			return "selectMusic.action";
			
		}
	}
	//展示所有音乐条目
	@RequestMapping("showAllMusics.action")
	public String showAllMusics(int page,HttpServletRequest request){
		int begin = (page-1)*20;
		int limit = 20;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		int count = musicService.selectCount();
		List<Music> allMusics = musicService.selectAllMusics(map);
		request.getSession().setAttribute("allMusics", allMusics);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		return "page/back/showAllMusics.jsp";
	}
	
	
	//插入音乐条目
	@RequestMapping("insertMusic.action")
	public String insertMusic(HttpServletRequest request,Music music,@RequestParam ("mpic") MultipartFile mpic,@RequestParam ("mfile") MultipartFile mfile,String rundate) throws IllegalStateException, IOException, ParseException{
		music.setMentereddate(new Date(System.currentTimeMillis()));
		String mpicaddr = new Date().getTime() + "";
		String mfileaddr = new Date().getTime() + "";
		File newFile = new File(request.getSession().getServletContext().getRealPath("/musicpics/")+mpicaddr);
		File newFile1 = new File(request.getSession().getServletContext().getRealPath("/musicfiles/")+mfileaddr);
		mpic.transferTo(newFile);
		mfile.transferTo(newFile1);
		music.setMpicaddr(mpicaddr);
		music.setMfileaddr(mfileaddr);
		music.setMentereddate(new Date(System.currentTimeMillis()));
		music.setMrundate(sdf.parse(rundate));
		musicService.insertMusic(music);
		return "showAllMusics.action?page=1";
		
	}
	//更新音乐信息
	@RequestMapping("updateMusic.action")
	public String updateMusic(HttpServletRequest request,Music music,String rundate,@RequestParam("mpic")MultipartFile mpic,@RequestParam("mfile")MultipartFile mfile) throws ParseException, IllegalStateException, IOException{
		music.setMrundate(sdf.parse(rundate));
		//更改海报文件
		if(mpic.getOriginalFilename() != null &&mpic.getOriginalFilename() != ""){
			Map map = new HashMap<String, String>();
			map.put("mid", music.getMid());
			String delmpicaddr = (String) musicService.selectMusic(map).get(0).get("mpicaddr");
			File delFile = new File(request.getSession().getServletContext().getRealPath("/musicpics/")+delmpicaddr);
			delFile.delete();
			String mpicaddr = new Date().getTime() + mpic.getOriginalFilename();
			File newFile = new File(request.getSession().getServletContext().getRealPath("/musicpics/")+mpicaddr);
			mpic.transferTo(newFile);
			music.setMpicaddr(mpicaddr);
		}
		//更改可播放音乐文件
		if(mfile.getOriginalFilename() != null &&mfile.getOriginalFilename() != ""){
			Map map = new HashMap<String, String>();
			map.put("mid", music.getMid());
			String delmfileaddr = (String) musicService.selectMusic(map).get(0).get("mfileaddr");
			File delFile = new File(request.getSession().getServletContext().getRealPath("/musicfiles/")+delmfileaddr);
			delFile.delete();
			String mfileaddr = new Date().getTime() + mfile.getOriginalFilename();
			File newFile = new File(request.getSession().getServletContext().getRealPath("/musicfiles/")+mfileaddr);
			mfile.transferTo(newFile);
			music.setMfileaddr(mfileaddr);
		}
		musicService.updateMusic(music);
		return "redirect:infoMusic.action?mid="+music.getMid();
	}
	//条件查询音乐条目
	@RequestMapping("selectMusic.action")
	public String selectMusic(Music music,HttpServletRequest request){
		Map<String, String> map = new HashMap<String,String>();
		map.put("mname", music.getMname());
		map.put("mauthor",music.getMauthor());
		map.put("msinger","%"+music.getMsinger()+"%");
		List<Map> musics = musicService.selectMusic(map);
		request.getSession().setAttribute("musics", musics);
		return "/page/back/selectMusic.jsp";
	}
	//设置音乐精品
	@RequestMapping("setMusicCream.action")
	public String setMusicCream(Music music,String pageprop){
		music.setMiscream(1);
		musicService.updateMusic(music);
		return "redirect:infoMusic.action?mid="+music.getMid()+"&pageprop="+pageprop;
	}
	//取消音乐精品
	@RequestMapping("cancelMusicCream.action")
	public String calcelMusicCream(Music music,String pageprop){
		music.setMiscream(0);
		musicService.updateMusic(music);
		return "redirect:infoMusic.action?mid="+music.getMid()+"&pageprop="+pageprop;
	}
	//根据mid展示某个音乐条目
	@RequestMapping("infoMusic.action")
	public String infoBook(Integer mid,String pageprop,HttpServletRequest request){
		System.out.println("sss");
		Map map = new HashMap();
		map.put("mid", mid);
		request.getSession().setAttribute("musicitem", musicService.selectMusic(map).get(0));
		request.getSession().setAttribute("pageprop",pageprop);
		
		return "/page/back/infoMusic.jsp";
		
	}
	
	@RequestMapping("a.action")
	public String test(){
		Music m = new Music();
		m.setMauthor("沉稳");
		m.setMentereddate(new Date(System.currentTimeMillis()));
		m.setMfileaddr("D:\\apache-tomcat-8.0.33\\webapps\\zdnet\\musicfiles\\1.txt");
		m.setMname("人来人往");
		m.setMpicaddr("D:\\apache-tomcat-8.0.33\\webapps\\zdnet\\musicpics\\2.txt");
		m.setMsinger("陈奕迅");
		m.setMrundate(new Date(System.currentTimeMillis()));
		for(int i = 0; i < 20; i++){
			musicService.insertMusic(m);
		}
		return "";
	}
}
