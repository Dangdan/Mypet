package com.mypet.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mypet.service.ApplicationService;
import com.mypet.service.PetService;
import com.mypet.ssm.po.Application;
import com.mypet.ssm.po.PageResult;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.User;
import com.mypet.utils.GsonUtil;

/**
 * ApplicationController
 * @author Dan
 *
 */
@Controller
@RequestMapping("/application")
public class ApplicationController {
	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private PetService petService;
	
	@RequestMapping(value="getApplicationListAll",method=RequestMethod.POST)
	@ResponseBody
	public PageResult getApplicationListAll(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows) {
		return applicationService.listApplicationAll(page, rows);		
	}

	@RequestMapping(value="requestPet",method=RequestMethod.POST)
	@ResponseBody
	public String requestPet(HttpSession session,Long pid){
		User user=(User) session.getAttribute("user");
		Pet p=petService.getPetById(pid);
		applicationService.requestPet(user, p);
		return GsonUtil.getSuccessJson();			
	}
	

	@RequestMapping("/delete")
	@ResponseBody
	public String deleteApplication( Application p){
		applicationService.deleteApplication(p.getAid());
		return GsonUtil.getSuccessJson();	
	}
	
	//http://localhost:8080/application/listByStatus?status='申请中'&page=1&rows=20
	@RequestMapping("/listByStatus/{status}")
	@ResponseBody
	public PageResult listApplicationByStatus(@PathVariable String status,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows){
		PageResult pageResult=applicationService.listApplicationByStatus(status,page,rows);
		return pageResult;	
	}
	//发布者点击查看申请列表时，右侧可以有同意或者拒绝操作，这时取button的value
	//http://localhost:8080/application/updateStatus?status='已同意（或者拒绝）'
	@RequestMapping("/updateStatus")
	@ResponseBody
	public String updateStatus(@RequestParam String status,@RequestParam Long aid){
		Application a=applicationService.getApplicationInfoById(aid);
		a.setStatus(status);
		a.setUpdated(new Date());
		applicationService.updateApplication(a);
		return GsonUtil.getSuccessJson();	
	}
}
