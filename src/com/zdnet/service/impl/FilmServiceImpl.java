package com.zdnet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdnet.dao.FilmDao;
import com.zdnet.domain.Film;
import com.zdnet.domain.FilmComment;
import com.zdnet.service.FilmService;
@Service
public class FilmServiceImpl implements FilmService {
	@Resource
	FilmDao filmDao;
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.FilmService#selectAllFilms()
	 */
	public List<Film> selectAllFilms(Map map) {
		return filmDao.selectAllFilms(map);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.FilmService#insertFilm(com.zdnet.domain.Film)
	 */
	@Override
	public int insertFilm(Film film) {
		// TODO Auto-generated method stub
		return filmDao.insertSelective(film);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.FilmService#deleleFilmById(java.lang.Integer)
	 */
	@Override
	public int deleleFilmById(Integer fid) {
		// TODO Auto-generated method stub
		return filmDao.deleteByPrimaryKey(fid);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.FilmService#updateFilm(com.zdnet.domain.Film)
	 */
	@Override
	public int updateFilm(Film film) {
		// TODO Auto-generated method stub
		return filmDao.updateByPrimaryKeySelective(film);
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.FilmService#selectFilm(java.util.Map)
	 */
	public List<Map> selectFilm(Map map) {
		return filmDao.selectFilm(map);
	}
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return filmDao.selectCount();
	}
	@Override
	public List<Film> selectAllFilmsAndStar(Map map) {
		// TODO Auto-generated method stub
		return filmDao.selectAllFilmsAndStar(map);
	}
	@Override
	public List<FilmComment> selectAllComments(Integer fid) {
		// TODO Auto-generated method stub
		return filmDao.selectAllComments(fid);
	}
	@Override
	public boolean checkIsCollection(Integer fid, Integer uid) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("uid", uid);
		map.put("fid", fid);
		return filmDao.selectFilmCollection(map);
	}
}
