package cn.ffcs.system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.ffcs.system.entity.SysMenu;
import cn.ffcs.system.entity.SysUser;
import cn.ffcs.system.service.SysMenuService;
import cn.ffcs.system.service.SysRoleMenuService;
import cn.ffcs.system.service.SysUserService;
import cn.ffcs.system.util.AppHelper;
import cn.ffcs.system.util.EasyuiTreeNode;
import cn.ffcs.system.util.Result;
import cn.ffcs.system.util.WebFrontHelper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class AccountController {
	
	private static Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysMenuService sysMenuService;
	@Resource
	private SysRoleMenuService sysRoleMenuService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(HttpSession session, Model model) {
		SysUser user = (SysUser) session.getAttribute(AppHelper.USER_SESSION_KEY);
		
		if (user == null) {			
			return "login";
		}
		
		String roleId = user.getRoleId();
		List<String> roleMenuIds = this.sysRoleMenuService.findMenuIdsByRoleId(roleId);
		
		if (roleMenuIds == null || roleMenuIds.size() == 0) {
			session.invalidate();
			return "grant-tips";
		}
		
//		List<SysMenu> allMenus = this.sysMenuService.findByChildId(roleMenuIds);
		
		List<SysMenu> allMenus = new ArrayList<SysMenu>();
		for (String roleMenuId : roleMenuIds) {
		    allMenus.add(this.sysMenuService.findById(roleMenuId));
		}
		
		EasyuiTreeNode root = WebFrontHelper.buildTreeForEasyuiTree(allMenus);
		
		model.addAttribute("treeJson", new Gson().toJson(root.getChildren()));
		
		return "main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public Result login(
			@RequestParam(value = "username", required=true) String username,
			@RequestParam(value = "password", required=true) String password,
			HttpSession session) {
		
		
		SysUser user = this.sysUserService.loadUserByUsernameAndPassword(username, password);
		
		if (user != null) {
			logger.info("登陆成功：{}", user);
			session.setAttribute(AppHelper.USER_SESSION_KEY, user);
			return new Result();
		} else {
			return new Result("用户名密码不匹配");
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("checkSession")
	@ResponseBody
	public Result checkSession(HttpSession session) {
		
		if (session.getAttribute(AppHelper.USER_SESSION_KEY) != null) {
			return new Result();
		}
		
		return new Result(false);
	}
	
}
