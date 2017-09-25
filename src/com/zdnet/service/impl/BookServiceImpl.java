package com.zdnet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdnet.dao.BookDao;
import com.zdnet.domain.Book;
import com.zdnet.domain.BookComment;
import com.zdnet.service.BookService;
@Service
public class BookServiceImpl implements BookService {
	@Resource
	BookDao bookDao;
	public List<Book> selectAllBooks(Map map) {

		return bookDao.selectAllBooks(map);
	}
	@Override
	public void insertBook(Book book) {
		// TODO Auto-generated method stub
		bookDao.insert(book);
	}
	@Override
	public void deleleBookById(Integer bid) {
		// TODO Auto-generated method stub
		bookDao.deleteByPrimaryKey(bid);
	}
	@Override
	public void updateBook(Book book) {
		// TODO Auto-generated method stub
		bookDao.updateByPrimaryKeySelective(book);
	}
	
	public List<Map> selectBook(Map map) {
		return bookDao.selectBook(map);
	}
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return bookDao.selectCount();
	}
	@Override
	public List<Book> selectAllBooksAndStar(Map map) {
		// TODO Auto-generated method stub
		return bookDao.selectAllBooksAndStar(map);
	}
	@Override
	public List<BookComment> selectAllComments(Integer bid) {
		// TODO Auto-generated method stub
		return bookDao.selectAllComments(bid);
	}
	@Override
	public boolean checkIsCollection(Integer bid, Integer uid) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("uid", uid);
		map.put("bid", bid);
		return bookDao.selectBookCollection(map);
	}

}
