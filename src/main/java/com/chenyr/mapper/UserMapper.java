package com.chenyr.mapper;

import com.chenyr.entity.User;

public interface UserMapper {
	/**
	 * �����û�����ѯ�û�
	 * @return �û�
	 */
	public User findUserByUsername(String username);
	
	/**
	 * ��ע�����û�д�����ݿ�
	 * @return Ӱ�������
	 */
	public Integer reg(User user);
}
