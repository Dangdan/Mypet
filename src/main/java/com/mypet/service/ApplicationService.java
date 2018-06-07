package com.mypet.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mypet.ssm.mapper.ApplicationMapper;
import com.mypet.ssm.po.Application;
import com.mypet.ssm.po.ApplicationExample;
import com.mypet.ssm.po.ApplicationExample.Criteria;
import com.mypet.utils.IDUtils;
import com.mypet.ssm.po.PageResult;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.User;

@Service
public class ApplicationService {

	@Autowired
	private ApplicationMapper applicationMapper;

	@Autowired
	private UserService userService;

	@Autowired
	private PetService petService;

	public int addApplication(Application a) {

		return applicationMapper.insert(a);
	}

	public int deleteApplication(Long id) {
		return applicationMapper.deleteByPrimaryKey(id);
	}

	public int updateApplication(Application a) {
		return applicationMapper.updateByPrimaryKey(a);
	}

	public Application getApplicationInfoById(Long aid) {
		return applicationMapper.selectByPrimaryKey(aid);
	}

	public PageResult listApplicationAll(Integer page, Integer rows) {
		ApplicationExample example = new ApplicationExample();
		PageHelper.startPage(page, rows);
		List<Application> list = applicationMapper.selectByExample(example);
		PageResult result = new PageResult();
		result.setRows(list);
		PageInfo<Application> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	public PageResult listApplicationByStatus(String status, int page, int rows) {
		ApplicationExample example = new ApplicationExample();
		Criteria c = example.createCriteria();
		c.andStatusEqualTo(status);
		PageHelper.startPage(page, 10);
		List<Application> list = applicationMapper.selectByExample(example);
		PageResult result = new PageResult();
		result.setRows(list);
		PageInfo<Application> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	public List<Application> listPublish(User u) {
		ApplicationExample example = new ApplicationExample();
		Criteria c = example.createCriteria();
		c.andStatusNotEqualTo("已拒绝");

		List<Application> list = applicationMapper.selectByExample(example);
		List<Application> listResult = new ArrayList<>();

		for (Application application : list) {
			User requestUser = userService.getUserByName(application.getRequestname());
			User publishUser = userService.getUserByName(application.getPublishname());
			Pet requestPet = petService.getPetByName(application.getPetname());
			application.setPublishUser(publishUser);
			application.setRequestUser(requestUser);
			application.setRequestPet(requestPet);
			if (application.getPublishname().equals(u.getUsername())) {
				listResult.add(application);
			}
		}
		return listResult;
	}

	public List<Application> listRequest(User u) {
		ApplicationExample example = new ApplicationExample();
		Criteria c = example.createCriteria();
		c.andStatusNotEqualTo("已同意");
		List<Application> list = applicationMapper.selectByExample(example);
		List<Application> listResult = new ArrayList<>();

		for (Application application : list) {
			User requestUser = userService.getUserByName(application.getRequestname());
			User publishUser = userService.getUserByName(application.getPublishname());
			Pet requestPet = petService.getPetByName(application.getPetname());
			application.setPublishUser(publishUser);
			application.setRequestUser(requestUser);
			application.setRequestPet(requestPet);
			if (application.getRequestname().equals(u.getUsername())) {
				listResult.add(application);
			}
		}
		return listResult;
	}

	public List<Application> listApplication() {
		ApplicationExample example = new ApplicationExample();
		List<Application> list = applicationMapper.selectByExample(example);
		List<Application> listResult = new ArrayList<>();

		for (Application application : list) {
			User requestUser = userService.getUserByName(application.getRequestname());
			User publishUser = userService.getUserByName(application.getPublishname());
			Pet requestPet = petService.getPetByName(application.getPetname());
			application.setPublishUser(publishUser);
			application.setRequestUser(requestUser);
			application.setRequestPet(requestPet);
			listResult.add(application);
		}
		return listResult;
	}

	/**
	 * 申请领养宠物
	 * 
	 * @param user
	 * @param p
	 * @return
	 */
	public Application requestPet(User user, Pet p) {
		// TODO Auto-generated method stub

		Application application = new Application();
		ApplicationExample example = new ApplicationExample();
		Criteria c = example.createCriteria();
		c.andPetnameEqualTo(p.getPname());
		c.andRequestnameEqualTo(user.getUsername());
		if (applicationMapper.selectByExample(example) == null||
				applicationMapper.selectByExample(example).size()==0) {
			application.setAid(IDUtils.genId());
			application.setPetname(p.getPname());
			application.setPublishname(p.getUsername());
			application.setRequestname(user.getUsername());
			application.setStatus("申请中");
			application.setCreated(new Date());
			application.setUpdated(new Date());
			applicationMapper.insert(application);
			return application;
		} else {
			return null;
		}
	}

}
