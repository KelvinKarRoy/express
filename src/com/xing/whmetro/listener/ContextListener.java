package com.xing.whmetro.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * @ClassName: CtmsContextListener
 * @Description: ApplicationContext 设置到 SpringContextUtil
 * @author wangfucai
 * @date 2015年9月24日 下午5:30:12
 * @version 1.0
 */
public class ContextListener extends ContextLoaderListener
{

	@Override
	public void contextInitialized(ServletContextEvent event)
	{
		super.contextInitialized(event);
		// 把 ApplicationContext 设置到 SpringContextUtil
		ServletContext context = event.getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
		SpringContextUtil.setContext(ctx);
	}
}