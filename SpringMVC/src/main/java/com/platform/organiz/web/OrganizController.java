package com.platform.organiz.web;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.platform.common.schema.vo.Page;
import com.platform.common.schema.vo.Pager;
import com.platform.common.service.RegulationService;
import com.platform.organiz.schema.model.Organization;
import com.platform.organiz.service.facade.OrganizService;
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
	public String createOrganiz(){
		return "/UINewOrgnazi";
	}
	@RequestMapping("/saveOrganiz")
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
		return new ModelAndView("success");
	}
	public Pager<Organization> quryOrganizationList(Organization organization,int pageNo,int start,int length){
		Page<Organization> page=new Page<Organization>(userVo.getCurrentPageNum(), userVo.getiDisplayLength());
		return null;
	}
	
	/*
	   @RequestMapping("/queryUser")
	   @ResponseBody
	   public Pager<UserVo> getData(@RequestBody UserVo userVo) {
	       //适合dataTable的分页信息转换成标准的分页信息
	   	Page<UserVo> page=new Page<UserVo>(userVo.getCurrentPageNum(), userVo.getiDisplayLength());
	   	try {
	   		page=userServcie.findListByPage(page,userVo);
	   		return new Pager<UserVo>().wrapPager(page);
	   	} catch (Exception e) {
	   		e.printStackTrace();
	   	}
	   	return null;
	   }
	   
	   
	   
	   @RequestMapping("/createNewUser")
	    public ModelAndView createNewUser() {
		   ModelAndView mv = new ModelAndView("/UIUserCreate");
		   mv.addObject("title", "用户新增页面");
		   return mv;
	   }
	   
	   
	   @RequestMapping("/saveUser")
	    public String saveUser(User user) {
		   userServcie.saveUser(user);
		   return "redirect: prepareQuery.do";
	   }
	   
	   
	   @RequestMapping("/editUser")
	    public ModelAndView editUser(Integer id) {
		   ModelAndView mv = new ModelAndView("/UIUserCreate");
		   User user = userServcie.findUserByPK(id);
	       mv.addObject("user",user);
	       mv.addObject("title", "用户更改页面");
	       return mv;
	   }
	   
	   
	   
	   @RequestMapping("/deleteUser")
	   public String deleteUser(Integer id) {
		   userServcie.deletUserByPK(id);
		   return "redirect:prepareQuery.do";
	   }*/
	   
	   
	   
}
