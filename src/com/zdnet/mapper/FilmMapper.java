package com.zdnet.mapper;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Book;
import com.zdnet.domain.Film;
import com.zdnet.domain.FilmComment;

public interface FilmMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(Film record);

    int insertSelective(Film record);

    Film selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Film record);

    int updateByPrimaryKey(Film record);

	List<Film> selectAllFilms(Map map);

	List<Map> selectFilm(Map map);
	
	int selectCount();
	
	int insertFirstComment(Film record);

	List<Film> selectAllFilmsAndStar(Map map);

	List<Map> selectFilmCollection(Map map);

}