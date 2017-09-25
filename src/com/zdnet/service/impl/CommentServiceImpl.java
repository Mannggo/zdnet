package com.zdnet.service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import com.zdnet.dao.CommentDao;
import com.zdnet.domain.BookComment;
import com.zdnet.domain.FilmComment;
import com.zdnet.domain.MusicComment;
import com.zdnet.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService{
	@Resource
	CommentDao commentDao;

	@Override
	public void insertBookComment(BookComment bookComment) {
		// TODO Auto-generated method stub
		commentDao.insertBookComment(bookComment);
	}

	@Override
	public void delBookComment(Integer bcid) {
		// TODO Auto-generated method stub
		commentDao.delBookComment(bcid);
	}

	@Override
	public void insertFilmComment(FilmComment filmComment) {
		// TODO Auto-generated method stub
		commentDao.insertFilmComment(filmComment);
	}

	@Override
	public void delFilmComment(Integer fcid) {
		// TODO Auto-generated method stub
		commentDao.delFilmComment(fcid);
	}

	@Override
	public void insertMusicComment(MusicComment musicComment) {
		// TODO Auto-generated method stub
		commentDao.insertMusicComment(musicComment);
	}

	@Override
	public void delMusicComment(Integer mcid) {
		// TODO Auto-generated method stub
		commentDao.delMusicComment(mcid);
	}

}
