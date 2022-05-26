/*==========================
 * 	#4. Position.java
 * 	- 직위 데이터 자료형 클래스
 *========================== */

/*
 * ------------ -------- ------------ 
POSITIONID   NOT NULL NUMBER       
POSITIONNAME          VARCHAR2(30) 
MINBASICPAY           NUMBER       
DELCHECK              NUMBER    
 * */

package com.test.mvc;

public class Position
{
	private String positionId, positionName;
	private int minBasicPay, delCheck; // 최소 기본급
	
	// getter / setter
	public String getPositionId()
	{
		return positionId;
	}
	public void setPositionId(String positionId)
	{
		this.positionId = positionId;
	}
	public String getPositionName()
	{
		return positionName;
	}
	public void setPositionName(String positionName)
	{
		this.positionName = positionName;
	}
	public int getMinBasicPay()
	{
		return minBasicPay;
	}
	public void setMinBasicPay(int minBasicPay)
	{
		this.minBasicPay = minBasicPay;
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
