package com.zdnet.mapper;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer aid);

    int insertSelective(Admin record);
    
    Admin selectByPrimaryKey(Integer aid);
    
    int updateByPrimaryKeySelective(Admin record);

    int insert(Admin record);

    int updateByPrimaryKey(Admin record);

	List<Admin> selectAdmin(Map map);
}