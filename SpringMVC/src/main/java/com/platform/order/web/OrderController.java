package com.platform.order.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/order")
public class OrderController {

    @RequestMapping("/orderList")
    public String userMsgList() {
       return "/UIOrderList";
    }
    
    @RequestMapping("/createNewOrder")
    public ModelAndView createNewUser() {
	   ModelAndView mv = new ModelAndView("/UIOrderOperate");
	   mv.addObject("title", "新增合同");
	   return mv;
   }
}
