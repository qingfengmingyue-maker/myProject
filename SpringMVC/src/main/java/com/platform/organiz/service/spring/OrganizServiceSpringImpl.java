package com.platform.organiz.service.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.platform.common.schema.vo.Page;
import com.platform.common.spring.IBaseDaoServiceSpringImpl;
import com.platform.organiz.schema.model.Organization;
import com.platform.organiz.schema.model.OrganizationVo;
import com.platform.organiz.service.facade.OrganizService;
import com.platform.user.schema.model.UserMsg;

@Service(value="organizService")
public class OrganizServiceSpringImpl extends IBaseDaoServiceSpringImpl<Organization,String> implements OrganizService {

	@Override
	public void saveOrganizration(Organization organization) throws Exception {
		super.save(organization);
		
	}

	@Override
	public void delOrganization(String orgcode) throws Exception {
		super.deleteById(orgcode);
		
	}

	@Override
	public void updateOrganization(Organization organization) throws Exception {
		super.saveOrUpdate(organization);
		
	}

	@Override
	public Organization findOrganization(String orgcode) throws Exception {
		return super.get(orgcode);
	}

	@Override
	public Page quryOrganizationList(Page page, OrganizationVo organization)
			throws Exception {
		StringBuffer hql = new StringBuffer("");
		int total = 0;
		Map<String,String> map = new HashMap<String,String>();
		String orgName = organization.getOrgName();
		String orgCode = organization.getOrgCode();
		String creditCode = organization.getCreditCode();
		if(StringUtils.isNotBlank(orgName)){
			hql.append(" and orgName=:orgName");
			map.put("orgName", orgName);
		}
		if(StringUtils.isNotBlank(orgCode)){
			hql.append(" and orgCode=:orgCode");
			map.put("orgCode", orgCode);
		}
		if(StringUtils.isNotBlank(creditCode)){
			hql.append(" and creditCode=:creditCode");
			map.put("creditCode", creditCode);
		}
		
		if(StringUtils.isNotBlank(hql.toString())){
			total = super.getCountByHqlCondition(hql.toString(),map);
		}else{
			total = super.getCountByHqlCondition("",map);
		}
		List<Organization> organizations =  super.listByHQL(" from Organization where 1=1 "+ hql.toString(),map,
				(page.getPageNo()-1)*page.getPageSize(), page.getPageSize() );
		return new Page(page.getPageNo(), page.getPageSize(), total,organizations);
	}


}
