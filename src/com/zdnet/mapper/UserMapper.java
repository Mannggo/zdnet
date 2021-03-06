package com.zdnet.mapper;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<User> selectUser(Map map);

	void addBookCollection(Map map);

	void addMusicCollection(Map map);

	void addFilmCollection(Map map);

	List<Map> selectBookCollection(Integer uid);

	List<Map> selectFilmCollection(Integer uid);

	List<Map> selectMusicCollection(Integer uid);
}