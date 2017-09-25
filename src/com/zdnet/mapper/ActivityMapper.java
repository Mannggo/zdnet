package com.zdnet.mapper;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Activity;

public interface ActivityMapper {
    int deleteByPrimaryKey(Integer aid);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);

	List<Map> selectActivity(Map map);

	List<Map> selectAllActivities(Map map);

	int selectCount();


	int selectCountOfJoin(Integer aid);

	List<Map> checkStatus(Map map);

	void joinAct(Map map);

	List<Map> selectJoinActivity(Integer uid);
}