package com.platform.organiz.service.facade;

import com.platform.common.schema.vo.Page;
import com.platform.organiz.schema.model.Organization;



public interface OrganizService {
	void saveOrganizration(Organization organization) throws Exception;
	void delOrganization(String orgcode) throws Exception;
	void updateOrganization(Organization organization) throws Exception;
	Organization findOrganization(String orgcode) throws Exception;
	Page quryOrganizationList(Page page, Organization organization)
			throws Exception;
}
