package com.platform.organiz.web;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.platform.common.schema.BaseOrganization;
import com.platform.common.schema.vo.Page;
import com.platform.common.schema.vo.Pager;
import com.platform.common.service.BaseOrganizServcie;
import com.platform.common.service.RegulationService;
import com.platform.organiz.schema.model.Organization;
import com.platform.organiz.schema.model.OrganizationVo;
import com.platform.organiz.service.facade.OrganizService;
@Controller
@RequestMapping("/organiz")
public class OrganizController {
	
	@Autowired
	OrganizService organizService;
	@Autowired
	RegulationService regulationService;
	@Autowired
	BaseOrganizServcie baseOrganizServcie;
	@RequestMapping("/prepareQuery")
	public String prepareQuery(){
		return "/UIOrgnaziQuery";
	}
	@RequestMapping("/createOrganiz")
	public ModelAndView createOrganiz(){
		ModelAndView mv = new ModelAndView("");
		try {
			List<BaseOrganization> baseOrganizationList = baseOrganizServcie.findFirstOrg();
			mv.addObject("baseOrganizationList",baseOrganizationList);
			mv.setViewName("/UINewOrgnazi");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/getSubOrg")
	@ResponseBody
	public List<BaseOrganization> getSubOrg(String upperBaseOrg){
		List<BaseOrganization> baseSubOrgList = null;
		try {
			baseSubOrgList = baseOrganizServcie.findSubOrg(upperBaseOrg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return baseSubOrgList;
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
	@RequestMapping("/editOrganiz")
	public ModelAndView editOrganiz(String orgCode,String busiType){
		ModelAndView mv = new ModelAndView("");
		try {
			Organization organization = organizService.findOrganization(orgCode);
			mv.addObject("organization",organization);
			mv.addObject("busiType", busiType);
			mv.setViewName("/UINewOrgnazi");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/quryOrganizList")
	@ResponseBody
	public Pager<OrganizationVo> quryOrganizList(@RequestBody OrganizationVo organizationVo){
		Page<OrganizationVo> page=new Page<OrganizationVo>(organizationVo.getCurrentPageNum(), organizationVo.getiDisplayLength());
	   	try {
			page=organizService.quryOrganizationList(page,organizationVo);
			return new Pager<OrganizationVo>().wrapPager(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   	return null;
	}
	
}
