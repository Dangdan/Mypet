package com.mypet.controller;

import java.io.IOException;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mypet.service.UserService;
import com.mypet.service.VerifyCodeService;
import com.mypet.ssm.po.User;
import com.mypet.utils.GsonUtil;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private VerifyCodeService verifyCodeService;

	@RequestMapping(value = "userVerifyCode")
	public void getLoginVerifycode(HttpServletResponse response, HttpSession session) throws IOException {
		session.setAttribute("userVerifyCode", verifyCodeService.getVerifyCode(response.getOutputStream()));
	}

	/**
	 * 发布者登录
	 * @param u
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "publishUserlogin", method = RequestMethod.POST)
	@ResponseBody
	public String publicUserlogin(User u, HttpSession session,String verifyCode) {
		verifyCodeService.checkVerifyCode((String) session.getAttribute("userVerifyCode"), verifyCode);
		session.setAttribute("user", userService.login(u));
		return GsonUtil.getSuccessJson();
	}

	/**
	 * 领养者登录
	 * @param u
	 * @param session
	 * @param verifyCode
	 * @return
	 */
	@RequestMapping(value = "requestUserlogin", method = RequestMethod.POST)
	@ResponseBody
	public String requestUserlogin(User u, HttpSession session,String verifyCode) {
		verifyCodeService.checkVerifyCode((String) session.getAttribute("userVerifyCode"), verifyCode);
		session.setAttribute("user", userService.login(u));
		return GsonUtil.getSuccessJson();
	}
	/**
	 * 用户注销
	 * @param u
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "userLogout", method = RequestMethod.GET)
	public String userLogout(HttpSession session){
		if(session == null){
			return "redirect:/index";
		}
		return "redirect:/index";
	}

	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	@ResponseBody
	public String register(User user) {
		userService.register(user);
		return GsonUtil.getSuccessJson();
	}
	
	@RequestMapping(value="getUserByName",method=RequestMethod.POST)
	@ResponseBody
	public User getUserByName(String name){
		return userService.getUserByName(name);			
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String updateUser(User u, HttpSession session) {
		User user=(User) session.getAttribute("user");
		u.setId(user.getId());
		u.setIdentity(user.getIdentity());
		
		userService.updateUser(u);
		User result=userService.getUserByName(u.getUsername());
		session.setAttribute("user", result);
		return GsonUtil.getSuccessJson();
	}

}
