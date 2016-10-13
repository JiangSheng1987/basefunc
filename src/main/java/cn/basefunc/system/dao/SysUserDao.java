package cn.basefunc.system.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cn.basefunc.system.entity.SysUser;

public interface SysUserDao {

	void save(SysUser user);
	
	void update(SysUser user);
	
	void delete(String userId);
	
	SysUser findByUserId(String userId);
	
	List<SysUser> findAll();
	
	Page<SysUser> findPage(Pageable pageRequest);
	
	Page<SysUser> findPageByParams(Map<String, Object> params, Pageable pageRequest);
	
	int countByUsername(String username);
	
	void updateRoleNull(String roleId);
	
	void updatePassword(String userId, String password);
	
	SysUser loadUserByUsernameAndPassword(String username, String password);
}
