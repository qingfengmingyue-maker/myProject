package com.platform.common.service;


public interface RegulationService {
	/**
	 * 生成机构代码
	 * groupno 6位机构代码
	 * codeType 单号类型
	 * @return
	 */
	String getOrgCode(String groupno,String codeType);

}
