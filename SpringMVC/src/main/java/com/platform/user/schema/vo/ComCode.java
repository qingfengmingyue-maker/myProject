package com.platform.user.schema.vo;

import java.util.List;

import lombok.Data;
@Data
public class ComCode {
	
	public String province;
	public String province_code;
	public List<City> cities;

}
