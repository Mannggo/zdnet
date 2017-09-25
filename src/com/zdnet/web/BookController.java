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

import com.zdnet.domain.Book;
import com.zdnet.domain.Music;
import com.zdnet.service.BookService;

@Controller
public class BookController {
	@Resource
	BookService bookService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	/*
	 * 列出所有书目
	 */
	@RequestMapping("showAllBooks.action")
	public String showAllBooks(int page,HttpServletRequest request){
		int begin = (page-1)*20;
		int limit = 20;
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("limit",limit);
		int count = bookService.selectCount();
		List<Book> list = bookService.selectAllBooks(map);
		request.setAttribute("allBooks", list);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		return "page/back/showAllBooks.jsp";
	}
	
	/*
	 * 插入书目
	 */
	@RequestMapping("insertBook.action")
	public String insertBook(Book book, String publishdate,@RequestParam ("bpic")MultipartFile bpic,HttpServletRequest request) throws ParseException, IllegalStateException, IOException{
		book.setBpublishdate(sdf.parse(publishdate));
		book.setBentereddate(new Date(System.currentTimeMillis()));
		String bpicaddr = new Date().getTime()+"";
		File newFile = new File(request.getSession().getServletContext().getRealPath("/bookpics/")+bpicaddr);
		bpic.transferTo(newFile);
		book.setBpicaddr(bpicaddr);
		bookService.insertBook(book);
		return "showAllBooks.action?page=1";
	}
	
	//删除指定id书目
	@RequestMapping("delBook.action")
	public String delBook(Integer bid,String pageprop,HttpServletRequest request){
		Map map = new HashMap<String, String>();
		map.put("bid", bid);
		String delbpicaddr = (String) bookService.selectBook(map).get(0).get("bpicaddr");
		File delFile = new File(request.getSession().getServletContext().getRealPath("/bookpics/")+delbpicaddr);
		delFile.delete();
		bookService.deleleBookById(bid);
		if(pageprop.equals("showall"))
			return "showAllBooks.action?page=1";
		else {
			return "selectBook.action";
		}
	}
	
	//更新书目
	@RequestMapping("updateBook.action")
	public String updateBook(Book book, String publishdate,@RequestParam("bpic")MultipartFile bpic,HttpServletRequest request) throws ParseException, IllegalStateException, IOException{
		book.setBpublishdate(sdf.parse(publishdate));
		//更改文件
		if(bpic.getOriginalFilename() != "" && bpic.getOriginalFilename() != null){
			Map map = new HashMap<String, String>();
			map.put("bid", book.getBid());
			String delbpicaddr = (String) bookService.selectBook(map).get(0).get("bpicaddr");
			File delFile = new File(request.getSession().getServletContext().getRealPath("/bookpics/")+delbpicaddr);
			delFile.delete();
			String bpicaddr = new Date().getTime() + bpic.getOriginalFilename();
			File newFile = new File(request.getSession().getServletContext().getRealPath("/bookpics/")+bpicaddr);
			bpic.transferTo(newFile);
			book.setBpicaddr(bpicaddr);
		}
		bookService.updateBook(book);
		return "redirect:infoBook.action?bid="+book.getBid();
		
	}
	
	/*
	 * 查询书目
	 */
	@RequestMapping("selectBook.action")
	public String selectBook(Book book, HttpServletRequest request){
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("bname", book.getBname());
		map.put("bauthor",book.getBauthor());
		map.put("bpublisher","%"+book.getBpublisher()+"%");
		List<Map> books = bookService.selectBook(map);
		request.getSession().setAttribute("books", books);
		return "page/back/selectBook.jsp";
		
	}
	
	/*
	 * 设置精品
	 */
	@RequestMapping("setBookCream.action")
	public String setBookCream(Book book,String pageprop){
		book.setBiscream(1);
		bookService.updateBook(book);
		return "redirect:infoBook.action?bid="+book.getBid()+"&pageprop="+pageprop;
	}
	
	/*
	 * 取消精品
	 */
	@RequestMapping("cancelBookCream.action")
	public String cancelBookCream(Book book,String pageprop){
		book.setBiscream(0);
		bookService.updateBook(book);
		System.out.println("infoBook.action?bid="+book.getBid()+"&pageprop="+pageprop);
		return  "redirect:infoBook.action?bid="+book.getBid()+"&pageprop="+pageprop;
	}
	
	/*
	 * 后台查看某个书目详情
	 */
	@RequestMapping("infoBook.action")
	public String infoBook(Integer bid,String pageprop,HttpServletRequest request){
		Map map = new HashMap();
		map.put("bid", bid);
		Map n = bookService.selectBook(map).get(0);
		request.getSession().setAttribute("bookitem", bookService.selectBook(map).get(0));
		request.getSession().setAttribute("pageprop",pageprop);
		System.out.println("s");
		
		return "/page/back/infoBook.jsp";
		
	}
}
