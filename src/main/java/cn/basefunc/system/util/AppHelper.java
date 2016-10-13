package cn.basefunc.system.util;

public class AppHelper {
	
	/**
	 * 系统用户默认密码
	 */
	public final static String DEFAULT_USER_PASSWORD = "123456";
	
	/**
	 * 用户会话的键
	 */
	public final static String USER_SESSION_KEY = "currentUser";
	
	/**
	 * 超级管理员角色的ID
	 */
	public final static String SUPER_ROLE_ID = "root";
	public final static String USER_CARD_PASSWORD="123456";
	
	
	/**
	 * 将密码加密
	 * @param passwordSource
	 * @return
	 */
	public static String encryptPassword(String passwordSource) {
		return EncryptUtils.encryptByMD5(passwordSource);
	}
}
