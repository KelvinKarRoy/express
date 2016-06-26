package com.xing.whmetro.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xing.whmetro.dao.GoodsDao;
import com.xing.whmetro.entity.Goods;
import com.xing.whmetro.service.GoodsService;

/**
 * 评论图片的Service实现
 * 
 * @author KelvinKarRoy
 * 
 */
@Service(value = "GoodsService")
public class GoodsServiceImpl implements GoodsService
{
	@Autowired
	private GoodsDao goodsDao;
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsServiceImpl.class);

	@Override
	public boolean addGoods(Goods goods) {
		int result=0;
		try
		{
			result = goodsDao.insertGoods(goods);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][newGoods]goods: "+ goods+ "-"+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return result>0?true:false;
	}

	@Override
	public boolean isExistGoodsByCode(String code) {
		int result=0;
		try
		{
			result = goodsDao.selectCountByCode(code);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][isExistGoodsByCode]code: "+ code+ "-"+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return result>0?true:false;
	}

	@Override
	public int getCount() {
		int result=0;
		try
		{
			result = goodsDao.selectCount();
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][getCount]code: "+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return result;
	}

	@Override
	public List<Goods> getGoodsByPage(int currentPageNum, int currentPageSize) {
		List<Goods> goodsList= new ArrayList<Goods>();
		try
		{
			int offset = currentPageNum>0?(currentPageNum-1)*currentPageSize:0;
			goodsList = goodsDao.selectByPage(offset,currentPageSize);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][getGoodsByPage]currentPageNum: "+currentPageNum+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return goodsList;
	}

	@Override
	public List<Goods> getGoodsByPageAndName(String condition,
			int currentPageNum, int currentPageSize) {
		List<Goods> goodsList= new ArrayList<Goods>();
		try
		{
			int offset = currentPageNum>0?(currentPageNum-1)*currentPageSize:0;
			goodsList = goodsDao.selectByPageAndName(condition,offset,currentPageSize);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][getGoodsByPageAndName]condition: "+condition+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return goodsList;
	}

	@Override
	public List<Goods> getGoodsByPageAndDate(Date condition,
			int currentPageNum, int currentPageSize) {
		List<Goods> goodsList= new ArrayList<Goods>();
		try
		{
			int offset = currentPageNum>0?(currentPageNum-1)*currentPageSize:0;
			goodsList = goodsDao.selectByPageAndDate(condition,offset,currentPageSize);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][getGoodsByPageAndDate]condition: "+condition+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return goodsList;
	}

	@Override
	public int getGoodsCountByPageAndName(String condition, int currentPageNum,
			int currentPageSize) {
		int result=0;
		try
		{
			int offset = currentPageNum>0?(currentPageNum-1)*currentPageSize:0;
			result = goodsDao.selectCountByPageAndName(condition, offset, currentPageSize);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][getGoodsCountByPageAndName]code: "+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return result;
	}

	@Override
	public int getGoodsCountByPageAndDate(Date condition, int currentPageNum,
			int currentPageSize) {
		int result=0;
		try
		{
			int offset = currentPageNum>0?(currentPageNum-1)*currentPageSize:0;
			result = goodsDao.selectCountByPageAndDate(condition, offset, currentPageSize);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][getGoodsCountByPageAndDate]code: "+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return result;
	}

	@Override
	public boolean removeGoodsById(Long goodsId) {
		int result=0;
		try
		{
			result = goodsDao.deleteGoodsById(goodsId);
		}catch(Exception ex)
		{	
			logger.error("[GroupsServiceImpl][removeGoodsById]goodsId: "+ goodsId+ "-"+ex.getLocalizedMessage()+":"+ex.getMessage(),ex.getCause());
		}
		return result>0?true:false;
	}
	
	

	
}
