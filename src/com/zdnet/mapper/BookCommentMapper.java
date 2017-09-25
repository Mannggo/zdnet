package com.zdnet.mapper;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Book;
import com.zdnet.domain.BookComment;

public interface BookCommentMapper {
    int deleteByPrimaryKey(Integer bcid);

    int insert(BookComment record);

    int insertSelective(BookComment record);

    BookComment selectByPrimaryKey(Integer bcid);

    int updateByPrimaryKeySelective(BookComment record);

    int updateByPrimaryKey(BookComment record);

	List<BookComment> selectAllCommentByBid(Integer bid);

}