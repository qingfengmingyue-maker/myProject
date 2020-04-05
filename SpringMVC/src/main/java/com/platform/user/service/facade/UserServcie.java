package com.platform.user.service.facade;

import java.util.List;

import com.platform.common.schema.vo.Page;
import com.platform.user.schema.model.User;
import com.platform.user.schema.vo.UserVo;


public interface UserServcie {

	List<User> queryUser(UserVo userVo);
	Page findListByPage(Page page, UserVo userVo);
	void saveUser(User user);
	User findUserByPK(Integer id);
	void deletUserByPK(Integer id);
}
