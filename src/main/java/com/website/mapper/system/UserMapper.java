package com.website.mapper.system;

import org.springframework.stereotype.Repository;
import com.website.entity.system.User;
import com.website.mapper.BaseMapper;

@Repository("userMapper")
public interface UserMapper extends BaseMapper {

	/**
	 * ��ѯ�û��Ƿ����
	 * 
	 * @param account
	 *            �˻���
	 * @return �Ƿ����
	 */
	int getCountByAccount(Integer account);

	/**
	 * ��ѯ�û����������Ƿ���ȷ
	 * 
	 * @param account
	 *            �˻���
	 * @param password
	 *            ����
	 * @return �Ƿ���ȷ
	 */
	User getUserByAccountAndPwd(Integer account, String password);
}
