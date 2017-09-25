package com.zdnet.service;

import java.util.List;
import java.util.Map;

import com.zdnet.domain.Admin;

public interface AdminService {

	public String checkByAccountAndPsw(String aaccount, String apassword);

	public int insertAdmin(Admin admin);

	public int delAdminByAid(Integer aid);

	public int updateAdmin(Admin admin);
	
	public List<Admin> selectAdmin(Map map);
}