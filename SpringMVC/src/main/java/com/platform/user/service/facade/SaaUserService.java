package com.platform.user.service.facade;

import com.platform.user.schema.model.User;

public interface SaaUserService {

	User checkLogin(String userName,String passWord);
}
