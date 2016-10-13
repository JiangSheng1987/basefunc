package cn.basefunc.system.dao;

import java.util.List;

import cn.basefunc.system.entity.SysMenu;

public interface SysMenuDao {
	
	List<SysMenu> findAll();
	
	void save(SysMenu menu);
	
	void update(SysMenu menu);
	
	void delete(String menuId);
	
	SysMenu findById(String menuId);
	
}
