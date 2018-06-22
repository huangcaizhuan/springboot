package com.boot.interceptor.manage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SessionInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws  Exception{
    	
    	if (request.getRequestURI().equals("/boot/manage/login") ||
    			request.getRequestURI().equals("/boot/manage/validateCode") 
        		|| request.getRequestURI().equals("/boot/manage/checkValidateCodeAjax") 
        		|| request.getRequestURI().equals("/boot/manage/loginAjax")){
        	
            return true;
        }
        
         Object obj = request.getSession().getAttribute("loginManager");
         if (obj == null){
             response.sendRedirect("/boot/manage/login");
             return  false;
         }
         return true;
    }

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
		// TODO Auto-generated method stub
		
	}
}
