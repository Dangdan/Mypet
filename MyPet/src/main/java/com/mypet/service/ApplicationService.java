package com.mypet.service;

import java.util.List;

import com.mypet.ssm.po.Application;

/**
 * 宠物领养申请记录
 * @author Dan
 *
 */
public interface ApplicationService {
	/**
	 * 新增申请记录
	 * @param a
	 * @return
	 */
	int addApplication(Application a);
	/**
	 * 修改申请记录
	 * @param id
	 * @return
	 */
	int deleteApplication(Long id);
	
	/**
	 * 更新申请记录
	 * @param a
	 * @return
	 */
	int updateApplication(Application a);
	/**
	 * 根据id查询申请表信息
	 * @param aid
	 * @return
	 */
	Application getApplicationInfoById(Long aid);
	/**
	 * 根据状态查询申请表
	 * @param status
	 * @return
	 */
	List<Application> getApplicationInfoByStatus(String status);
	
	

}
