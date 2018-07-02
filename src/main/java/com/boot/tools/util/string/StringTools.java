package com.boot.tools.util.string;

import java.util.List;

public class StringTools {

	/**
	 * String 的List按格式转为String
	 * @param list
	 * @param regex 格式，例如","
	 * @return
	 */
	 public static  String list2String(List<String> list,String regex){
		 String str = "";
		 if(list == null) {
			 return str;
		 }
		 for(int i=0;i< list.size() ;i++) {
			 if(i < list.size() -1) {
				 str = str +list.get(i) + regex;
			 }else {
				 str = str +list.get(i);
			 }
		 }
		 return str;
	 }
}
