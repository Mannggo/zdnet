package com.zdnet.mapper;

import java.util.List;

import com.zdnet.domain.MusicComment;

public interface MusicCommentMapper {
    int deleteByPrimaryKey(Integer mcid);

    int insert(MusicComment record);

    int insertSelective(MusicComment record);

    MusicComment selectByPrimaryKey(Integer mcid);

    int updateByPrimaryKeySelective(MusicComment record);

    int updateByPrimaryKey(MusicComment record);

	List<MusicComment> selectAllComments(Integer mid);
}