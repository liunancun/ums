package com.lnc.ums.user.service;

import java.util.List;

import com.lnc.ums.user.po.UserPo;

public interface UserService {

	List<UserPo> query(UserPo user);

	UserPo queryById(int id);

	UserPo queryByUsername(String username);

	void save(UserPo user);

	void delete(int id);

	void update(UserPo user);

}
