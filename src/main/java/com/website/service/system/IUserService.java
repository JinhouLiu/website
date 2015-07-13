package com.website.service.system;

import com.website.entity.system.User;

public interface IUserService {

	/**
	 * ��ѯ�û��Ƿ����
	 * 
	 * @param account
	 *            �˻���
	 * @return �Ƿ����
	 */

	public int getCountByAccount(Integer account);

	/**
	 * 
	 * ͨ���û������������
	 * 
	 * @param account
	 *            �˻���
	 * @param password
	 *            ����
	 * @return
	 */
	public User getUserByAccountAndPwd(Integer account, String password);

}
