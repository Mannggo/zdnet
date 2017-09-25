package com.zdnet.dao;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Admin;

public interface AdminDao {
    int deleteByPrimaryKey(Integer aid);

    int insertSelective(Admin record);
    
    Admin selectByPrimaryKey(Integer aid);
    
    int updateByPrimaryKeySelective(Admin record);

	List<Admin> selectAdmin(Map map);
}
