package com.platform.common.service;

import java.util.List;

import com.platform.common.schema.BaseOrganization;


public interface BaseOrganizServcie {

	void saveBaseOrganization(BaseOrganization baseOrganization);
	BaseOrganization findUserByPK(String id) ;
	/**
	 * 查询省级机构
	 * @return
	 * @throws Exception
	 */
	List<BaseOrganization> findFirstOrg() throws Exception;
	/**
	 * 查询市级机构
	 * @return
	 * @throws Exception
	 */
	List<BaseOrganization> findSubOrg(String uperOrgCode) throws Exception;
}
