package com.chenyr.service;

import java.util.List;

import com.chenyr.entity.OutterTribune;

public interface IOutterTribuneService {
	List<OutterTribune> getOutterTribuneList(Integer tid);
	
	Integer addoComments(OutterTribune outterTribunne);
}
