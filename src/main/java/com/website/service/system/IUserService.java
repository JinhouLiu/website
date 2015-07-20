package com.website.service.system;

import java.util.List;

import com.website.entity.system.User;
import com.website.utils.Page;

public interface IUserService {

	/**
	 * 查询用户是否存在
	 * 
	 * @param accountName
	 *            工号
	 * @return 是否存在
	 */

	public int getCountByAccount(String accountName);

	/**
	 * 查询用户名和密码是否正确
	 * 
	 * @param staff
	 *            工号对象
	 * @return 是否正确
	 */
	public User getUserByAccountAndPwd(String accountName, String password);

	/**
	 * 
	 * 展示所有用户
	 * 
	 */
	public List<User> listUser(Page  page);
	
	//查询有多少行数 
		public int findRows();
		

}
