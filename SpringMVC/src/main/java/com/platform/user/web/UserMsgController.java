package com.platform.user.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userMsg")
public class UserMsgController {

	    @RequestMapping("/userMsgList")
	    public String prepareQuery() {
	       return "/UIUserMsgList";
	   }
	    
	    @RequestMapping("/createUserMsg")
	    public String createUserMsg() {
	       return "/UIUserMsgOperate";
	   }
	    
}
