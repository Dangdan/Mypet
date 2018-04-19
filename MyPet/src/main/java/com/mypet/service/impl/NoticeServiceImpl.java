package com.mypet.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypet.service.NoticeService;
import com.mypet.ssm.mapper.NoticeMapper;
import com.mypet.ssm.po.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public Notice publish(Notice n) {
		noticeMapper.insert(n);
		return n;
	}

	@Override
	public Notice getNoticeById(Long id) {
		return noticeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteNotice(Long id) {
		return noticeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeMapper.updateByPrimaryKey(n);
	}

}
