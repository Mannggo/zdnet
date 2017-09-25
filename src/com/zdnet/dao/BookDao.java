package com.zdnet.dao;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Book;
import com.zdnet.domain.BookComment;

public interface BookDao {
	int deleteByPrimaryKey(Integer bid);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer bid);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
    
    List<Book> selectAllBooks(Map map);

	List<Map> selectBook(Map map);

	int selectCount();

	List<Book> selectAllBooksAndStar(Map map);

	List<BookComment> selectAllComments(Integer bid);

	boolean selectBookCollection(Map map);
}
