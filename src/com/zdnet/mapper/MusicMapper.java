package com.zdnet.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.zdnet.domain.Music;

public interface MusicMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(Music record);

    int insertSelective(Music record);

    Music selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(Music record);

    int updateByPrimaryKey(Music record);
    
    List<Music> selectAllMusics(Map map);
    List<Map> selectMusic(Map map);
    int selectCount();
    
    int insertFirstComment(Music record);

	List<Music> selectAllMusicsAndStar(Map map);

	List<Map> selectMusicCollection(Map map);
    
}