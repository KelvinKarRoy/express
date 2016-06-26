package com.xing.whmetro.constants;

/**
 * Http状态码
 * 
 * @author Shawn
 */
public class HttpStatusCode
{
	// 请求已成功，请求所希望的响应头或数据体将随此响应返回。
	public static final String OK = "200";

	// 由于包含语法错误，当前请求无法被服务器理解。
	public static final String BAD_REQUEST = "400";

	// 当前请求需要用户验证。
	public static final String UNAUTHORIZED = "401";

	// 服务器已经理解请求，但是拒绝执行它。
	public static final String FORBIDDEN = "403";

	// 请求失败，请求所希望得到的资源未被在服务器上发现。
	public static final String NOT_FOUND = "404";

	// 请求格式正确，但是由于含有语义错误，无法响应。
	public static final String UNPROCESSABLE_ENTITY = "422";

	// 服务器遇到了一个未曾预料的状况，导致了它无法完成对请求的处理。
	public static final String INTERNAL_SERVER_ERROR = "500";
}