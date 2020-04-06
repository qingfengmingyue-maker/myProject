package com.platform.common.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.platform.common.schema.BaseOrganization;
import com.platform.common.service.BaseOrganizServcie;
import com.platform.common.spring.IBaseDaoServiceSpringImpl;
@Service(value="baseOrganizServcie")
public class BaseOrganizServcieSpringImpl extends IBaseDaoServiceSpringImpl<BaseOrganization,Integer> implements BaseOrganizServcie {


	@Override
	public void saveBaseOrganization(BaseOrganization baseOrganization) {
		super.saveOrUpdate(baseOrganization);
	}

	@Override
	public BaseOrganization findUserByPK(String id) {
		StringBuffer sb = new StringBuffer("from BaseOrganization where 1=1");
		sb.append(" and citycode = :citycode");
		Map<String,String> map = new HashMap<String,String>();
		map.put("citycode", "1");
		List<BaseOrganization> BaseOrganizations = super.listByHQL(sb.toString(),map);
		System.out.println(11);
		return null;
	}

}
