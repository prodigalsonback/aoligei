package com.chenyr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenyr.entity.OutterTribune;



public interface OutTribuneMapper {
	/**
	 * ��������
	 * @return Ӱ������
	 */
	Integer addoComments(OutterTribune outterTribunne);
	/**
	 * ���ݰ��id��ȡ���ۼ���
	 * @return Ӱ������
	 */
	List<OutterTribune> getOutterTribuneList(Integer tid);
	

}





