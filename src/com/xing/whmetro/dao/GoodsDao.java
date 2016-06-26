package com.xing.whmetro.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xing.whmetro.entity.Goods;



/**
 * 这个类和MonitorPointDataDao没啥区别  只是为了分工  不冲突
 */
public interface GoodsDao {

	int insertGoods(Goods goods);

	int selectCountByCode(String code);
	
	int selectCount();
	
	int selectCountByPageAndName(@Param("name") String condition,@Param("offset") int offset,
			@Param("currentPageSize") int currentPageSize);

	int selectCountByPageAndDate(@Param("date") Date condition,@Param("offset") int offset,
			@Param("currentPageSize") int currentPageSize);
	
	List<Goods> selectByPage(@Param("offset")int offset, @Param("currentPageSize")int currentPageSize);

	List<Goods> selectByPageAndName(@Param("name") String condition,@Param("offset") int offset,
			@Param("currentPageSize") int currentPageSize);

	List<Goods> selectByPageAndDate(@Param("date") Date condition,@Param("offset") int offset,
			@Param("currentPageSize") int currentPageSize);

	int deleteGoodsById(Long goodsId);
}
