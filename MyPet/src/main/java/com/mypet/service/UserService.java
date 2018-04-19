package com.mypet.service;

import com.mypet.ssm.po.Application;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.User;

public interface UserService {
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	User register(User user);
	/**
	 * 登录
	 * @param username
	 * @param password
	 */
	boolean login(String username,String password);
	/**
	 * 用户信息修改
	 * @param userId
	 */
	int updateUser(User u);
	/**
	 * 申请领养宠物
	 * @param uid
	 * @param p
	 */
	Application requestPet(Long uid,Pet p);
	
	
}
