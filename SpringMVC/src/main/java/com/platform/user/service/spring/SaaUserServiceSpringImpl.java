package com.platform.user.service.spring;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.platform.common.service.SaaUserService;
import com.platform.common.spring.IBaseDaoServiceSpringImpl;
import com.platform.user.schema.model.User;

@Service(value="saaUserService")
public class SaaUserServiceSpringImpl extends IBaseDaoServiceSpringImpl<User,Integer> implements SaaUserService {

	@Override
	public User checkLogin(String userName, String passWord) {
		User user = null;
		String hql = "from User where userName = :userName and passWord = :passWord";
		Map<String, String> map = new HashMap<String,String>();
		map.put("userName", userName);
		map.put("passWord", passWord);
		user = super.getByHQL(hql, map);
		return user;
	}

}
