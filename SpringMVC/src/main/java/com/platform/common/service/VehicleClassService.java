package com.platform.common.service;

import java.util.List;

import com.platform.common.schema.VehicleClass;

public interface VehicleClassService {
	/**
	 * 查询车系列表
	 * @return
	 * @throws Exception
	 */
	List<VehicleClass> findVehicleClassList(String brandName) throws Exception;
	
}
