package com.platform.common.web;


import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.code.kaptcha.Producer;
import com.platform.common.utils.Utils;

@Controller
@RequestMapping("/validate")
public class ValidateCodeController {

	 @Autowired
	 private Producer captchaProducer;
	    
	
    //生成验证码
    @RequestMapping("/validateCode")
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
	  
	  HttpSession session = request.getSession();
      // 设置清除浏览器缓存
      response.setDateHeader("Expires", 0);
      response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
      response.addHeader("Cache-Control", "post-check=0, pre-check=0");
      response.setHeader("Pragma", "no-cache");
      response.setContentType("image/png");
      // 验证码一分钟内有效
      long expireTime = System.currentTimeMillis() + 60000;
      
      // 将验证码放到session中
      String validateCode = captchaProducer.createText();
      session.setAttribute(Utils.VALIDATE_CODE, Utils.encodeBase64(validateCode));//将加密后的验证码放到session中，确保安全
      session.setAttribute(Utils.EXPIRE_TIME, expireTime);
      
      // 输出验证码图片
      BufferedImage bufferedImage = captchaProducer.createImage(validateCode);
      ServletOutputStream out = response.getOutputStream();
      ImageIO.write(bufferedImage, "png", out);
      out.flush();
      out.close();

 }
    
}
