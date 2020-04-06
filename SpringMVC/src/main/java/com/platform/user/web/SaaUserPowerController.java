package com.platform.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.platform.common.utils.Utils;
import com.platform.user.schema.model.UserMsg;
import com.platform.user.service.facade.SaaUserService;

@Controller
@RequestMapping("/saaUserPower")
public class SaaUserPowerController {
	    
	  @Autowired
	  private SaaUserService saaUserService;
	    
	  @RequestMapping(value = "/login", method = RequestMethod.POST,produces="text/html;charset=utf-8")
	  public String login(HttpServletRequest request,  Model model,String userName, String userPwd, String validateCode,HttpSession session) {
	    String currentValidateCode = String.valueOf(request.getSession().getAttribute(Utils.VALIDATE_CODE));
	    if(StringUtils.isNotBlank(currentValidateCode) && "null".equals(currentValidateCode)) {
			 return "/login";
		}
	     if (System.currentTimeMillis() > Long.parseLong(String.valueOf(request.getSession().getAttribute(Utils.EXPIRE_TIME)))) {
	    	 model.addAttribute("message", "验证码已经过期");
	    	 return "/login";
	      }else if (StringUtils.isEmpty(validateCode) || validateCode.length() != 4 ||
	                !Utils.encodeBase64(validateCode).equals(currentValidateCode)) {
	    	  model.addAttribute("message", "验证码错误");
	    	  return "/login";
	      }
	     UserMsg userMsg =  saaUserService.checkLogin(userName, userPwd);
	     if(userMsg !=null) {
	    	session.setAttribute("USER_SESSION",userMsg);
	    	return "redirect: main.do";
	     }else {
	    	 model.addAttribute("message", "用户名或者密码错误!");
	    	 return "/login";
	     }
	   }
       @RequestMapping(value = "/toLogin")
       public String toLogin(){
           return  "/login";
       }
	  
	  @RequestMapping(value = "/main")
	  public String loginSuccess() {
		  return "/innerIndex";
	  }
	  
	  @RequestMapping(value = "/logout")
	  public String logout(HttpSession session){
	    session.invalidate();
	     return "redirect:toLogin";
	  }
}
