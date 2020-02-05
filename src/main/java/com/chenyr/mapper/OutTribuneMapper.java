package com.chenyr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenyr.entity.OutterTribune;



public interface OutTribuneMapper {
	/**
	 * 增加评论
	 * @return 影响条数
	 */
	Integer addoComments(OutterTribune outterTribunne);
	/**
	 * 根据板块id获取评论集合
	 * @return 影响条数
	 */
	List<OutterTribune> getOutterTribuneList(Integer tid);
	

}





