package cn.ffcs.system.service;

import java.util.List;

import cn.ffcs.system.entity.SysMenu;

public interface SysMenuService {
	
	List<SysMenu> findAll();
	
	/**
	 * 保存菜单项
	 * @param menu
	 * @throws IllegalArgumentException 输入非法
	 */
	void save(SysMenu menu);
	
	/**
	 * 更新菜单项
	 * @param menu
	 * @throws IllegalArgumentException 输入非法
	 */
	void update(SysMenu menu);
	
	void delete(String menuId);
	
	SysMenu findById(String menuId);
}
