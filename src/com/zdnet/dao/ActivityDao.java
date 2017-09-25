package com.zdnet.dao;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Activity;

public interface ActivityDao {
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

		List<Map> checkStatus(Integer aid, Integer uid);

		void joinAct(Map map);

		List<Map> selectJoinActivity(Integer uid);

}
