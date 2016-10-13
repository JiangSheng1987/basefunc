package cn.basefunc.system.service;

import java.util.List;

import cn.basefunc.system.entity.SysRoleMenu;

public interface SysRoleMenuService {
	
	void save(SysRoleMenu srm);
	
	void save(String roleId, String menuId);
	
	void save(String roleId, String[] menuIds);
	
	List<String> findMenuIdsByRoleId(String roleId);
	
}
