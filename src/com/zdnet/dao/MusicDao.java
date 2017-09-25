package com.zdnet.dao;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Music;
import com.zdnet.domain.MusicComment;

public interface MusicDao {
	int deleteByPrimaryKey(Integer mid);

    int insert(Music record);

    int insertSelective(Music record);

    Music selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(Music record);

    int updateByPrimaryKey(Music record);
    
    List<Music> selectAllMusics(Map map);
    List<Map> selectMusic(Map map);
    int selectCount();

	List<Music> selectAllMusicsAndStar(Map map);

	List<MusicComment> selectAllComments(Integer mid);

	boolean selectMusicCollection(Map map);
}
