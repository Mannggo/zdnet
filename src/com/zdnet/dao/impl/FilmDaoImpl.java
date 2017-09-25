package com.zdnet.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdnet.dao.FilmDao;
import com.zdnet.domain.Film;
import com.zdnet.domain.FilmComment;
import com.zdnet.mapper.FilmCommentMapper;
import com.zdnet.mapper.FilmMapper;
@Repository
public class FilmDaoImpl extends SqlSessionDaoSupport implements FilmDao {
	@Override
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public int deleteByPrimaryKey(Integer fid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).deleteByPrimaryKey(fid);
	}

	@Override
	public int insert(Film record) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).insert(record);
	}

	@Override
	public int insertSelective(Film record) {
		// TODO Auto-generated method stub
		getSqlSession().getMapper(FilmMapper.class).insertSelective(record);
		return getSqlSession().getMapper(FilmMapper.class).insertFirstComment(record);
	}

	@Override
	public Film selectByPrimaryKey(Integer fid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).selectByPrimaryKey(fid);
	}

	@Override
	public int updateByPrimaryKeySelective(Film record) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Film record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Film> selectAllFilms(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).selectAllFilms(map);
	}
	@Override
	public List<Map> selectFilm(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).selectFilm(map);
	}
	@Override
	public int selectCount(){
		return getSqlSession().getMapper(FilmMapper.class).selectCount();
	}
	@Override
	public List<Film> selectAllFilmsAndStar(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).selectAllFilmsAndStar(map);
	}
	@Override
	public List<FilmComment> selectAllComments(Integer fid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmCommentMapper.class).selectAllComments(fid);
	}
	@Override
	public boolean selectFilmCollection(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(FilmMapper.class).selectFilmCollection(map).size()==0?false:true;
	}

}
