package com.platform.user.service.facade;
import java.util.Map;

import com.platform.common.schema.vo.Page;
import com.platform.user.schema.model.UserMsg;
import com.platform.user.schema.vo.OrganizationVo;
import com.platform.user.schema.vo.UserMsgVo;

public interface UserMsgService {

	void saveUserMsg(UserMsg userMsg);
	Page findListByPage(Page page, UserMsgVo userMsgVo);
	UserMsg findUserMsgByUserCode(String userCode);
	boolean deleteUserMsgByUserCode(String userCode);
	Page findOrganizationListByPage(Page page, OrganizationVo organizationVo);
    int updateUserMsgPassWd(String passWord,UserMsg userMsg) ;
}
