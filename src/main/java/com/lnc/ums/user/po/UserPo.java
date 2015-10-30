package com.lnc.ums.user.po;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserPo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;

	private String username;

	private String password;

	private boolean admin;

	private Timestamp createTime;

	private String desc;

	private String usernamelike;

	private Timestamp startTime;

	private Timestamp endTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getUsernamelike() {
		return usernamelike;
	}

	public void setUsernamelike(String usernamelike) {
		this.usernamelike = usernamelike;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "UserPo [id=" + id + ", username=" + username + ", password=" + password + ", admin=" + admin
				+ ", createTime=" + createTime + ", desc=" + desc + "]";
	}

}
