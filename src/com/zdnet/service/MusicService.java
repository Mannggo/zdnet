package com.zdnet.service;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Music;
import com.zdnet.domain.MusicComment;

public interface MusicService {

	public List<Music> selectAllMusics(Map map);

	public int insertMusic(Music music);

	public int deleleMusicById(Integer mid);

	public int updateMusic(Music music);

	public List<Map> selectMusic(Map map);

	public int selectCount();

	public List<Music> selectAllMusicsAndStar(Map map);

	public List<MusicComment> selectAllComments(Integer mid);

	public boolean checkIsCollection(Integer mid, Integer uid);

}