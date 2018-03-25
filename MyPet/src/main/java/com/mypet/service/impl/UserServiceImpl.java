package com.mypet.service.impl;
import java.util.Date;

import com.mypet.service.UserService;
import com.mypet.ssm.mapper.UserMapper;
import com.mypet.ssm.po.User;
public class UserServiceImpl implements UserService {
	private UserMapper userMapper;
	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
		return user;		
	}

}
