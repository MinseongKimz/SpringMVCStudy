/*
 * IStudentDAO.java 
 * 
 * */

package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
	// 인원수 확인
	public int count();
	
	// 학생 리스트 확인
	public ArrayList<StudentDTO> list();
	
	// 학생 데이터 추가
	public int add(StudentDTO s);
	
	// 학생 데이터 확인
	public StudentDTO search(String sid);
	
	
	
	
}
