package cn.basefunc.system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.basefunc.system.entity.SysRole;
import cn.basefunc.system.entity.SysUser;
import cn.basefunc.system.service.SysMenuService;
import cn.basefunc.system.service.SysRoleMenuService;
import cn.basefunc.system.service.SysRoleService;
import cn.basefunc.system.util.AppHelper;
import cn.basefunc.system.util.EasyuiTreeNode;
import cn.basefunc.system.util.Result;
import cn.basefunc.system.util.WebFrontHelper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/sys/role")
@SessionAttributes(AppHelper.USER_SESSION_KEY)
public class SysRoleController extends BaseController {
	
	@Resource
	private SysRoleService sysRoleService;
	
	@Resource
	private SysMenuService sysMenuService;
	
	@Resource
	private SysRoleMenuService sysRoleMenuService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<SysRole> listAll() {
		List<SysRole> roles = this.sysRoleService.findAll();
		return roles;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	@ResponseBody
	public Result add(SysRole role) {

		this.sysRoleService.save(role);
		return new Result();
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public Result update(SysRole role) {

		this.sysRoleService.update(role);
		return new Result();
	}
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public Result delete(@RequestParam(value="roleId", required=true) String roleId) {
		this.sysRoleService.delete(roleId);
		return new Result();
	}
	
	@RequestMapping(value="/menu")
	@ResponseBody
	public List<EasyuiTreeNode> menu(@RequestParam(value="roleId", required=true) String roleId) {
		
		List<String> roleMenus = this.sysRoleMenuService.findMenuIdsByRoleId(roleId);
		
		EasyuiTreeNode node = WebFrontHelper.buildTreeForEasyuiTree(this.sysMenuService.findAll(), roleMenus);	
		
		
		return node.getChildren();
	}
	
	@RequestMapping(value="/saveMenu")
	@ResponseBody
	public Result saveMenu(
			@RequestParam(value="roleId", required=true) String roleId, 
			@RequestParam(value="menuId", required=true) String[] menuIds) {
		
		this.sysRoleMenuService.save(roleId, menuIds);		
		return new Result();
	}
	
	// 角色列表，除非超级管理员， 否则没有chao'guan
	@RequestMapping("/listNoRoot")
	@ResponseBody
	public List<SysRole> listNoRoot(
			@ModelAttribute(AppHelper.USER_SESSION_KEY) SysUser user) {

		if (user == null) {
			return null;
		}
		
		List<SysRole> roles = this.sysRoleService.findAll();
		if (! AppHelper.SUPER_ROLE_ID.equals(user.getRoleId())) {
			List<SysRole> noRootRoles = new ArrayList<SysRole>(roles.size()-1);
			for (SysRole role : roles) {
				if (AppHelper.SUPER_ROLE_ID.equals(role.getRoleId())) 
					continue;
				
				noRootRoles.add(role);
			}
			
			return noRootRoles;
		}
		
		return roles;
	}
	
}
