package com.xing.whmetro.controller.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.whmetro.constants.JsonResult;
import com.xing.whmetro.constants.JsonResultCode;
import com.xing.whmetro.controller.base.BaseController;
import com.xing.whmetro.entity.Goods;
import com.xing.whmetro.service.GoodsService;
import com.xing.whmetro.utils.PageUtil;

@Controller
@RequestMapping("/express")
public class TestController extends BaseController {
	
	@Autowired
	private GoodsService goodsService;
	
	@ResponseBody
	@RequestMapping(value="/add",method={RequestMethod.GET,RequestMethod.POST})
	public Object saveGoods(HttpServletRequest request,HttpServletResponse response)
	{
		String message = this.getNotNull("message", request);
		String name = this.getNotNull("name", request);
		String location = this.getNotNull("location", request);
		String code = this.getNotNull("code", request);
		String startTime = this.getNotNull("startTime", request);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date createTime = new Date();

		if(goodsService.isExistGoodsByCode(code))
		{
			return new JsonResult(JsonResultCode.FAILURE,"二维码不得与数据库里已存在的重复","");
		}
		
		try {
			createTime = sdf.parse(startTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return new JsonResult(JsonResultCode.FAILURE,"日期解析失败","");
			
		}
		
		
		Goods goods = new Goods();
		goods.setCode(code);
		goods.setCreateTime(createTime);
		goods.setLocation(location);
		goods.setMessage(message);
		goods.setName(name);
	
		
		if(!goodsService.addGoods(goods)){
			return new JsonResult(JsonResultCode.FAILURE,"存储失败","");
		}else return new JsonResult(JsonResultCode.SUCCESS,"信息保存成功","");
	}
	
	@RequestMapping(value = "/show", method = { RequestMethod.POST,RequestMethod.GET })
	public String show(HttpServletRequest request,Model model) throws Exception {
		
		int currentPageNum = this.getPageNum(request);
		
		int currentPageSize = this.getPageSize(request);
		
		int totalGoods = goodsService.getCount();
		
		PageUtil paging_vo = new PageUtil(currentPageSize, totalGoods, currentPageNum);
		
		List<Goods> listGoods = goodsService.getGoodsByPage(currentPageNum,currentPageSize); 
		
		paging_vo.setObject(listGoods);
		
		model.addAttribute("paging_vo",paging_vo);
		
		return "test/list";
	}

	@RequestMapping(value = "/search", method = { RequestMethod.POST,RequestMethod.GET })
	public String showBySearch(HttpServletRequest request,Model model) throws Exception {
		
		int currentPageNum = this.getPageNum(request);
		
		int currentPageSize = this.getPageSize(request);
		
		Long conditionType = this.getLong("conditionType", request);
		
		String condition = this.getNotNull("condition", request);
		
		List<Goods> listGoods = new ArrayList<Goods>();
		int totalGoods = 0;
		if(conditionType == 1){
			//名字
			listGoods = goodsService.getGoodsByPageAndName(condition,currentPageNum,currentPageSize);
			
			totalGoods = goodsService.getGoodsCountByPageAndName(condition, currentPageNum, currentPageSize);
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date createTime = new Date();
			
			try {
				createTime = sdf.parse(condition);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			listGoods = goodsService.getGoodsByPageAndDate(createTime,currentPageNum,currentPageSize);
			totalGoods = goodsService.getGoodsCountByPageAndDate(createTime, currentPageNum, currentPageSize);
		}
		
		PageUtil paging_vo = new PageUtil(currentPageSize, totalGoods, currentPageNum);
		
		paging_vo.setObject(listGoods);
		
		model.addAttribute("paging_vo",paging_vo);
		
		return "test/list";
	}
	
	//删除某信息记录
	@ResponseBody
	@RequestMapping(value="/deleteGoods",method={RequestMethod.GET,RequestMethod.POST})
	public Object deleteGoods(HttpServletRequest request,HttpServletResponse response)
	{
		Long goodsId = this.getLong("goodsId", request);
		
		if(!goodsService.removeGoodsById(goodsId)){
			return new JsonResult(JsonResultCode.FAILURE, "出货失败", "");
		}
		
		return new JsonResult(JsonResultCode.SUCCESS, "出货成功", "");
	}
}