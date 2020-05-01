package com.platform.user.web;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.AffineTransform;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.platform.common.schema.BaseOrganization;
import com.platform.common.service.BaseOrganizServcie;
import com.platform.common.service.RegulationService;
import com.platform.user.schema.vo.City;
import com.platform.user.schema.vo.ComCode;

@Controller
@RequestMapping("/test")
public class testController {
	@Autowired
	BaseOrganizServcie testServcie;
	@Autowired
	RegulationService regulationService;
	
	@RequestMapping("/getno")
	public void getno(){
		String orgcode = regulationService.getOrgCode("110000", "orgCode");
		System.out.println(orgcode);
		String userCode = regulationService.getOrgCode("110000", "userCode");
		System.out.println(userCode);
		String contractNo = regulationService.getOrgCode("110000", "contractNo");
		System.out.println(contractNo);
	}
	@RequestMapping("/getjson")
	public void getjson() throws UnsupportedEncodingException{
		FileInputStream fis;
		try {
			fis = new FileInputStream("D:/test.txt");
			InputStreamReader isr =  new InputStreamReader(fis,"utf-8");
			BufferedReader br = new BufferedReader(isr);
			StringBuffer sb = new StringBuffer();
			String line ="";
			try {
				while ((line = br.readLine()) != null) {
//					System.out.println(line);
					if(StringUtils.isNotBlank(line)){
						sb.append(line);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(sb.toString());
			List<ComCode> comcodes = JSON.parseArray(sb.toString(), ComCode.class);
			List<BaseOrganization> baseOrganizations = new ArrayList<BaseOrganization>();
			for(ComCode comCode:comcodes){
				BaseOrganization baseOrganization = new BaseOrganization();
				baseOrganization.setCityCode(comCode.getProvince_code());
				baseOrganization.setCityCode(comCode.getProvince());
				baseOrganization.setOrgLevel("1");
				baseOrganization.setUpperCode("000000");
//				baseOrganizations.add(baseOrganization);
				testServcie.saveBaseOrganization(baseOrganization);
				List<City> citys = comCode.getCities();
				for(City city:citys){
					BaseOrganization baseOrganizationnew = new BaseOrganization();
					baseOrganizationnew.setCityCode(city.getCity_code());
					baseOrganizationnew.setCityCode(city.getCity());
					baseOrganizationnew.setOrgLevel("2");
					baseOrganizationnew.setUpperCode(comCode.getProvince_code());
					testServcie.saveBaseOrganization(baseOrganizationnew);
					baseOrganizations.add(baseOrganizationnew);
				}
			}
			System.out.println(baseOrganizations.size());
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	 
  }
