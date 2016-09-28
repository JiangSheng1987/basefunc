package cn.ffcs.system.dao;

import java.util.List;

import cn.ffcs.system.entity.SysGroup;

public interface SysGroupDao {
	
	void save(SysGroup group);
	
	void delete(String groupId);
	
	void update(SysGroup group);
	
	List<SysGroup> findAll();
	
	SysGroup findById(String groupId);
	
	SysGroup findByGroupName(String groupName);
	
}
