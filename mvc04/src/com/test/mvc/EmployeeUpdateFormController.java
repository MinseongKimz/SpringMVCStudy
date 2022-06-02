/*==============================
 * HelloController
  - 사용자 정의 컨트롤러 클래스
  - 직원 데이터 수정 폼 요청에 대한 액션 처리
  - DAO 객체에 대한 의존성 주입(DI) 을 위한 준비 필요
  	→ 인터페이스 형태의 자료형을 속성으로 구성
  	→ setter 메소드 구성
 ==============================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 의 [Controller] 인터페이스를 구현하는 방법을 통해
//	 사용자 정의 컨트롤러 클래스를 구성한다.
public class EmployeeUpdateFormController implements Controller
{
	
	// check~!!!
	// EmployeeInsertFormController 구성과는 다른 방식으로 처리~!!!
	//-----------------------------
	//	필요한 메소드를 EmployeeDAO에 정의해 두었던 형태
	
	//주요 속성 구성
	private IEmployeeDAO employeeDAO;
	private IRegionDAO regionDAO;
	private IDepartmentDAO departmentDAO;
	private IPositionDAO positionDAO;
	
	

	//setter 구성
	public void setEmployeeDAO(IEmployeeDAO employeeDAO) //searchid(employeeid) ->
	{
		this.employeeDAO = employeeDAO;
	}


	public void setRegionDAO(IRegionDAO regionDAO)
	{
		this.regionDAO = regionDAO;
	}


	public void setDepartmentDAO(IDepartmentDAO departmentDAO)
	{
		this.departmentDAO = departmentDAO;
	}


	public void setPositionDAO(IPositionDAO positionDAO)
	{
		this.positionDAO = positionDAO;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		//액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리 과정 추가(비정상적 접근 막기 위해) --------------------
		HttpSession session = request.getSession();
		
		if(session.getAttribute("name")==null) // 로그인이 되어 있지 않는 상태
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if(session.getAttribute("admin")==null)      //로그인은 된 상태지만 관리자가 아닌 상황
		{
			
			mav.setViewName("redirect:logout.action");
			return mav;
			//- 로그인은 되어있지만 이 때 클라이언트는
			// 일반 직원으로 로그인 되어 있는 상황이므로
			// 기존의 로그인 내용을 없애고 로그아웃 액션 처리
			// 다시 관리자로 로그인 할 수 있도록 처리
		}
		
		//  --------------------세션 처리 과정 추가(비정상적 접근 막기 위해) 
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> departmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		
		try
		{
			//데이터 수신(EmployeeList.jsp로부터 employeeId 수신)
			String employeeId = request.getParameter("employeeId");
			Employee employee = new Employee();
			
			employee = employeeDAO.searchId(employeeId); // 임플로이 dao m
			
			regionList = regionDAO.list();
			departmentList = departmentDAO.list();
			positionList = positionDAO.list();
			
			mav.addObject("employee", employee);
			mav.addObject("regionList", regionList);
			mav.addObject("departmentList", departmentList);
			mav.addObject("positionList", positionList);
			
			mav.setViewName("/WEB-INF/view/EmployeeUpdateForm.jsp");
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
		
	}
	
}































