package cn.basefunc.system.service;

import java.util.List;

import cn.basefunc.system.entity.SysRole;

public interface SysRoleService {
	
	List<SysRole> findAll();
	
	/**
	 * 保存角色
	 * @param role
	 * @throws IllegalArgumentException 参数非法
	 */
	void save(SysRole role);
	
	/**
	 * 更新角色
	 * @param role
	 * @throws IllegalArgumentException 输入非法
	 */
	void update(SysRole role);
	
	void delete(String roleId);
}
