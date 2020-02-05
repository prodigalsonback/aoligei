package com.chenyr.mapper;

import com.chenyr.entity.User;

public interface UserMapper {
	/**
	 * 根据用户名查询用户
	 * @return 用户
	 */
	public User findUserByUsername(String username);
	
	/**
	 * 将注册新用户写入数据库
	 * @return 影响的条数
	 */
	public Integer reg(User user);
}
