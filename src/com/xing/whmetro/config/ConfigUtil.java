package com.xing.whmetro.config;

import java.util.HashMap;
import java.util.Map;

/**
 * 支付系统配置文件读取
 * @author wangfucai
 */
public class ConfigUtil {

	private static final Map<String,String> map=new HashMap<String,String>();
	
	// 初始化
	static 
	{
		try 
		{
			ConfigurationManager config = ConfigurationManager.instance();
			map.put("", "");
		} catch (Exception e) {
			throw new RuntimeException("Config error, msg=" + e.getMessage(), e);
		}
	}
	/**
	 * 根据appId获得私有的key
	 * @return
	 */
	public static String getPrimaryKey(String appId)
	{
		return map.get(appId)==null?"":map.get(appId);
	}
}
