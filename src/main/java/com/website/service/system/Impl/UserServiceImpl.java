package com.website.service.system.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.website.entity.system.User;
import com.website.mapper.system.UserMapper;
import com.website.service.system.IUserService;
import com.website.utils.Page;

@Service("IUserService")
public class UserServiceImpl implements IUserService {
	@Resource(name = "userMapper")
	private UserMapper userMapper;

	@Override
	public int getCountByAccount(String accountName) {
		// TODO Auto-generated method stub
		return userMapper.getCountByAccount(accountName);
	}

	@Override
	public User getUserByAccountAndPwd(String accountName, String password) {
		// TODO Auto-generated method stub
		return userMapper.getUserByAccountAndPwd(accountName, password);
	}

	@Override
	public List<User> listUser(Page page) {
		// TODO Auto-generated method stub
		return userMapper.listUser(page);
	}

	@Override
	public int findRows() {
		// TODO Auto-generated method stub
		return userMapper.findRows();
	}

}
