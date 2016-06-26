package com.xing.whmetro.service;

import java.util.Date;
import java.util.List;

import com.xing.whmetro.entity.Goods;

public interface GoodsService {

	public boolean addGoods(Goods goods);

	public boolean isExistGoodsByCode(String code);
	
	public int getCount();

	public int getGoodsCountByPageAndName(String condition,
			int currentPageNum, int currentPageSize);

	public int getGoodsCountByPageAndDate(Date condition,
			int currentPageNum, int currentPageSize);
	
	public List<Goods> getGoodsByPage(int currentPageNum, int currentPageSize);

	public List<Goods> getGoodsByPageAndName(String condition,
			int currentPageNum, int currentPageSize);

	public List<Goods> getGoodsByPageAndDate(Date condition,
			int currentPageNum, int currentPageSize);

	public boolean removeGoodsById(Long goodsId);
	
	
}
