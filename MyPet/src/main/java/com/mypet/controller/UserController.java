package com.mypet.controller;

import java.util.Date;

import com.mypet.service.impl.UserServiceImpl;
import com.mypet.ssm.po.User;

public class UserController {
	UserServiceImpl userServiceImpl =new UserServiceImpl();
	public boolean addUser(String[] args) {
		User user=new User();
		user.setId(1234L);
		user.setUsername("党丹丹");
		user.setPwd("qwqwfew");
		user.setIdentity("领养者");
		user.setSex("女");
		user.setAge((byte) 21);
		user.setAddress("南京市");
		user.setPhone("15829082105");
		user.setEmail("xupt_ddd@163.com");
		user.setCreated(new Date());
		user.setUpdated(new Date());
		System.out.println("接收到前台的数据");
		System.out.println("新建用户...");
		//userServiceImpl.createUser(user);
		System.out.println("用户已新建入库");
		return true;
	}
	
	
}
