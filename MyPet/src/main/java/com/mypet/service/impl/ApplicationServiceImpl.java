package com.mypet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypet.service.ApplicationService;
import com.mypet.ssm.mapper.ApplicationMapper;
import com.mypet.ssm.po.Application;
import com.mypet.ssm.po.ApplicationExample;
import com.mypet.ssm.po.ApplicationExample.Criteria;

@Service
public class ApplicationServiceImpl implements ApplicationService {
	
	@Autowired
	private ApplicationMapper applicationMapper;
	
	

	@Override
	public int addApplication(Application a) {
		return applicationMapper.insert(a);
	}

	@Override
	public int deleteApplication(Long id) {
		return applicationMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateApplication(Application a) {
		return applicationMapper.updateByPrimaryKey(a);
	}

	@Override
	public Application getApplicationInfoById(Long aid) {
		return applicationMapper.selectByPrimaryKey(aid);
	}

	@Override
	public List<Application> getApplicationInfoByStatus(String status) {
		ApplicationExample example =new ApplicationExample();
		Criteria c=example.createCriteria();
		c.andStatusEqualTo(status);
		return applicationMapper.selectByExample(example);
	}

}
