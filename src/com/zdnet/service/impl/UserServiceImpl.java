package com.zdnet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdnet.dao.UserDao;
import com.zdnet.domain.User;
import com.zdnet.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserDao userDao;
	@Override
	public User selectByPrimaryKey(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.selectByPrimaryKey(uid);
	}
	@Override
	public List<User> selectUser(Map map) {
		// TODO Auto-generated method stub
		return userDao.selectUser(map);
	}
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return userDao.insertSelective(user);
	}
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.updateByPrimaryKeySelective(user);
	}
	@Override
	public void addBookCollection(Map map) {
		// TODO Auto-generated method stub
		userDao.addBookCollection(map);
	}
	@Override
	public void addFilmCollection(Map map) {
		// TODO Auto-generated method stub
		userDao.addFilmCollection(map);
		
	}
	@Override
	public void addMusicCollection(Map map) {
		// TODO Auto-generated method stub
		userDao.addMusicCollection(map);
		
	}
	@Override
	public List<Map> selectBookCollection(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.selectBookCollection(uid);
	}
	@Override
	public List<Map> selectFilmCollection(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.selectFilmCollection(uid);
	}
	@Override
	public List<Map> selectMusicCollection(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.selectMusicCollection(uid);
	}
	
}
