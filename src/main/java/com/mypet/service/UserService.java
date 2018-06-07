package com.mypet.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mypet.exception.ValidateException;
import com.mypet.ssm.mapper.UserMapper;
import com.mypet.ssm.po.User;
import com.mypet.ssm.po.UserExample;
import com.mypet.ssm.po.UserExample.Criteria;
import com.mypet.utils.IDUtils;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	@Transactional
	public User register(User user) {
		// userMapper.
		if (StringUtils.isBlank(user.getUsername())) {
			throw new ValidateException("用户名不能为空");
		}
		if (StringUtils.isBlank(user.getPwd())) {
			throw new ValidateException("密码不能为空");
		}
		if (!"领养者".equals(user.getIdentity()) && !"发布者".equals(user.getIdentity())) {
			throw new ValidateException("角色错误");
		}
		if (!"男".equals(user.getSex()) && !"女".equals(user.getSex())) {
			throw new ValidateException("性别错误");
		}
		if (user.getAge() < 0 || user.getAge() > 150) {
			throw new ValidateException("年龄不合法");
		}
		if (StringUtils.isBlank(user.getAddress())) {
			throw new ValidateException("地址不能为空");
		}
		if (StringUtils.isBlank(user.getPhone())) {
			throw new ValidateException("电话不能为空");
		}
		if (StringUtils.isBlank(user.getEmail())) {
			throw new ValidateException("邮箱不能为空");
		}
		if (!user.getEmail()
				.matches("^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$")) {
			throw new ValidateException("邮箱格式不正确");
		}
		if (!user.getPhone().matches("^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$")) {
			throw new ValidateException("手机号码格式不正确");
		}
		if (isUsernameExist(user.getUsername())) {
			throw new ValidateException("用户名已存在");
		}
		if (isEmailExist(user.getEmail())) {
			throw new ValidateException("邮箱已存在");
		}
		if (isPhoneExist(user.getPhone())) {
			throw new ValidateException("电话号码已存在");
		}
		user.setId(IDUtils.genId());
		user.setCreated(new Date());
		user.setUpdated(user.getCreated());
		userMapper.insert(user);
		return user;
	}

	private boolean isEmailExist(String email) {
		UserExample example = new UserExample();
		Criteria c = example.createCriteria();
		c.andEmailEqualTo(email);
		List<User> users = userMapper.selectByExample(example);
		return users != null && users.size() > 0;
	}

	private boolean isPhoneExist(String phone) {
		UserExample example = new UserExample();
		Criteria c = example.createCriteria();
		c.andPhoneEqualTo(phone);
		List<User> users = userMapper.selectByExample(example);
		return users != null && users.size() > 0;
	}

	private boolean isUsernameExist(String username) {
		UserExample example = new UserExample();
		Criteria c = example.createCriteria();
		c.andUsernameEqualTo(username);
		List<User> users = userMapper.selectByExample(example);
		return users != null && users.size() > 0;
	}

	public User login(User user) {
		UserExample example = new UserExample();
		Criteria c = example.createCriteria();
		c.andUsernameEqualTo(user.getUsername());
		c.andPwdEqualTo(user.getPwd());
		List<User> users = userMapper.selectByExample(example);
		if (users == null || users.size() == 0 || !users.get(0).getIdentity().equals(user.getIdentity())) {
			throw new ValidateException("帐号密码错误");
		}
		return users.get(0);
	}

	
	

	/**
	 * 更新user信息
	 * @param u
	 * @return
	 */
	public int updateUser(User u) {
		// TODO Auto-generated method stub
		u.setCreated(new Date());
		u.setUpdated(new Date());
		int result = userMapper.updateByPrimaryKey(u);
		return result;
	}

	public User getUserByName(String name) {
		UserExample example = new UserExample();
		Criteria c = example.createCriteria();
		c.andUsernameEqualTo(name);
		// TODO Auto-generated method stub
		List<User> u = userMapper.selectByExample(example);
		if (u.size() > 0 && u != null) {
			User user = u.get(0);
			return user;
		} else {
			return null;
		}

	}
}
