package com.zdnet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdnet.dao.MusicDao;
import com.zdnet.domain.Music;
import com.zdnet.domain.MusicComment;
import com.zdnet.service.MusicService;
@Service
public class MusicServiceImpl implements MusicService {
	@Resource
	MusicDao musicDao;
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.MusicService#selectAllMusics(java.util.Map)
	 */
	public List<Music> selectAllMusics(Map map){
		return musicDao.selectAllMusics(map);
	};

	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.MusicService#insertMusic(com.zdnet.domain.Music)
	 */
	public int insertMusic(Music music){
		return musicDao.insertSelective(music);
	};

	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.MusicService#deleleMusicById(java.lang.Integer)
	 */
	public int deleleMusicById(Integer mid){
		return musicDao.deleteByPrimaryKey(mid);
	};

	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.MusicService#updateMusic(com.zdnet.domain.Music)
	 */
	public int updateMusic(Music music){
		return musicDao.updateByPrimaryKeySelective(music);
	};

	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.MusicService#selectMusic(java.util.Map)
	 */
	public List<Map> selectMusic(Map map){
		return musicDao.selectMusic(map);
	};
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.MusicService#selectCount()
	 */
	public int selectCount(){
		return musicDao.selectCount();
	}

	@Override
	public List<Music> selectAllMusicsAndStar(Map map) {
		// TODO Auto-generated method stub
		return musicDao.selectAllMusicsAndStar(map);
	}

	@Override
	public List<MusicComment> selectAllComments(Integer mid) {
		// TODO Auto-generated method stub
		return musicDao.selectAllComments(mid);
	}

	@Override
	public boolean checkIsCollection(Integer mid, Integer uid) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("uid", uid);
		map.put("mid", mid);
		return musicDao.selectMusicCollection(map);
	};
}
