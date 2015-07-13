package com.website.service.system;

import com.website.entity.system.User;

public interface IUserService {

	/**
	 * 查询用户是否存在
	 * 
	 * @param account
	 *            账户名
	 * @return 是否存在
	 */

	public int getCountByAccount(Integer account);

	/**
	 * 
	 * 通过用户名和密码登入
	 * 
	 * @param account
	 *            账户名
	 * @param password
	 *            密码
	 * @return
	 */
	public User getUserByAccountAndPwd(Integer account, String password);

}
