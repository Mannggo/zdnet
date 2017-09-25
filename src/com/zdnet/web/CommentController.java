package com.zdnet.web;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zdnet.domain.BookComment;
import com.zdnet.domain.FilmComment;
import com.zdnet.domain.MusicComment;
import com.zdnet.domain.User;
import com.zdnet.service.CommentService;

@Controller
public class CommentController {
	@Resource
	CommentService commentService;
	
	/*
	 * 增加书籍评论
	 */
	@RequestMapping("addBookComment.do")
	public String insertBookComment(BookComment bookComment,HttpServletRequest request){
		Integer uid = ((User) request.getSession().getAttribute("user")).getUid();
		bookComment.setUid(uid);
		bookComment.setBcentereddate(new Date(System.currentTimeMillis()));
		commentService.insertBookComment(bookComment);
		return "infoBook.do?bid="+bookComment.getBid();
		
	}
	/*
	 * 增加电影评论
	 */
	@RequestMapping("addFilmComment.do")
	public String insertFilmComment(FilmComment filmComment,HttpServletRequest request){
		Integer uid = ((User) request.getSession().getAttribute("user")).getUid();
		filmComment.setUid(uid);
		filmComment.setFcentereddate(new Date(System.currentTimeMillis()));
		commentService.insertFilmComment(filmComment);
		return "infoFilm.do?fid="+filmComment.getFid();
		
	}
	/*
	 * 增加y音乐评论
	 */
	@RequestMapping("addMusicComment.do")
	public String insertMusicComment(MusicComment musicComment,HttpServletRequest request){
		Integer uid = ((User) request.getSession().getAttribute("user")).getUid();
		musicComment.setUid(uid);
		musicComment.setMcentereddate(new Date(System.currentTimeMillis()));
		commentService.insertMusicComment(musicComment);
		return "infoMusic.do?mid="+musicComment.getMid();
		
	}
}
