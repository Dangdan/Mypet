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
import com.mypet.service.NoticeService;
import com.mypet.ssm.po.Notice;
import com.mypet.ssm.po.PageResult;
import com.mypet.ssm.po.User;
import com.mypet.utils.GsonUtil;
import com.mypet.utils.IDUtils;

/**
 * PetController
 * @author Dan
 *
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("/{nid}")
	@ResponseBody
	public Notice getPetById(Long nid) {
		return noticeService.getNoticeById(nid);
	}
	
	
	@RequestMapping("/add")
	public String publishNotice(Notice n,HttpSession session){
		User u=(User) session.getAttribute("user");
		n.setUserid(u.getId());
		n.setUsername(u.getUsername());
		n.setNid(IDUtils.genId());
		n.setCreated(new Date());
		n.setUpdated(new Date());
		noticeService.publish(n);
		return "redirect:/publishUser";	
	}
	@RequestMapping("/update")
	public String updateNotice(@PathVariable Notice n){
		noticeService.updateNotice(n);
		return GsonUtil.getSuccessJson();	
	}
	@RequestMapping("/delete")
	public String delete(@PathVariable Notice n){
		noticeService.deleteNotice(n.getNid());
		return GsonUtil.getSuccessJson();	
	}
}
