/*=================
 * ④Position
 	-직위 리스트 자료형 클래스
 ===================*/

package com.test.mvc;

public class Position
{
	private String positionId, positionName;
	private int minBasicPay;
	private int delCheck;	//-- 삭제 가능 여부에 대한 확인
	//-- 참조되고 있는 경우(1 이상) 삭제 불가능.
	//   그렇지 않은 경우(0)만 삭제 가능.
	
	//getter/setter구성
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
