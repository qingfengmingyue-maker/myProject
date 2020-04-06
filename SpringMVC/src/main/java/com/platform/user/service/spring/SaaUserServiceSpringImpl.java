package com.platform.user.service.spring;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.platform.common.spring.IBaseDaoServiceSpringImpl;
import com.platform.user.schema.model.UserMsg;
import com.platform.user.service.facade.SaaUserService;

@Service(value="saaUserService")
public class SaaUserServiceSpringImpl extends IBaseDaoServiceSpringImpl<UserMsg,String> implements SaaUserService {

	@Override
	public UserMsg checkLogin(String userName, String passWord) {
		UserMsg userMsg = null;
		String hql = "from UserMsg where userName = :userName and userPwd = :userPwd";
		Map<String, String> map = new HashMap<String,String>();
		map.put("userName", userName);
		map.put("userPwd", passWord);
		userMsg = super.getByHQL(hql, map);
		return userMsg;
	}

}
