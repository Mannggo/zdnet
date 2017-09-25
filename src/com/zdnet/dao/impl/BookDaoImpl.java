package com.zdnet.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdnet.dao.BookDao;
import com.zdnet.domain.Book;
import com.zdnet.domain.BookComment;
import com.zdnet.mapper.BookCommentMapper;
import com.zdnet.mapper.BookMapper;
@Repository
public class BookDaoImpl extends SqlSessionDaoSupport implements BookDao {
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public int deleteByPrimaryKey(Integer bid) {
		return getSqlSession().getMapper(BookMapper.class).deleteByPrimaryKey(bid);
	}

	public int insert(Book record) {
		getSqlSession().getMapper(BookMapper.class).insertSelective(record);
		return getSqlSession().getMapper(BookMapper.class).insertFirstComment(record);
	}

	public int insertSelective(Book record) {
		getSqlSession().getMapper(BookMapper.class).insertSelective(record);
		return getSqlSession().getMapper(BookMapper.class).insertFirstComment(record);
	}

	public Book selectByPrimaryKey(Integer bid) {
		return getSqlSession().getMapper(BookMapper.class).selectByPrimaryKey(bid);
	}

	public int updateByPrimaryKeySelective(Book record) {
		return getSqlSession().getMapper(BookMapper.class).updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Book record) {
		return getSqlSession().getMapper(BookMapper.class).updateByPrimaryKey(record);
	}

	public List<Book> selectAllBooks(Map map) {
		return getSqlSession().getMapper(BookMapper.class).selectAllBooks(map);
	}
	public List<Map> selectBook(Map map) {
		return getSqlSession().getMapper(BookMapper.class).selectBook(map);
	}
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(BookMapper.class).selectCount();
	}
	@Override
	public List<Book> selectAllBooksAndStar(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(BookMapper.class).selectAllBooksAndStar(map);
	}
	@Override
	public List<BookComment> selectAllComments(Integer bid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(BookCommentMapper.class).selectAllCommentByBid(bid);
	}
	@Override
	public boolean selectBookCollection(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(BookMapper.class).selectBookCollection(map).size() == 0?false:true;
	}
	
}
