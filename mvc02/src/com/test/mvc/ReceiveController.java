/*==============================================
	ReceiveController.java
	- 사용자 정의 컨트롤러
================================================*/
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ReceiveController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mov = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		
		mov.addObject("userName", userName);
		
		mov.setViewName("/WEB-INF/view/Receive.jsp");
		
		return mov;
	}
	
}
