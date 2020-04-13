package com.platform.common.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.platform.common.schema.VehicleClass;
import com.platform.common.service.VehicleClassService;

@Service(value="vehicleclassservice")
public class VehicleClassServiceSpringImpl extends IBaseDaoServiceSpringImpl<VehicleClass,String> implements VehicleClassService {

	@Override
	public List<VehicleClass> findVehicleClassList(String brandName) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		StringBuffer hql = new StringBuffer(" from VehicleClass where 1=1 ");
		if(StringUtils.isNotBlank(brandName)){
			hql.append(" and brandName=:brandName");
			map.put("brandName", brandName);
		}
		List<VehicleClass> vehicleClasslist = super.listByHQL(hql.toString(),map);
		return vehicleClasslist;
	}

}
