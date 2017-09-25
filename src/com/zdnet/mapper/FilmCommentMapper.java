package com.zdnet.mapper;

import java.util.List;

import com.zdnet.domain.FilmComment;

public interface FilmCommentMapper {
    int deleteByPrimaryKey(Integer fcid);

    int insert(FilmComment record);

    int insertSelective(FilmComment record);

    FilmComment selectByPrimaryKey(Integer fcid);

    int updateByPrimaryKeySelective(FilmComment record);

    int updateByPrimaryKey(FilmComment record);

	List<FilmComment> selectAllComments(Integer fid);
}