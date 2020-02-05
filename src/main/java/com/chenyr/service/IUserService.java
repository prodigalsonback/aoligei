package com.chenyr.service;

import com.chenyr.entity.User;

public interface IUserService {
	public User findUserByUsername(String username);
	
	public Integer reg(User user);
}
