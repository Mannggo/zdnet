package com.zdnet.dao;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Film;
import com.zdnet.domain.FilmComment;

public interface FilmDao {
	int deleteByPrimaryKey(Integer fid);

    int insert(Film record);

    int insertSelective(Film record);

    Film selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Film record);

    int updateByPrimaryKey(Film record);

	List<Film> selectAllFilms(Map map);

	List<Map> selectFilm(Map map);
	
	int selectCount();

	List<Film> selectAllFilmsAndStar(Map map);

	List<FilmComment> selectAllComments(Integer fid);

	boolean selectFilmCollection(Map map);
}
