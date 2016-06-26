package com.xing.whmetro.controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xing.whmetro.controller.base.BaseController;

@Controller
public class IndexController extends BaseController {
	
	/**
	 * 主页
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model,HttpServletRequest request)
	{
        return "message/risk";
	}
	/**
	 * 返回主页
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value={"/","/login"},method={RequestMethod.GET,RequestMethod.POST})
	public String login(Model model,HttpServletRequest request)
	{   
         	return "test/input";
	}
	
	@RequestMapping("/index/welcome")
	public String welcome(Model model,HttpServletRequest request)
	{   
          return "welcome";
	}
}