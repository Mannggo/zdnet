package com.zdnet.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdnet.dao.AdminDao;
import com.zdnet.domain.Admin;
import com.zdnet.mapper.AdminMapper;
@Repository
public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {
	
	@Override
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public int deleteByPrimaryKey(Integer aid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(AdminMapper.class).deleteByPrimaryKey(aid);
	}

	@Override
	public int insertSelective(Admin record) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(AdminMapper.class).insertSelective(record);
	}

	@Override
	public Admin selectByPrimaryKey(Integer aid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(AdminMapper.class).selectByPrimaryKey(aid);
	}

	@Override
	public int updateByPrimaryKeySelective(Admin record) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(AdminMapper.class).updateByPrimaryKeySelective(record);
	}
	@Override
	public List<Admin> selectAdmin(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(AdminMapper.class).selectAdmin(map);
	}

}
