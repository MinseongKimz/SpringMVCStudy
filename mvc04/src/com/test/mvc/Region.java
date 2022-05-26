/*==========================
 * 	#3. Region.java
 * 	- 지역 데이터 자료형 클래스
 *========================== */

/*
 * ---------- -------- ------------ 
REGIONID   NOT NULL NUMBER       
REGIONNAME          VARCHAR2(30) 
DELCHECK            NUMBER       
 * */

package com.test.mvc;

public class Region
{
	private String regionId, regionName;
	private int delCheck; // 삭제 가능 여부
	// 참조 되어있지 않으면 0 → 삭제 가능
	// 참조 되있는 수만큼 n → 삭제 불가능
	
	// getter / setter
	public String getRegionId()
	{
		return regionId;
	}
	public void setRegionId(String regionId)
	{
		this.regionId = regionId;
	}
	public String getRegionName()
	{
		return regionName;
	}
	public void setRegionName(String regionName)
	{
		this.regionName = regionName;
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
