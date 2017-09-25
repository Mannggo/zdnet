package com.zdnet.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdnet.dao.ActivityDao;
import com.zdnet.domain.Activity;
import com.zdnet.mapper.ActivityMapper;
@Repository
public class ActivityDaoImpl extends SqlSessionDaoSupport implements ActivityDao {
	@Resource
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public int deleteByPrimaryKey(Integer aid) {
		
		return getSqlSession().getMapper(ActivityMapper.class).deleteByPrimaryKey(aid);
	}

	@Override
	public int insert(Activity record) {
		// TODO Auto-generated method stub
		return  getSqlSession().getMapper(ActivityMapper.class).insert(record);
	}

	@Override
	public int insertSelective(Activity record) {
		// TODO Auto-generated method stub
		return  getSqlSession().getMapper(ActivityMapper.class).insertSelective(record);
	}

	@Override
	public Activity selectByPrimaryKey(Integer aid) {
		// TODO Auto-generated method stub
		return  getSqlSession().getMapper(ActivityMapper.class).selectByPrimaryKey(aid);
	}

	@Override
	public int updateByPrimaryKeySelective(Activity record) {
		// TODO Auto-generated method stub
		return  getSqlSession().getMapper(ActivityMapper.class).updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Activity record) {
		// TODO Auto-generated method stub
		return  getSqlSession().getMapper(ActivityMapper.class).updateByPrimaryKey(record);
	}

	@Override
	public List<Map> selectActivity(Map map) {
		// TODO Auto-generated method stub
		return  getSqlSession().getMapper(ActivityMapper.class).selectActivity(map);
	}

	@Override
	public List<Map> selectAllActivities(Map map) {
		// TODO Auto-generated method stub
		return  getSqlSession().getMapper(ActivityMapper.class).selectAllActivities(map);
	}
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(ActivityMapper.class).selectCount();
	}
	@Override
	public int selectCountOfJoin(Integer aid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(ActivityMapper.class).selectCountOfJoin(aid);
	}
	@Override
	public List<Map> checkStatus(Integer aid, Integer uid) {
		// TODO Auto-generated method stub
		Map map =new HashMap();
		map.put("aid", aid);
		map.put("uid", uid);
		
		return getSqlSession().getMapper(ActivityMapper.class).checkStatus(map);
	}
	@Override
	public void joinAct(Map map) {
		// TODO Auto-generated method stub
		getSqlSession().getMapper(ActivityMapper.class).joinAct(map);
	}
	@Override
	public List<Map> selectJoinActivity(Integer uid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(ActivityMapper.class).selectJoinActivity(uid);
	}


}
