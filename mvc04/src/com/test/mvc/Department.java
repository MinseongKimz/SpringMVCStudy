/*==========================
 * 	#2. Department.java
 * 	- 부서 데이터 자료형 클래스
 *========================== */


/*
DEPARTMENTID   NOT NULL NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
DELCHECK                NUMBER     
*/
package com.test.mvc;

public class Department
{
	// 주요 속성 구성
	private String departmentId, departmentName;
	private int delCheck;	// 삭제 가능 여부
	// 참조 되어있지 않으면 0 → 삭제 가능
	// 참조 되있는 수만큼 n → 삭제 불가능
	
	// getter/ setter
	public String getDepartmentId()
	{
		return departmentId;
	}
	public void setDepartmentId(String departmentId)
	{
		this.departmentId = departmentId;
	}
	public String getDepartmentName()
	{
		return departmentName;
	}
	public void setDepartmentName(String departmentName)
	{
		this.departmentName = departmentName;
	}
	public int getDelCheck()
	{
		return delCheck;
	}
	public void setDelCheck(int delCheck)
	{
		this.delCheck = delCheck;
	}
	
	
	
}
