package com.zdnet.service;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Film;
import com.zdnet.domain.FilmComment;

public interface FilmService {

	public List<Film> selectAllFilms(Map map);

	public int insertFilm(Film film);

	public int deleleFilmById(Integer fid);

	public int updateFilm(Film film);

	public List<Map> selectFilm(Map map);
	public int selectCount();

	public List<Film> selectAllFilmsAndStar(Map map);

	public List<FilmComment> selectAllComments(Integer fid);

	public boolean checkIsCollection(Integer fid, Integer uid);
}