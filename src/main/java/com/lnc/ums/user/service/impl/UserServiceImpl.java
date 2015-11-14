package com.lnc.ums.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.util.StringUtils;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.common.utils.DateUtils;
import com.lnc.ums.common.utils.MD5;
import com.lnc.ums.user.bean.UserBean;
import com.lnc.ums.user.mapper.UserMapper;
import com.lnc.ums.user.service.UserService;

public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	@Override
	public List<UserBean> query(UserBean user) {

		List<UserBean> users = userMapper.query(user);

		for (UserBean po : users) {
			String desc = po.getDesc();
			desc = desc.replaceAll("\r\n", "<br>");
			po.setDesc(desc);
		}

		return users;
	}

	@Override
	public List<UserBean> query(UserBean user, PageBounds pageBounds) {

		List<UserBean> users = userMapper.query(user, pageBounds);

		for (UserBean po : users) {
			String desc = po.getDesc();
			desc = desc.replaceAll("\r\n", "<br>");
			po.setDesc(desc);
		}

		return users;
	}

	@Override
	public UserBean queryById(int id) {

		UserBean user = userMapper.queryById(id);

		String desc = user.getDesc();
		desc = desc.replaceAll("\n", "<br>");
		user.setDesc(desc);

		return user;
	}

	@Override
	public UserBean queryByUsername(String username) {

		UserBean user = userMapper.queryByUsername(username);

		return user;
	}

	@Override
	public void save(UserBean user) {

		// 使用MD5加密密码
		String password = user.getPassword();
		if (!StringUtils.isEmpty(password)) {
			password = MD5.encode(password);
			user.setPassword(password);
		}

		// 设置创建时间
		user.setCreateTime(DateUtils.currentTime());

		userMapper.insert(user);
	}

	@Override
	public void delete(int id) {
		userMapper.delete(id);
	}

	@Override
	public void update(UserBean user) {

		// 使用MD5加密密码
		String password = user.getPassword();
		if (!StringUtils.isEmpty(password)) {
			password = MD5.encode(password);
			user.setPassword(password);
		}

		userMapper.update(user);
	}

}
