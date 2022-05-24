/*======================================
 	IMemerDAO.java
 	- 인터페이스
 =====================================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;
	
public interface IMemberDAO
{
	
	public ArrayList<MemberDTO> lists() throws SQLException; // 전체 리스트 출력 메소드
		
	public int count() throws SQLException;		// 전체 인원수 출력 메소드
	
	public int add(MemberDTO dto) throws SQLException;		// 신규 멤버 추가 메소드 
	
}
