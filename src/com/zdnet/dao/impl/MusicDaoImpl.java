package com.zdnet.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdnet.dao.MusicDao;
import com.zdnet.domain.Music;
import com.zdnet.domain.MusicComment;
import com.zdnet.mapper.MusicCommentMapper;
import com.zdnet.mapper.MusicMapper;
@Repository
public class MusicDaoImpl extends SqlSessionDaoSupport implements MusicDao {
	@Override
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public int deleteByPrimaryKey(Integer mid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).deleteByPrimaryKey(mid);
	}

	@Override
	public int insert(Music record) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).insert(record);
	}

	@Override
	public int insertSelective(Music record) {
		// TODO Auto-generated method stub
		getSqlSession().getMapper(MusicMapper.class).insertSelective(record);
		return getSqlSession().getMapper(MusicMapper.class).insertFirstComment(record);
	}

	@Override
	public Music selectByPrimaryKey(Integer mid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).selectByPrimaryKey(mid);
	}

	@Override
	public int updateByPrimaryKeySelective(Music record) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Music record) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).updateByPrimaryKey(record);
	}

	@Override
	public List<Music> selectAllMusics(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).selectAllMusics(map);
	}

	@Override
	public List<Map> selectMusic(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).selectMusic(map);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).selectCount();
	}
	@Override
	public List<Music> selectAllMusicsAndStar(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).selectAllMusicsAndStar(map);
	}
	@Override
	public List<MusicComment> selectAllComments(Integer mid) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicCommentMapper.class).selectAllComments(mid);
	}
	@Override
	public boolean selectMusicCollection(Map map) {
		// TODO Auto-generated method stub
		return getSqlSession().getMapper(MusicMapper.class).selectMusicCollection(map).size()==0?false:true;
	}

}
