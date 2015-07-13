package com.website.service.system.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.website.entity.system.User;
import com.website.mapper.system.UserMapper;
import com.website.service.system.IUserService;

@Service("IUserService")
public class UserServiceImpl implements IUserService {
	@Resource(name = "userMapper")
	private UserMapper userMapper;

	@Override
	public int getCountByAccount(Integer account) {
		// TODO Auto-generated method stub
		return userMapper.getCountByAccount(account);
	}

	@Override
	public User getUserByAccountAndPwd(Integer account, String password) {
		// TODO Auto-generated method stub
		return userMapper.getUserByAccountAndPwd(account, password);
	}

}
