package com.lnc.ums.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.common.utils.DateUtils;
import com.lnc.ums.user.mapper.UserMapper;
import com.lnc.ums.user.po.UserPo;
import com.lnc.ums.user.service.UserService;

public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	@Override
	public List<UserPo> query(UserPo user) {

		List<UserPo> users = userMapper.query(user);

		for (UserPo po : users) {
			String desc = po.getDesc();
			desc = desc.replaceAll("\r\n", "<br>");
			po.setDesc(desc);
		}

		return users;
	}

	@Override
	public List<UserPo> query(UserPo user, PageBounds pageBounds) {

		List<UserPo> users = userMapper.query(user, pageBounds);

		for (UserPo po : users) {
			String desc = po.getDesc();
			desc = desc.replaceAll("\r\n", "<br>");
			po.setDesc(desc);
		}

		return users;
	}

	@Override
	public UserPo queryById(int id) {

		UserPo user = userMapper.queryById(id);

		String desc = user.getDesc();
		desc = desc.replaceAll("\n", "<br>");
		user.setDesc(desc);

		return user;
	}

	@Override
	public UserPo queryByUsername(String username) {

		UserPo user = userMapper.queryByUsername(username);

		return user;
	}

	@Override
	public void save(UserPo user) {

		// 设置创建时间
		user.setCreateTime(DateUtils.currentTime());

		userMapper.insert(user);
	}

	@Override
	public void delete(int id) {
		userMapper.delete(id);
	}

	@Override
	public void update(UserPo user) {
		userMapper.update(user);
	}

}
