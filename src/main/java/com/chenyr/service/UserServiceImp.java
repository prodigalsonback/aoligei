package com.chenyr.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.chenyr.entity.User;
import com.chenyr.mapper.UserMapper;



@Service("userService")
public class UserServiceImp implements IUserService {
	
	@Autowired
	private UserMapper userMapper;
	@Override
	public User findUserByUsername(String username) {
		
		return userMapper.findUserByUsername(username);
	}

	@Override
	public Integer reg(User user) {
		String pass=user.getPasword();
		//MD5º”√‹
		String str=DigestUtils.md5DigestAsHex(pass.getBytes()).toUpperCase();
		String str2=str+"randomsalt";
		String md5Pass=DigestUtils.md5DigestAsHex(str2.getBytes()).toUpperCase();
		user.setPasword(md5Pass);
		Date now=new Date();
		user.setCreatedUserTime(now);
		user.setRank(0);
		return userMapper.reg(user);
	}

}
