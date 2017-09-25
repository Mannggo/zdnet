package com.zdnet.service;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Book;
import com.zdnet.domain.BookComment;

public interface BookService {
	List<Book> selectAllBooks(Map map);

	void insertBook(Book book);

	void deleleBookById(Integer bid);

	void updateBook(Book book);

	List<Map> selectBook(Map map);

	int selectCount();

	List<Book> selectAllBooksAndStar(Map map);

	List<BookComment> selectAllComments(Integer bid);

	boolean checkIsCollection(Integer bid, Integer uid);
}
