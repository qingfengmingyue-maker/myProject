package com.platform.user.service.facade;

import com.platform.user.schema.model.UserMsg;

public interface SaaUserService {

	UserMsg checkLogin(String userName,String passWord);
}
