package com.website.mapper.system;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.website.entity.system.User;
import com.website.mapper.BaseMapper;
import com.website.utils.Page;

@Repository("userMapper")
public interface UserMapper extends BaseMapper {
	/**
	 * 查询用户是否存在
	 * @param userId		工号
	 * @return				是否存在
	 */
	int getCountByAccount(String accountName);	
	/**
	 * 查询用户名和密码是否正确
	 * @param user		用户对象
	 * @return				是否正确
	 */	
	User getUserByAccountAndPwd(String accountName, String password);	
	/**
	 * 
	 * 获取所有用户
	 * @param PageBounds 传入mybatis-paginator分页参数 
	 * 
	 */
	List<User>  listUser(Page page);
	 
	
	int  findRows();

	

	int delete(@Param(value = "id") Integer id);
}
