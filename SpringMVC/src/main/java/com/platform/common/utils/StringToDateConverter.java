package com.platform.common.utils;

import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.convert.converter.Converter;

public class StringToDateConverter  implements Converter<String, Date> {



	private static final Logger logger = LoggerFactory
			.getLogger(StringToDateConverter.class);
	/**
	 * 默认日期格式
	 */
	private static final String[] parsePatterns = new String[] {
			"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss",
			"yyyy-MM-dd HH:mm", "yyyy-MM-dd HH", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm",
			"yyyy/MM/dd HH", "yyyy-MM-dd HH:mm:ss.SSS"
	// 这里可以增加更多的日期格式，用得多的放在前面
	};

	public Date convert(String str) {
		if (str == null || str.trim().equals("")) { return null;};
		try {
			return DateUtils.parseDate(str, parsePatterns);
		} catch (ParseException e) {
			logger.warn(e.getMessage(), e);
		}
		return null;
	}


}
