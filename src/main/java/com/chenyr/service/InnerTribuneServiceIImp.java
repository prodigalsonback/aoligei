package com.chenyr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenyr.entity.InnerTribune;
import com.chenyr.mapper.InTribuneMapper;

@Service("innerTribuneService")
public class InnerTribuneServiceIImp implements IInnerTribuneService {
	
	@Autowired
	private InTribuneMapper intribuneMapper;
	@Override
	public Integer addiComments(InnerTribune innerTribune) {
		
		return intribuneMapper.addiComments(innerTribune);
	}

}
