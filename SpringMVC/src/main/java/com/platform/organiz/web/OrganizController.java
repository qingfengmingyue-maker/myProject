package com.platform.organiz.web;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.platform.common.schema.vo.Page;
import com.platform.common.schema.vo.PageVo;
import com.platform.common.schema.vo.Pager;
import com.platform.common.service.RegulationService;
import com.platform.organiz.schema.model.Organization;
import com.platform.organiz.service.facade.OrganizService;
import com.platform.user.schema.model.User;
import com.platform.user.schema.vo.UserVo;
@Controller
@RequestMapping("/organiz")
public class OrganizController {
	
	@Autowired
	OrganizService organizService;
	@Autowired
	RegulationService regulationService;
	@RequestMapping("/prepareQuery")
	public String prepareQuery(){
		return "/UIOrgnaziQuery";
	}
	@RequestMapping("/createOrganiz")
	public String createOrganiz(Organization organization){
		return "/UINewOrgnazi";
	}
	@RequestMapping("/saveOrganiz")
	@ResponseBody
	public ModelAndView saveOrganiz(Organization organization){
		try {
			String cityCode = organization.getCityCode();
			if(StringUtils.isBlank(organization.getOrgCode())){
				String orgCode = regulationService.getOrgCode(cityCode, "orgnaiz");
				organization.setOrgCode(orgCode);
			}
			organization.setOperateTime(new Date());
			organizService.updateOrganization(organization);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:prepareQuery.do");
	}
	@RequestMapping("/quryOrganizList")
	@ResponseBody
	public Pager<Organization> quryOrganizList(Organization organization,PageVo pageVo){
		int pageNo=1;
		int pageSize=10;
		if(pageVo.getiDisplayStart() != 0){
			pageNo = pageVo.getiDisplayStart();
		}
		if(pageVo.getiDisplayLength() != 0){
			pageSize = pageVo.getiDisplayLength();
		}
		Page<Organization> page=new Page<Organization>(pageNo, pageSize);
		try {
	   		page=organizService.quryOrganizationList(page,organization,pageNo,pageSize);
	   		return new Pager<Organization>().wrapPager(page);
	   	} catch (Exception e) {
	   		e.printStackTrace();
	   	}
	   	return null;
	}
	@RequestMapping("/editOrganiz")
	public ModelAndView editOrganiz(String orgCode){
		ModelAndView mv = new ModelAndView("");
		try {
			Organization organization = organizService.findOrganization(orgCode);
			mv.addObject("organization",organization);
			mv.setViewName("/UINewOrgnazi");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/delOrganiz")
	public String delOrganiz(String orgCode){
		try {
			organizService.delOrganization(orgCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "redirect:prepareQuery.do";
	}
}
