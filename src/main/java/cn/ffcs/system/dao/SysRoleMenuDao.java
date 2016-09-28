package cn.ffcs.system.dao;

import java.util.List;

import cn.ffcs.system.entity.SysRoleMenu;

public interface SysRoleMenuDao {
	
	void save(SysRoleMenu srm);
	
	void deleteByRoleId(String roleId);
	
	List<String> findMenuIdByRoleId(String roleId);
	
	void deleteByMenuId(String menuId);
}
