package com.zdnet.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdnet.dao.UserDao;
import com.zdnet.domain.User;
import com.zdnet.mapper.UserMapper;
@Repository
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public int deleteByPrimaryKey(Integer uid) {
		getSqlSession().getMapper(UserMapper.class).deleteByPrimaryKey(uid);
		return 0;
	}

	public int insert(User record) {
		getSqlSession().getMapper(UserMapper.class).insert(record);
		return 0;
	}

	public int insertSelective(User record) {
		getSqlSession().getMapper(UserMapper.class).insertSelective(record);
		return 0;
	}

	public User selectByPrimaryKey(Integer uid) {
		return getSqlSession().getMapper(UserMapper.class).selectByPrimaryKey(uid);
		
	}

	public int updateByPrimaryKeySelective(User record) {
		getSqlSession().getMapper(UserMapper.class).updateByPrimaryKeySelective(record);
		return 0;
	}

	public int updateByPrimaryKey(User record) {
		getSqlSession().getMapper(UserMapper.class).updateByPrimaryKey(record);
		return 0;
	}
	@Override
	public List<User> selectUser(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(UserMapper.class).selectUser(map);
	}
	@Override
	public void addBookCollection(Map map) {
		// TODO Auto-generated method stub
		getSqlSession().getMapper(UserMapper.class).addBookCollection(map);
	}
	@Override
	public void addFilmCollection(Map map) {
		// TODO Auto-generated method stub
		getSqlSession().getMapper(UserMapper.class).addFilmCollection(map);
		
	}
	@Override
	public void addMusicCollection(Map map) {
		// TODO Auto-generated method stub
		getSqlSession().getMapper(UserMapper.class).addMusicCollection(map);
		
	}
	@Override
	public List<Map> selectBookCollection(Integer uid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(UserMapper.class).selectBookCollection(uid);
	}
	@Override
	public List<Map> selectFilmCollection(Integer uid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(UserMapper.class).selectFilmCollection(uid);
	}
	@Override
	public List<Map> selectMusicCollection(Integer uid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(UserMapper.class).selectMusicCollection(uid);
	}

}
