/*================================
	MemberInsertController.java
	- 사용자 정의 컨트롤러 클래스
	- 리스트 출력 액션
	- DAO 객체에 대한 의존성 주입
	- 준비 → setter 메소드 추가
==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// 『implements Controller』  혹은 『extends AbstractController』 
//-- 서블릿에서 HttpServlet  을 상속받은 서블릿 객체 역할 

// ※ Spring 의 『Controller』인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
public class MemberInsertController implements Controller
{

	// 인터페이스 자료형을 취하는 속성 구성
	private IMemberDAO dao;
	
	// setter 구성
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 캐릭터 인코딩 설정
		request.setCharacterEncoding("UTF-8");

		// 이전 페이지로부터 넘어온 데이터 수신
		String name = request.getParameter("name");
		String tel = request.getParameter("telephone");
		
		try
		{
			MemberDTO member = new MemberDTO();
			member.setName(name);
			member.setTelephone(tel);
			
			dao.add(member);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// sendRedirect() → memberlist.do
		//mav.setViewName("/WEB-INF/view/MebmerList.jsp"); 이거 아님
		
		mav.setViewName("redirect:memberlist.do"); // 스프링 리다이렉트.
		
		return mav;
	}



}
