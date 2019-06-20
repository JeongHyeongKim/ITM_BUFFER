package com.gsitm.meeting.handler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.gsitm.meeting.users.dao.EmployeeDaoImpl;

public class LoginFailureHandler implements AuthenticationFailureHandler 
{
	@Autowired
	private EmployeeDaoImpl dao;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String id = request.getParameter("id");
		System.out.println(id);
		System.out.println(exception.getMessage());
		
		Integer cnt = dao.getLoginFailureCnt(id);
		System.out.println(cnt);
		if(exception.getMessage().equals("User is disabled")) {
			System.out.println("블락된 계정");
			request.getSession().setAttribute("msg", "블락된 계정");
			response.sendRedirect("/meeting");
		}
		
		if(cnt<5)
		{
			System.out.println("cnt5이하");
			cnt = cnt+1;
			dao.addLoginFailureCnt(id,cnt);
			response.sendRedirect("/meeting");
		}
		else
		{
			System.out.println("계정블락");
			dao.resetLoginCnt(id);
			dao.lockAccount(id);
			response.sendRedirect("/meeting");
		}
		
	}

}
