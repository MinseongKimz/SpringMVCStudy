/*==============================
 * RegionDeleteController
  - 사용자 정의 컨트롤러 클래스
 ==============================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 의 [Controller] 인터페이스를 구현하는 방법을 통해
//	 사용자 정의 컨트롤러 클래스를 구성한다.
public class RegionDeleteController implements Controller
{
	private IRegionDAO dao;
	
	
	public void setDao(IRegionDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		//액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 을 통한 관리자만 접속 가능하게 처리
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null) // 로그인 상태가 아니라면
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
			
		} 
		else if(session.getAttribute("admin")==null) // 관리자가 아니라면
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		String regionId = request.getParameter("regionId");
		
		try
		{
			Region region = new Region();
			
			region = dao.search(regionId);
			
			int delCheck = region.getDelCheck();
			
			if (delCheck!=0)
			{
				
				mav.setViewName("redirect:regionlist.action");
				return mav;
			}
			
 			dao.remove(regionId);
			mav.setViewName("redirect:regionlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}
	
}



