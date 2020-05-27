package com.yi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("Auth");
		if (object == null) {// login 안 한 경우
			response.sendRedirect(request.getContextPath() + "/login");
			return false;// controller 진입을 막음
		}
		return true;
	}

}
