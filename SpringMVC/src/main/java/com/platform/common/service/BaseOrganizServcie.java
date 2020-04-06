package com.platform.common.service;

import com.platform.common.schema.BaseOrganization;


public interface BaseOrganizServcie {

	void saveBaseOrganization(BaseOrganization baseOrganization);
	BaseOrganization findUserByPK(String id);
}
