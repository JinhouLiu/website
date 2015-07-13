package com.website.mapper.system;

import org.springframework.stereotype.Repository;
import com.website.entity.system.User;
import com.website.mapper.BaseMapper;

@Repository("userMapper")
public interface UserMapper extends BaseMapper {

	/**
	 * 查询用户是否存在
	 * 
	 * @param account
	 *            账户名
	 * @return 是否存在
	 */
	int getCountByAccount(Integer account);

	/**
	 * 查询用户名和密码是否正确
	 * 
	 * @param account
	 *            账户名
	 * @param password
	 *            密码
	 * @return 是否正确
	 */
	User getUserByAccountAndPwd(Integer account, String password);
}
