package com.platform.common.utils;

import sun.misc.BASE64Encoder;

public class Utils {

	
    public  final static String VALIDATE_CODE = "VALIDATE_CODE";

    public final static String EXPIRE_TIME = "EXPIRE_TIME";
    
    
    public static String encodeBase64(String str) {
        sun.misc.BASE64Encoder base64Encode = new BASE64Encoder();
        return base64Encode.encode(str.getBytes());
  }
}
