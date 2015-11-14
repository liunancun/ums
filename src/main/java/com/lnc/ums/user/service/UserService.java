package com.lnc.ums.user.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.user.bean.UserBean;

public interface UserService {

	List<UserBean> query(UserBean user);

	List<UserBean> query(UserBean user, PageBounds pageBounds);

	UserBean queryById(int id);

	UserBean queryByUsername(String username);

	void save(UserBean user);

	void delete(int id);

	void update(UserBean user);

}
