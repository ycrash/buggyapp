package com.buggyapp.util;

import java.util.Arrays;
import java.util.List;

/**
 * 
 * @author Ram Lakshmanan
 */
public class StringUtil {
	
	public static boolean isValid(String str) {
		
		return (str == null || str.length() == 0) ? Boolean.FALSE : Boolean.TRUE; 
	}
	
	public static boolean isEmptyLine(String line) {
		
		if (!isValid(line)) {
			return Boolean.TRUE;
		}
		
		if(!isValid(line.trim())) {
			return Boolean.TRUE;
		}
		
		return Boolean.FALSE;
	}
	
	public static boolean isEquals(String str1, String str2) {
		
		if (str1 == null && str2 == null) {
			
			return Boolean.TRUE;
		}
		
		if (str1 == null) {
			
			return Boolean.FALSE;
		}
		
		if (str2 == null) {
			
			return Boolean.FALSE;
		}
		
		return str1.equals(str2);		
	}
	
	
    public static List<String> transformToList(String inputString) {
    	
    	if (!isValid(inputString)) {
    		
    		return null;
    	}
    	
    	String[] stringArray = inputString.split("\n");
    	return Arrays.asList(stringArray);
    }

    public static final int NOT_APPLICABLE = -1;

	public static String trim(String str, int charCount) {
		
		if(!StringUtil.isValid(str)) {
			
			return "";
		}
		
		str = (str.length() > charCount) ? str.substring(0, Math.min(str.length(), charCount))+"..." : str;
		
		return str;
	}
	public static boolean isNan(Float value){
		
		if(value.isNaN()){
			return true;
		}
		return false;
	}
}
