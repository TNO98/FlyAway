package com.utils;

import java.time.LocalDate;

public class DateUtil {
	
	public static String getDay(String date) {
		
		LocalDate dt=LocalDate.parse(date);
		
		return dt.getDayOfWeek().toString();
		
	}

}
