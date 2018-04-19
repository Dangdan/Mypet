package com.mypet.service.impl;


import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypet.service.UserService;
import com.mypet.ssm.mapper.ApplicationMapper;
import com.mypet.ssm.mapper.PetMapper;
import com.mypet.ssm.mapper.UserMapper;
import com.mypet.ssm.po.Application;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.User;
import com.mypet.ssm.po.UserExample;
import com.mypet.ssm.po.UserExample.Criteria;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ApplicationMapper applicationMapper;
	@Autowired
	private PetMapper petMapper;

	@Override
	public User register(User user) {
		userMapper.insert(user);
		return user;
	}

	@Override
	public boolean login(String username, String password) {
		UserExample example=new UserExample();
		Criteria c= example.createCriteria();
		c.andUsernameEqualTo(username);
		c.andPwdEqualTo(password);
		if(userMapper.selectByExample(example)!=null){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public Application requestPet(Long uid, Pet p) {
		// TODO Auto-generated method stub
		Application application=new Application();
		application.setAid(new Random().nextLong());
		application.setPetname(p.getPname());
		application.setPublishname(userMapper.selectByPrimaryKey(petMapper.selectByPrimaryKey(p.getPid()).getUserid()).getUsername());
		application.setRequestname(userMapper.selectByPrimaryKey(uid).getUsername());
		application.setStatus("申请中");
		application.setCreated(new Date());
		application.setUpdated(new Date());
		applicationMapper.insert(application);
		return application;
		
	}

	@Override
	public int updateUser(User u) {
		// TODO Auto-generated method stub
		int result=userMapper.updateByPrimaryKey(u);
		return result;
	}
}
