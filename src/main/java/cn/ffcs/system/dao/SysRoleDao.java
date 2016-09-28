package cn.ffcs.system.dao;

import java.util.List;

import cn.ffcs.system.entity.SysRole;

public interface SysRoleDao {
	
	List<SysRole> findAll();
	
	void save(SysRole role);
	
	void update(SysRole role);
	
	void delete(String roleId);
	
}
