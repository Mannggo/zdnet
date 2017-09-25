package com.zdnet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.enterprise.inject.New;

import org.springframework.stereotype.Service;

import com.zdnet.dao.ActivityDao;
import com.zdnet.domain.Activity;
import com.zdnet.service.ActivityService;
@Service
public class ActivityServiceImpl implements ActivityService{
	@Resource
	ActivityDao activityDao;
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.ActivityService#selectAllActivities()
	 */
	public List<Map> selectAllActivities(Map map){
		return activityDao.selectAllActivities(map);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.ActivityService#selectActivity(java.util.Map)
	 */
	public List<Map> selectActivity(Map map){
		return activityDao.selectActivity(map);
	}
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.ActivityService#insertActivity(com.zdnet.domain.Activity)
	 */
	public int insertActivity(Activity record){
		return activityDao.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.ActivityService#selectNoPassActivities()
	 */
	public List<Map> selectNoPassActivities(){
		Map map = new HashMap();
		map.put("aispass", "0");
		return activityDao.selectActivity(map);
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.ActivityService#deleteActivityByAid(java.lang.Integer)
	 */
	public int deleteActivityByAid(Integer aid){
		return activityDao.deleteByPrimaryKey(aid);
	}
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return activityDao.selectCount();
	}
	@Override
	public int updateActivity(Activity activity) {
		// TODO Auto-generated method stub
		return activityDao.updateByPrimaryKeySelective(activity);
	}
	@Override
	public int selectCountOfJoin(Integer aid) {
		// TODO Auto-generated method stub
		return activityDao.selectCountOfJoin(aid);
	}
	@Override
	public boolean checkStatus(Integer aid, Integer uid) {
		// TODO Auto-generated method stub
		
		return activityDao.checkStatus(aid,uid).size()==0 ?true:false;
	}
	@Override
	public void joinAct(Integer aid, Integer uid) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("aid", aid);
		map.put("uid", uid);
		activityDao.joinAct(map);
	}
	@Override
	public List<Map> selectJoinActivity(Integer uid) {
		// TODO Auto-generated method stub
		return activityDao.selectJoinActivity(uid);
	}
	
	


	
}
