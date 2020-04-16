package com.platform.user.service.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.platform.common.schema.vo.Page;
import com.platform.common.spring.IBaseDaoServiceSpringImpl;
import com.platform.organiz.schema.model.Organization;
import com.platform.user.schema.model.UserMsg;
import com.platform.user.schema.vo.OrganizationVo;
import com.platform.user.schema.vo.UserMsgVo;
import com.platform.user.service.facade.UserMsgService;
@Service(value="userMsgService")
public class UserMsgServiceSpringImpl extends IBaseDaoServiceSpringImpl<UserMsg,String> implements UserMsgService {

	@Override
	public void saveUserMsg(UserMsg userMsg) {
		super.saveOrUpdate(userMsg);
		
	}

	@Override
	public Page findListByPage(Page page, UserMsgVo userMsgVo) {
		StringBuffer hql = new StringBuffer(" from UserMsg where 1=1 ");
		StringBuffer hql_count = new StringBuffer();
		Map<String,String> map = new HashMap<String,String>();
		if(StringUtils.isNotBlank(userMsgVo.getUserName())) {
			String param = " and userName like :userName";
			hql.append(param);
			hql_count.append(param);
			map.put("userName", userMsgVo.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(userMsgVo.getUserCode())) {
			String param = " and userCode = :userCode";
			hql.append(param);
			hql_count.append(param);
			map.put("userCode", userMsgVo.getUserCode());
		}
		if(StringUtils.isNotBlank(userMsgVo.getTelPhone())) {
			String param = " and telPhone = :telPhone";
			hql.append(param);
			hql_count.append(param);
			map.put("telPhone", userMsgVo.getTelPhone());
		}
		if(StringUtils.isNotBlank(userMsgVo.getOrgCode())) {
			String param = " and orgCode = :orgCode";
			hql.append(param);
			hql_count.append(param);
			map.put("orgCode", userMsgVo.getOrgCode());
		}
		String param = " and postFlag != :postFlag";
		hql.append(param);
		hql_count.append(param);
		map.put("postFlag","0");
		hql.append("  order by operateTime desc");
		int total = super.getCountByHqlCondition(hql_count.toString(), map);
		List<UserMsg> userMsgs =  super.listByHQL(hql.toString(),map,(page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		return new Page(page.getPageNo(), page.getPageSize(), total,userMsgs);
	}

	@Override
	public UserMsg findUserMsgByUserCode(String userCode) {
		return super.get(userCode);
	}

	@Override
	public boolean deleteUserMsgByUserCode(String userCode) {
		return super.deleteById(userCode);
	}

	@Override
	public Page findOrganizationListByPage(Page page, OrganizationVo organizationVo) {
		StringBuffer hql = new StringBuffer(" from Organization where 1=1 ");
		StringBuffer hql_count = new StringBuffer();
		Map<String,String> map = new HashMap<String,String>();
		if(StringUtils.isNotBlank(organizationVo.getOrgName())) {
			String param = " and orgName like :orgName";
			hql.append(param);
			hql_count.append(param);
			map.put("orgName", organizationVo.getOrgName()+"%");
		}
		int total = super.getCountByHqlOtherCondition(Organization.class,hql_count.toString(), map);
		List<Organization> organizations =  super.listByHQLOtherCondition(hql.toString(),map,(page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		return new Page(page.getPageNo(), page.getPageSize(), total,organizations);
	}
}