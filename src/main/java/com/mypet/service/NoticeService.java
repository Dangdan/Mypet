package com.mypet.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mypet.ssm.mapper.NoticeMapper;
import com.mypet.ssm.po.NoticeExample;
import com.mypet.ssm.po.NoticeExample.Criteria;
import com.mypet.ssm.po.Notice;
import com.mypet.ssm.po.PageResult;

import com.mypet.ssm.po.User;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private UserService userService;

	public Notice publish(Notice n) {
		noticeMapper.insert(n);
		return n;
	}

	public Notice getNoticeById(Long id) {
		return noticeMapper.selectByPrimaryKey(id);
	}

	public int deleteNotice(Long id) {
		return noticeMapper.deleteByPrimaryKey(id);
	}

	public int updateNotice(Notice n) {
		return noticeMapper.updateByPrimaryKey(n);
	}

	public PageResult listPublishNoticeAll(User u ,Integer page, Integer rows) {
		NoticeExample example = new NoticeExample();
		Criteria c = example.createCriteria();
		c.andUsernameEqualTo(u.getUsername());
		PageHelper.startPage(page, rows);
		List<Notice> list=noticeMapper.selectByExample(example);	
		PageResult result=new PageResult();
		result.setRows(list);
		PageInfo<Notice> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		result.setCurrentPage(page);
		result.setRow(pageInfo.getPages());
		return result;
		
	}

	public List<Notice> listNotice() {
		NoticeExample example = new NoticeExample();
		List<Notice> list=noticeMapper.selectByExample(example);
		List<Notice> resultList=new ArrayList<>();
		for (Notice notice : list) {
			User u=userService.getUserByName(notice.getUsername());
			notice.setPublishUser(u);
			resultList.add(notice);
		}
		return resultList;
	}

	public List<Notice> listPublishNotice(User u) {
		NoticeExample example = new NoticeExample();
		Criteria c = example.createCriteria();
		c.andUsernameEqualTo(u.getUsername());
		List<Notice> list = noticeMapper.selectByExample(example);
		return list;
	}

}
