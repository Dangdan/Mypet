package com.mypet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.mypet.service.UserService;
import com.mypet.ssm.po.Application;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.User;
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login/")
	public User login(@PathVariable User user){
		
		return userService.register(user);
	}
	
	@RequestMapping("/update/")
	public int update(@PathVariable User user){
		return userService.updateUser(user);
	}
	
	@RequestMapping("/register/")
	public User register(@PathVariable User user){
		return userService.register(user);
	}
	
	@RequestMapping("/requestPet/")
	public Application register(@PathVariable Long uid,@PathVariable Pet p){
		return userService.requestPet(uid,p);
	}
}
