package com.zdnet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdnet.dao.AdminDao;
import com.zdnet.domain.Admin;
import com.zdnet.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	AdminDao adminDao;
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.AdminService#checkByAccountAndPsw(java.lang.String, java.lang.String)
	 */
	public String checkByAccountAndPsw(String account,String apassword){
		Map map = new HashMap();
		map.put("account", account);
		List<Admin> list = adminDao.selectAdmin(map);
		if(list.size() == 0){
			return "noexist";
		}
		return list.get(0).getApassword().equals(apassword)?"checktrue":"checkfalse";
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.AdminService#insertAdmin(com.zdnet.domain.Admin)
	 */
	public int insertAdmin(Admin admin){
		return adminDao.insertSelective(admin);
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.AdminService#delAdminByAid(java.lang.Integer)
	 */
	public int delAdminByAid(Integer aid){
		return adminDao.deleteByPrimaryKey(aid);
	}
	
	/* (non-Javadoc)
	 * @see com.zdnet.service.impl.AdminService#updateAdmin(com.zdnet.domain.Admin)
	 */
	public int updateAdmin(Admin admin){
		return adminDao.updateByPrimaryKeySelective(admin);
	}
	
	public List<Admin> selectAdmin(Map map){
		return adminDao.selectAdmin(map);
	}
}
