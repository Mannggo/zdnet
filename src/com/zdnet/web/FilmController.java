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
import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zdnet.domain.Book;
import com.zdnet.domain.Film;
import com.zdnet.service.FilmService;

@Controller
public class FilmController {
	@Resource
	FilmService filmService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//后台展示所有电影条目
	@RequestMapping("showAllFilms.action")
	public String showAllFilms(int page,HttpServletRequest request){
		int begin = (page-1)*20;
		int limit = 20;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		int count = filmService.selectCount();
		List<Film> allFilms = filmService.selectAllFilms(map);
		request.getSession().setAttribute("allFilms", allFilms);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		return "page/back/showAllFilms.jsp";
	}
	//根据fid删除某个电影条目
	@RequestMapping("delFilm.action")
	public String delFilm(int fid,String pageprop,HttpServletRequest request){
		
		Map map = new HashMap<String, String>();
		map.put("fid", fid);
		Map delfilm = filmService.selectFilm(map).get(0);
		String fpicaddr =(String) delfilm.get("fpicaddr");
		new File(request.getSession().getServletContext().getRealPath("/filmpics/")+fpicaddr).delete();
		
		filmService.deleleFilmById(fid);
		if(pageprop.equals("showall"))
			return "showAllFilms.action?page=1";
		else {
			return "selectFilm.action";
			
		}
	}
	
	//插入电影条目
	@RequestMapping("insertFilm.action")
	public String insertFilm(HttpServletRequest request,Film film,@RequestParam ("fpic") MultipartFile fpic,String rundate) throws IllegalStateException, IOException, ParseException{
		film.setFentereddate(new Date(System.currentTimeMillis()));
		String fpicaddr = new Date().getTime() + "";
		System.out.println(fpicaddr);
		File newFile = new File(request.getSession().getServletContext().getRealPath("/filmpics/")+fpicaddr);
		fpic.transferTo(newFile);
		film.setFpicaddr(fpicaddr);
		film.setFrundate(sdf.parse(rundate));
		filmService.insertFilm(film);
		return "showAllFilms.action?page=1";
		
	}
	//更新电影信息
	@RequestMapping("updateFilm.action")
	public String updateFilm(HttpServletRequest request,Film film,String rundate, @RequestParam("fpic")MultipartFile fpic) throws ParseException, IllegalStateException, IOException{
		film.setFrundate(sdf.parse(rundate));
		//更改海报文件
		if(fpic.getOriginalFilename() != null &&fpic.getOriginalFilename() != ""){
			Map map = new HashMap<String, String>();
			map.put("fid", film.getFid());
			String delbpicaddr = (String) filmService.selectFilm(map).get(0).get("fpicaddr");
			File delFile = new File(request.getSession().getServletContext().getRealPath("/filmpics/")+delbpicaddr);
			delFile.delete();
			String fpicaddr = new Date().getTime() + fpic.getOriginalFilename();
			File newFile = new File(request.getSession().getServletContext().getRealPath("/filmpics/")+fpicaddr);
			fpic.transferTo(newFile);
			film.setFpicaddr(fpicaddr);
		}
		filmService.updateFilm(film);
		return "redirect:infoFilm.action?fid="+film.getFid();
	}
	//条件查询电影
	@RequestMapping("selectFilm.action")
	public String selectFilm(Film film,HttpServletRequest request){
		Map<String, String> map = new HashMap<String,String>();
		map.put("fname", film.getFname());
		map.put("fauthor",film.getFauthor());
		map.put("factor","%"+film.getFactor()+"%");
		List<Map> films = filmService.selectFilm(map);
		request.getSession().setAttribute("films", films);
		return "page/back/selectFilm.jsp";
	}
	//电影设置精品
	@RequestMapping("setFilmCream.action")
	public String setFilmCream(Film film,String pageprop){
		film.setFiscream(1);
		filmService.updateFilm(film);
		return "redirect:infoFilm.action?fid="+film.getFid()+"&pageprop="+pageprop;
	}
	//电影取消精品
	@RequestMapping("cancelFilmCream.action")
	public String calcelFilmCream(Film film,String pageprop){
		film.setFiscream(0);
		filmService.updateFilm(film);
		return "redirect:infoFilm.action?fid="+film.getFid()+"&pageprop="+pageprop;
	}
	//根据fid查看某个电影条目
	@RequestMapping("infoFilm.action")
	public String infoBook(Integer fid,String pageprop,HttpServletRequest request){
		System.out.println("sss");
		Map map = new HashMap();
		map.put("fid", fid);
		request.getSession().setAttribute("filmitem", filmService.selectFilm(map).get(0));
		request.getSession().setAttribute("pageprop",pageprop);
		
		return "/page/back/infoFilm.jsp";
		
	}
}
