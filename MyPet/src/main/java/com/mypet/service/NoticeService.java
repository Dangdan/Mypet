package com.mypet.service;

import com.mypet.ssm.po.Notice;
import com.mypet.ssm.po.User;

/**
 * 公告接口
 * @author Dan
 *
 */
public interface NoticeService {
	
	Notice publish(Notice n);
	Notice getNoticeById(Long id);
	int deleteNotice(Long id);
	int updateNotice(Notice n);

}
