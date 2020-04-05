package com.platform.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.platform.common.schema.vo.Page;
import com.platform.common.schema.vo.Pager;
import com.platform.user.schema.model.User;
import com.platform.user.schema.vo.UserVo;
import com.platform.user.service.facade.UserServcie;
@Controller
@RequestMapping("/user")
public class UserController {
       
	  @Autowired
	  UserServcie userServcie;
	   @RequestMapping("/prepareQuery")
	    public String prepareQuery() {
	       return "/UIUserQuery";
	   }
	   
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
	   }
	   
	   
	   
}
