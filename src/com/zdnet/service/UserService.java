package com.zdnet.service;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.User;

public interface UserService {
	User selectByPrimaryKey(Integer uid);

	List<User> selectUser(Map map);

	int insertUser(User user);

	void updateUser(User user);

	void addBookCollection(Map map);
	void addFilmCollection(Map map);
	void addMusicCollection(Map map);



	public List<Map> selectBookCollection(Integer uid);
	public List<Map> selectFilmCollection(Integer uid);
	public List<Map> selectMusicCollection(Integer uid);
}
