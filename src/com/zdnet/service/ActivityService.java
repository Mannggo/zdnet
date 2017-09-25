package com.zdnet.service;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Activity;

public interface ActivityService {

	public List<Map> selectAllActivities(Map map);

	public List<Map> selectActivity(Map map);

	public int insertActivity(Activity record);

	public List<Map> selectNoPassActivities();

	public int deleteActivityByAid(Integer aid);

	public int selectCount();

	public int updateActivity(Activity activity);

	public int selectCountOfJoin(Integer aid);

	public boolean checkStatus(Integer aid, Integer uid);

	public void joinAct(Integer aid, Integer uid);

	public List<Map> selectJoinActivity(Integer uid);




}