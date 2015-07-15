package com.website.mapper.system;
import org.springframework.stereotype.Repository;
import com.website.entity.system.User;
import com.website.mapper.BaseMapper;

@Repository("userMapper")
public interface UserMapper extends BaseMapper {

	
	int getCountByAccount(Integer account);

	
	User getUserByAccountAndPwd(Integer account, String password);
}
