package com.platform.user.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.platform.common.schema.vo.Page;
import com.platform.common.schema.vo.Pager;
import com.platform.common.service.RegulationService;
import com.platform.organiz.schema.model.Organization;
import com.platform.user.schema.model.UserMsg;
import com.platform.user.schema.vo.OrganizationVo;
import com.platform.user.schema.vo.UserMsgVo;
import com.platform.user.schema.vo.UserVo;
import com.platform.user.service.facade.UserMsgService;

@Controller
@RequestMapping("/userMsg")
public class UserMsgController {
        
	    @Autowired
	    UserMsgService userMsgService;
	    
	    @Autowired
		RegulationService regulationService;
	    @RequestMapping("/userMsgList")
	    public String userMsgList() {
	       return "/UIUserMsgList";
	    }
	    
	    @RequestMapping("/createUserMsg")
	    public ModelAndView createUserMsg() {
	       ModelAndView mv = new ModelAndView("/UIUserMsgOperate");
	       mv.addObject("message", "用户新增页面");
	       return mv;
	   }
	    
	    @RequestMapping("/saveUserMsg")
	    public void saveUserMsg(UserMsg userMsg,HttpServletResponse response) {
	        response.setHeader("Content-Type", "text/html;charset=UTF-8");//这句话是解决乱码的
	    	String msg = "alert( '修改成功' );location.href='userMsgList.do'";
	    	try {
	    	  if(StringUtils.isBlank(userMsg.getUserCode())) {
	    		  String userCode = regulationService.getOrgCode("110000", "userCode");
	    		   userMsg.setUserCode(userCode);
	    		  msg ="alert( '保存成功' );location.href='userMsgList.do'";
	    	    }
	    	    userMsgService.saveUserMsg(userMsg);
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>" + msg + "</script>");
				writer.flush();
				writer.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch (Exception e) {
					e.printStackTrace();
		    } 
	   }
	    
	    @RequestMapping("/deleteUserMsgByUserCode")
	    public void deleteUserMsgByUserCode(String userCode,HttpServletResponse response) {
	    	boolean flag = userMsgService.deleteUserMsgByUserCode(userCode);
	    	response.setHeader("Content-Type", "text/html;charset=UTF-8");//这句话是解决乱码的
	    	String msg = "删除失败";
	    	if(flag) {
	    		 msg = "删除成功";
	    	}
	    	try {
				PrintWriter writer = response.getWriter();
				writer.print(msg);
				writer.flush();
				writer.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
	   }
	    
	    @RequestMapping("/findUserMsgByUserCode")
	    public ModelAndView findUserMsgByUserCode(String userCode,String editType) {
	    	 ModelAndView mv = new ModelAndView("/UIUserMsgOperate");
	    	 UserMsg  userMsg = userMsgService.findUserMsgByUserCode(userCode);
	    	 if("view".equals(editType)) {
	    		 mv.addObject("message", "用户浏览页面");
	    		 mv.addObject("editType", "view");
	    	 }else {
	    		 mv.addObject("message", "用户更改页面");
	    	 }
	    	 mv.addObject("userMsg",userMsg);
	    	 return mv;
	   }
	    
	   
	    @RequestMapping("/queryUserMsg")
	    @ResponseBody
		public Pager<UserMsgVo> getData(@RequestBody UserMsgVo userMsgVo) {
		       //适合dataTable的分页信息转换成标准的分页信息
		Page<UserMsgVo> page=new Page<UserMsgVo>(userMsgVo.getCurrentPageNum(), userMsgVo.getiDisplayLength());
		 try {
		   	   page=userMsgService.findListByPage(page,userMsgVo);
		   		return new Pager<UserMsgVo>().wrapPager(page);
		   	} catch (Exception e) {
		   		e.printStackTrace();
		   	}
		   	return null;
		 }
	    
	    /**
	     * @describe:查询机构名称
	     * @param userCode
	     * @param editType
	     * @return
	     */
	    @RequestMapping("/queryOrganization")
	    @ResponseBody
	    public Pager<OrganizationVo> queryOrganization(@RequestBody OrganizationVo organizationVo) {
		       //适合dataTable的分页信息转换成标准的分页信息
		Page<OrganizationVo> page=new Page<OrganizationVo>(organizationVo.getCurrentPageNum(), organizationVo.getiDisplayLength());
		 try {
		   	   page=userMsgService.findOrganizationListByPage(page,organizationVo);
		   		return new Pager<OrganizationVo>().wrapPager(page);
		   	} catch (Exception e) {
		   		e.printStackTrace();
		   	}
		   	return null;
		 }
	    
	    
	    @RequestMapping("/prepareOrganization")
	    public ModelAndView prepareOrganization(String orgName) {
	       ModelAndView mv = new ModelAndView("/UIPrepareOrganization");
		   mv.addObject("orgName", orgName);
		   return mv;
	    }
}