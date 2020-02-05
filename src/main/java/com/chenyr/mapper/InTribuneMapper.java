package com.chenyr.mapper;

import com.chenyr.entity.InnerTribune;

public interface InTribuneMapper {
	/**
	 * 增加回复评论
	 * @return 影响条数
	 */
	Integer addiComments(InnerTribune innerTribunne);
}
