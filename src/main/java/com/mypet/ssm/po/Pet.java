package com.mypet.ssm.po;
/**
 * 宠物类
 * @author Dan
 *
 */
public class Pet {
	/**
	 * 宠物id
	 */
    private Long pid;
    /**
	 * 宠物名字
	 */
    private String pname;
    /**
	 * 宠物主人id
	 */
    private Long userid;
    /**
	 * 宠物主人名字
	 */
    private String username;
    /**
     * 宠物主人
     */
    private User owner;
    public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	/**
	 * 宠物年龄
	 */
    private Byte age;
    /**
	 * 宠物类型(猫，狗，兔，仓鼠......)
	 */
    private String ptype;
    /**
	 * 宠物性别
	 */
    private String sex;
    /**
	 * 宠物特征
	 */
    private String characteristic;
    /**
	 * 宠物图片url
	 */
    private String imgurl;
    
    /**
     * 宠物图片url数组
     */
    private String[] imgs;
    public String[] getImgs() {
		return imgs;
	}

	public void setImgs(String[] imgs) {
		this.imgs = imgs;
	}

	public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
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

    public Byte getAge() {
        return age;
    }

    public void setAge(Byte age) {
        this.age = age;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype == null ? null : ptype.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getCharacteristic() {
        return characteristic;
    }

    public void setCharacteristic(String characteristic) {
        this.characteristic = characteristic == null ? null : characteristic.trim();
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }
}