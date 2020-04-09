package com.platform.common.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.platform.common.schema.BaseOrganization;
import com.platform.common.service.BaseOrganizServcie;
@Service(value="baseOrganizServcie")
public class BaseOrganizServcieSpringImpl extends IBaseDaoServiceSpringImpl<BaseOrganization,String> implements BaseOrganizServcie {


	@Override
	public void saveBaseOrganization(BaseOrganization baseOrganization) {
		super.saveOrUpdate(baseOrganization);
	}

	@Override
	public BaseOrganization findUserByPK(String id) {
		return super.get(id);
	}

	@Override
	public List<BaseOrganization> findFirstOrg() throws Exception {
		String sb = "from BaseOrganization where orgLevel='1'";
		Map<String,String> map = new HashMap<String,String>();
		return super.listByHQL(sb.toString(),map);
	}

	@Override
	public List<BaseOrganization> findSubOrg(String uperOrgCode)
			throws Exception {
		String sb = "from BaseOrganization where orgLevel='2' and upperCode =:upperCode";
		Map<String,String> map = new HashMap<String,String>();
		map.put("upperCode", uperOrgCode);
		return super.listByHQL(sb.toString(),map);
	}

}
