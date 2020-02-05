package com.chenyr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenyr.entity.OutterTribune;
import com.chenyr.mapper.OutTribuneMapper;

@Service("outterTribuneService")
public class OutterTribuneServiceImp implements IOutterTribuneService {
	@Autowired
	private OutTribuneMapper outtribuneMapper;
	@Override
	public List<OutterTribune> getOutterTribuneList(Integer tid) {
		return outtribuneMapper.getOutterTribuneList(tid);
	}
	@Override
	public Integer addoComments(OutterTribune outterTribunne) {
		return outtribuneMapper.addoComments(outterTribunne);
	}
	
}
