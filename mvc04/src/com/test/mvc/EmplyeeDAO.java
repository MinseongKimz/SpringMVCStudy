/*===============================
 * EmployeeDAO.java
 * 데이터베이스 액션 처리 클래스
 * 직원 데이터 입력/출력/삭제 액션
 * Connection 객체에 대한 의존성 주입을 위한 준비
 * 인터페이스 형태의 속성 구성(DataSource).
 * setter 메소드 정의
 ================================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class EmplyeeDAO implements IEmployeeDAO
{
	//인터페이스
	private DataSource datasource;
	
	
	//setter 메소드
	public void setDatasource(DataSource datasource)
	{
		this.datasource = datasource;
	}

	
	
	
	
	//직원 리스트 출력
	@Override
	public ArrayList<Employee> list() throws SQLException
	{
		ArrayList<Employee> result = new ArrayList<Employee>();
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY" + 
				", LUNAR, LUNARNAME, TELEPHONE" + 
				", DEPARTMENTID, DEPARTMENTNAME" + 
				", POSITIONID, POSITIONNAME" + 
				", REGIONID, REGIONNAME" + 
				", BASICPAY, EXTRAPAY, PAY, GRADE" + 
				"  FROM EMPLOYEEVIEW" + 
				"  ORDER BY EMPLOYEEID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		while(rs.next())
		{
			Employee employee = new Employee();
			
			employee.setBasicPay(rs.getInt("BASICPAY"));
			employee.setBirthday(rs.getString("BIRTHDAY"));
			employee.setDepartmentId(rs.getString("DEPARTMENTID"));
			employee.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));
			employee.setExtraPay(rs.getInt("EXTRAPAY"));
			employee.setGrade(rs.getInt("GRADE"));
			employee.setLunar(rs.getInt("LUNAR"));
			employee.setLunarName(rs.getString("LUNARNAME"));
			employee.setName(rs.getString("NAME"));
			employee.setPay(rs.getInt("PAY"));
			employee.setPositionId(rs.getString("POSITIONID"));
			employee.setPositionName(rs.getString("POSITIONNAME"));
			employee.setRegionId(rs.getString("REGIONID"));
			employee.setRegionName(rs.getString("REGIONNAME"));
			employee.setSsn(rs.getString("SSN"));
			employee.setSsn1(rs.getString("SSN1"));
			employee.setSsn2(rs.getString("SSN2"));
			employee.setTelephone(rs.getString("TELEPHONE"));
			result.add(employee);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	//지역
	@Override
	public ArrayList<Region> regionList() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT REGIONID, REGIONNAME, DELCHECK" + 
				" FROM REGIONVIEW" + 
				" ORDER BY REGIONID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs= pstmt.executeQuery();
		
		while(rs.next())
		{
			Region region = new Region();
			
			region.setDelCheck(rs.getInt("DELCHECK"));
			region.setRegionId(rs.getString("REGIONID"));
			region.setRegionName(rs.getString("REGIONNAME"));
		
			result.add(region);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//부서 리스트
	@Override
	public ArrayList<Department> departmentList() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK" + 
				" FROM DEPARTMENTVIEW" + 
				" ORDER BY DEPARTMENTID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Department department = new Department();
			
			department.setDelCheck(rs.getInt("DELCHECK"));
			department.setDepartmentId(rs.getString("DEPARTMENTID"));
			department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
		
			result.add(department);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
 
	//직위 리스트
	@Override
	public ArrayList<Position> positionList() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();
		
		Connection conn = datasource.getConnection();
		
		String sql ="SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK" + 
				"FROM POSITIONVIEW" + 
				"ORDER BY POSITIONID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Position position = new Position();
			
			position.setPositionId(rs.getString("POSITIONID"));
			position.setPositionName(rs.getString("POSITIONNAME"));
		
			result.add(position);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return result;
	}

	//직위 아이디에 따른 최소 기본급
	@Override
	public int getMinBasicPay(String positionId) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(positionId));
		ResultSet rs = pstmt.executeQuery();		
		
		while(rs.next())
			result = rs.getInt("MINBASICPAY");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//직원 데이터 추가
	@Override
	public int employeeAdd(Employee employee) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "INSERT INTO EMPLOYEE"
				+ "(EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY"
				+ ", LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID"
				+ ", BASICPAY, EXTRAPAY)"
				+ " VALUES ( EMPLOYEESEQ.NEXTVAL"
				+ ", ?, ?, CRYPTPACK.ENCRYPT(?, ?)"
				+ ", TO_DATE(?, 'YYYY-MM-DD')"
				+ ", ?, ?, ?, ?, ?"
				+ ", ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getSsn1());
		pstmt.setString(3, employee.getSsn2());
		pstmt.setString(4, employee.getSsn2());
		pstmt.setString(5, employee.getBirthday());
		pstmt.setInt(6, employee.getLunar());
		pstmt.setString(7, employee.getTelephone());
		pstmt.setInt(8, Integer.parseInt(employee.getDepartmentId()));		//Integer
		pstmt.setInt(9, Integer.parseInt(employee.getPositionId()));		//Integer
		pstmt.setInt(10, Integer.parseInt(employee.getRegionId()));			//Integer
		pstmt.setInt(11, employee.getBasicPay());
		pstmt.setInt(12, employee.getExtraPay());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	//직원데이터 삭제
	@Override
	public int remove(String employeeId) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "DELETE FROM EMPLOYEE WHERE EMPLOYEEID=?";
		
		PreparedStatement pstmt =conn.prepareStatement(sql);
			
		pstmt.setString(1, employeeId);		//integer
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		conn.close();
		
		return result;
	}
	//수정
	@Override
	public int modify(Employee employee) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "UPDATE EMPLOYEE SET NAME=?"
				+ ", BIRTHDAY=TO_DATE(?, 'YYYY-MM-DD')"
				+ ", LUNAR=?, TELEPHONE=?, DEPARTMENTID=?, POSITIONID=?, REGIONID=?"
				+ ", BASICPAY=?, EXTRAPAY=?"
				+ ", SSN1=?, SSN2=CRYPTPACK.ENCRYPT(?, ?)"
				+ " WHERE EMPLOYEEID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getBirthday());
		pstmt.setInt(3, employee.getLunar());
		pstmt.setString(4, employee.getTelephone());
		pstmt.setString(5, employee.getDepartmentId());
		pstmt.setString(6, employee.getPositionId());
		pstmt.setString(7, employee.getRegionId());
		pstmt.setInt(8, employee.getBasicPay());
		pstmt.setInt(9, employee.getExtraPay());
		pstmt.setString(10, employee.getSsn1());
		pstmt.setString(11, employee.getSsn2());
		pstmt.setString(12, employee.getSsn1());
		pstmt.setString(13, employee.getSsn2());
		pstmt.setString(13, employee.getEmployeeId());
		
		result=pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	//아이디 직원 검색
	@Override
	public Employee searchId(String employeeId) throws SQLException
	{

		Employee employee = new Employee();
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT EMPLOYEEID, NAME, SSN1" + 
				", TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY" + 
				", LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID" + 
				", BASICPAY, EXTRAPAY" + 
				" FROM EMPLOYEE" + 
				" WHERE EMPLOYEEID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, employeeId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));
			employee.setName(rs.getString("NAME"));
			employee.setSsn1(rs.getString("SSN1"));
			employee.setBirthday(rs.getString("BIRTHDAY"));
			employee.setLunar(rs.getInt("LUNAR"));
			employee.setTelephone(rs.getString("TELEPHONE"));
			employee.setDepartmentId(rs.getString("DEPARTMENTID"));
			employee.setPositionId(rs.getString("POSITIONID"));
			employee.setRegionId(rs.getString("REGIONID"));
			employee.setBasicPay(rs.getInt("BASICPAY"));
			employee.setExtraPay(rs.getInt("EXTRAPAY"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return employee;
	}
	
	//일반 직원 로그인
	@Override
	public String login(String id, String pw) throws SQLException
	{
		
		String result = null;
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT NAME" + 
				" FROM EMPLOYEE" + 
				" WHERE EMPLOYEEID=?" + 
				" AND SSN2 = CRYPTPACK.ENCRYPT(?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, pw);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
			result = rs.getString("NAME");
		
		rs.close();
		pstmt.close();
		conn.close();
		return result;
		
	}
	//관리자 로그인
	@Override
	public String loginAdmin(String id, String pw) throws SQLException
	{
		String result = null;
		
		Connection conn= datasource.getConnection();
		
		String sql = "SELECT NAME" + 
				" FROM EMPLOYEE" + 
				" WHERE EMPLOYEEID=?" + 
				" AND SSN2 =  CRYPTPACK.ENCRYPT(?, ?)" + 
				" AND GRADE = 0";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, pw);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
			result = rs.getString("NAME");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
}
