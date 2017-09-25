package com.zdnet.dao.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdnet.dao.CommentDao;
import com.zdnet.domain.BookComment;
import com.zdnet.domain.FilmComment;
import com.zdnet.domain.MusicComment;
import com.zdnet.mapper.BookCommentMapper;
import com.zdnet.mapper.FilmCommentMapper;
import com.zdnet.mapper.MusicCommentMapper;
@Repository
public class CommentDaoImpl extends SqlSessionDaoSupport implements CommentDao{
	
	/* (non-Javadoc)
	 * @see com.zdnet.dao.impl.CommentDao#setSqlSessionFactory(org.apache.ibatis.session.SqlSessionFactory)
	 */
	@Resource
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.dao.impl.CommentDao#insertBookComment(com.zdnet.domain.BookComment)
	 */
	public void insertBookComment(BookComment bookComment){
		getSqlSession().getMapper(BookCommentMapper.class).insertSelective(bookComment);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.dao.impl.CommentDao#delBookComment(java.lang.Integer)
	 */
	public void delBookComment(Integer bcid){
		getSqlSession().getMapper(BookCommentMapper.class).deleteByPrimaryKey(bcid);
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.dao.impl.CommentDao#insertFilmComment(com.zdnet.domain.FilmComment)
	 */
	public void insertFilmComment(FilmComment filmComment){
		getSqlSession().getMapper(FilmCommentMapper.class).insertSelective(filmComment);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.dao.impl.CommentDao#delFilmComment(java.lang.Integer)
	 */
	public void delFilmComment(Integer fcid){
		getSqlSession().getMapper(FilmCommentMapper.class).deleteByPrimaryKey(fcid);
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.dao.impl.CommentDao#insertMusicComment(com.zdnet.domain.MusicComment)
	 */
	public void insertMusicComment(MusicComment musicComment){
		getSqlSession().getMapper(MusicCommentMapper.class).insertSelective(musicComment);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.dao.impl.CommentDao#delMusicComment(java.lang.Integer)
	 */
	public void delMusicComment(Integer mcid){
		getSqlSession().getMapper(MusicCommentMapper.class).deleteByPrimaryKey(mcid);
	}
	
	
}
