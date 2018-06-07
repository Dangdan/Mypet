package com.mypet.ssm.po;

import java.util.Date;
/**
 * 公告
 * @author Dan
 *
 */
public class Notice {
	/**
	 * 公告id
	 */
    private Long nid;
    /**
	 * 公告标题
	 */
    private String title;
    /**
	 * 公告发布人id
	 */
    private Long userid;
    /**
	 * 公告发布人名字
	 */
    private String username;
    /**
     * 发布人
     */
    private User publishUser;
    public User getPublishUser() {
		return publishUser;
	}

	public void setPublishUser(User publishUser) {
		this.publishUser = publishUser;
	}

	/**
	 * 公告内容
	 */
    private String content;
    /**
	 * 公告创建时间
	 */
    private Date created;
    /**
	 * 公告更新时间
	 */
    private Date updated;
    
    public Long getNid() {
        return nid;
    }

    public void setNid(Long nid) {
        this.nid = nid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }
}