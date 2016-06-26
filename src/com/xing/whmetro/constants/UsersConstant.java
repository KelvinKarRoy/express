package com.xing.whmetro.constants;

/**
 * 用户常量
 * 
 * @author wangfucai
 */
public class UsersConstant {
	
	/**
	 * 登录的常量
	 */
	public static final String LOGIN_SESSION_USERS="login_session_user";
	
	/**
	 * 验证码常量
	 */
	public static final String SESSION_SECURITY_CODE = "session_security_code";
	
	/**
	 * 绑定qq时的状态值，防止CSRF攻击
	 */
	public static final String SESSION_QQ_LOGIN_STATE="session_qq_login_state";
	
	/**
	 * AES加密的秘钥
	 */
	public static final String AES_CODE="yu9dauf%%@&^%#(*798u1`2['=03i9u09";
	
	/**
	 * 用户状态,可用
	 */
	public static final int  USER_STATUS_ENABLE = 1;
	/**
	 * 用户状态,禁用
	 */
	public static final int  USER_STATUS_DISABLE = -1;
	
}