package com.xing.whmetro.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/***
 * 强制不要页面缓存
 * 
 * @author Administrator
 */
public class ForceNoCacheFilter implements Filter
{
	private static final Logger logger = LoggerFactory.getLogger(ForceNoCacheFilter.class);

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException
	{

		logger.info("[ForceNoCacheFilter] start......");

		HttpServletResponse response = (HttpServletResponse) resp;
		HttpServletRequest request = (HttpServletRequest) req;

		String url = request.getRequestURI();

		if (StringUtils.isNotBlank(url) && url.indexOf("api") != -1)
		{
			logger.info("[ForceNoCacheFilter][移动端请求]api......");
			// 确定请求是走的移动端.
			filterChain.doFilter(req, resp);
			return;
		} else
		{
			logger.info("[ForceNoCacheFilter][web端请求]......");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", -1);
			filterChain.doFilter(req, resp);
			return;
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException
	{
		logger.info("[ForceNoCacheFilter] init........");
	}

	@Override
	public void destroy()
	{
		logger.info("[ForceNoCacheFilter] destroy......");
	}
}