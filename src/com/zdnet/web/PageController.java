package com.zdnet.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.mail.handlers.multipart_mixed;
import com.zdnet.domain.Activity;
import com.zdnet.domain.Book;
import com.zdnet.domain.BookComment;
import com.zdnet.domain.Film;
import com.zdnet.domain.FilmComment;
import com.zdnet.domain.Music;
import com.zdnet.domain.MusicComment;
import com.zdnet.domain.User;
import com.zdnet.service.ActivityService;
import com.zdnet.service.BookService;
import com.zdnet.service.FilmService;
import com.zdnet.service.MusicService;
import com.zdnet.service.UserService;

@Controller
class PageController {
	@Resource
	MusicService musicService;
	@Resource
	BookService bookService;
	@Resource
	FilmService filmService;
	@Resource
	ActivityService activityService;
	@Resource
	UserService userService;
	
	
	//主页！
	@RequestMapping("index.do")
	public String toIndex(HttpServletRequest request){
		Map map = new HashMap();
		map.put("begin", 0);
		map.put("limit", 8);
		map.put("iscream", 1);
		List<Book> books = bookService.selectAllBooksAndStar(map);
		List<Music> musics = musicService.selectAllMusicsAndStar(map);
		List<Film> films = filmService.selectAllFilmsAndStar(map);
		
		List<Book> creamBooks = bookService.selectAllBooks(map);
		request.setAttribute("creamBooks", creamBooks);
		
		List<Film> creamFilms = filmService.selectAllFilms(map);
		request.setAttribute("creamFilms", creamFilms);
		
		List<Music> creamMusics = musicService.selectAllMusics(map);
		request.setAttribute("creamMusics", creamMusics);
		
		request.setAttribute("musics", musics);
		request.setAttribute("films", films);
		request.setAttribute("books", books);
		return "WEB-INF/page/index.jsp";
	}
	
	//书目详情
	@RequestMapping("infoBook.do")
	public String infoBook(Integer bid,HttpServletRequest request){
		Map map = new HashMap();
		map.put("bid", bid);
		
		List<Map> bookItem = bookService.selectBook(map);
		List<BookComment> bookComments = bookService.selectAllComments(bid);
		request.setAttribute("bookItem", bookItem.get(0));
		
		Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
		request.setAttribute("iscollection", bookService.checkIsCollection(bid,uid));
		request.setAttribute("comment", bookComments);
		return "WEB-INF/page/bookInfo.jsp";
		
	}
	//电影详情
	@RequestMapping("infoFilm.do")
	public String infoFilm(Integer fid,HttpServletRequest request){
		Map map = new HashMap();
		map.put("fid", fid);
		List<Map> filmItem = filmService.selectFilm(map);
		List<FilmComment> filmComments = filmService.selectAllComments(fid);
		request.setAttribute("filmItem", filmItem.get(0));
		
		Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
		request.setAttribute("iscollection", filmService.checkIsCollection(fid,uid));
		request.setAttribute("comment", filmComments);
		return "WEB-INF/page/filmInfo.jsp";
		
	}
	
	//音乐详情
	@RequestMapping("infoMusic.do")
	public String infoMusic(Integer mid,HttpServletRequest request){
		Map map = new HashMap();
		map.put("mid", mid);
		List<Map> musicItem = musicService.selectMusic(map);
		List<MusicComment> musicComments = musicService.selectAllComments(mid);
		request.setAttribute("musicItem", musicItem.get(0));
		
		Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
		request.setAttribute("iscollection", musicService.checkIsCollection(mid,uid));
		request.setAttribute("comment", musicComments);
		return "WEB-INF/page/musicInfo.jsp";
		
	}
	//活动详情
	@RequestMapping("infoAct.do")
	public String infoAct(Integer aid,HttpServletRequest request){
		Map map = new HashMap();
		map.put("aid", aid);
		Map activityItem = activityService.selectActivity(map).get(0);
		int totalOfJoin = activityService.selectCountOfJoin(aid);
		boolean checkStatus = activityService.checkStatus(aid,((User)request.getSession().getAttribute("user")).getUid());
		
		request.setAttribute("totalOfJoin", totalOfJoin);
		request.setAttribute("checkStatus", checkStatus);
		request.setAttribute("actItem", activityItem);
		return "WEB-INF/page/actInfo.jsp";
		
	}
	
	//书籍列表
	@RequestMapping("showAllBooks.do")
	public String showAllBooks(int page,HttpServletRequest request){
		int begin = (page-1)*5;
		int limit = 5;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		
		List<Book> list = bookService.selectAllBooksAndStar(map);
		int count = bookService.selectCount();
		
		map.put("limit",10);
		map.put("iscream", 1);
		List<Book> creamBooks = bookService.selectAllBooks(map);
		request.setAttribute("creamBooks", creamBooks);
		
		
		request.setAttribute("allBooks", list);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		return "WEB-INF/page/showAllBooks.jsp";
	}
	//电影列表
	@RequestMapping("showAllFilms.do")
	public String showAllFilms(int page,HttpServletRequest request){
		int begin = (page-1)*5;
		int limit = 5;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		
		List<Film> allFilms = filmService.selectAllFilmsAndStar(map);
		int count = filmService.selectCount();
		
		map.put("limit",10);
		map.put("iscream", 1);
		List<Film> creamFilms = filmService.selectAllFilms(map);
		request.setAttribute("creamFilms", creamFilms);
		
		
		request.getSession().setAttribute("allFilms", allFilms);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		return "WEB-INF/page/showAllFilms.jsp";
	}
	
	//音乐列表
	@RequestMapping("showAllMusics.do")
	public String showAllMusics(int page,HttpServletRequest request){
		int begin = (page-1)*5;
		int limit = 5;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		
		List<Music> allMusics = musicService.selectAllMusicsAndStar(map);
		int count = musicService.selectCount();
		
		map.put("limit",10);
		map.put("iscream", 1);
		List<Music> creamMusics = musicService.selectAllMusics(map);
		request.setAttribute("creamMusics", creamMusics);
		
		request.getSession().setAttribute("allMusics", allMusics);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		return "WEB-INF/page/showAllMusics.jsp";
	}
	
	//活动列表
	@RequestMapping("showAllActivities.do")
	public String showAllActivities(int page,HttpServletRequest request){
		int begin = (page-1)*4;
		int limit = 4;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		map.put("aispass",1);
		List<Map> list = activityService.selectAllActivities(map);
		int count =activityService.selectCount();
		request.getSession().setAttribute("allActs", list);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		return "WEB-INF/page/showAllActivities.jsp";
	}
	//个人中心
	@RequestMapping("userInfo.do")
	public String userInfo(HttpServletRequest request){
		Map map = new HashMap();
		Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
		map.put("uid", uid);
		request.getSession().setAttribute("joinActs", activityService.selectJoinActivity(uid));
		request.getSession().setAttribute("myActs", activityService.selectActivity(map));
		
		request.getSession().setAttribute("myBooks", userService.selectBookCollection(uid));
		request.getSession().setAttribute("myFilms", userService.selectFilmCollection(uid));
		request.getSession().setAttribute("myMusics", userService.selectMusicCollection(uid));
		return "WEB-INF/page/userInfo.jsp";
	}
	
	//全站查询
//	@RequestMapping("queryItem.do")
//	public String queryItem(String condition,HttpServletRequest request){
//		Map map = new HashMap();
//		map.put("condition", "%"+condition+"%");
//		List<Book> books = bookService.selectBook(map);
//		request.getSession().setAttribute("queryBooks", bookService.selectBook(map));
//		request.getSession().setAttribute("queryFilms", filmService.selectFilm(map));
//		request.getSession().setAttribute("queryMusics", musicService.selectMusic(map));
//		return "WEB-INF/page/queryItem.jsp";
//	}
	
	
}
