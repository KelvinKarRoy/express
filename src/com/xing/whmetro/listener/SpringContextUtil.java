package com.xing.whmetro.listener;

import org.springframework.context.ApplicationContext;

/**
 * @ClassName: SpringContextUtil
 * @Description: SpringContextUtil 工具类
 * @author wangfucai
 * @date 2015年9月24日 下午5:30:50
 * @version 1.0
 */

public class SpringContextUtil
{

	private static ApplicationContext context = null;

	public static ApplicationContext getContext()
	{
		return context;
	}

	public static void setContext(ApplicationContext context)
	{
		SpringContextUtil.context = context;
	}

	/**
	 * 根据beanId获得对象
	 * 
	 * @param beanId
	 *            beanID
	 * @return 返回配置的对象
	 */
	public static Object getBean(String beanId)
	{
		return context.getBean(beanId);
	}
}
