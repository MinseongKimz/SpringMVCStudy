/*======================
 * ⑫PositionDAO
 */

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class PositionDAO implements IPositionDAO
{
	private DataSource datasource;

	//setter 구성
	public void setDatasource(DataSource datasource)
	{
		this.datasource = datasource;
	}

	@Override
	public ArrayList<Position> list() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();
		
		Connection conn = datasource.getConnection();
		
		String sql ="SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK"
	            + " FROM POSITIONVIEW"
	            + " ORDER BY POSITIONID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		Position position = null;
		
		
		  while(rs.next())
	      {
	         position = new Position();
	         
	          position.setPositionId(rs.getString("POSITIONID"));
	          position.setPositionName(rs.getString("POSITIONNAME"));
	          position.setMinBasicPay(rs.getInt("MINBASICPAY"));
	          position.setDelCheck(rs.getInt("DELCHECK"));
	         
	         result.add(position);
	         
	      }
	      
	      rs.close();
	      pstmt.close();
	      conn.close();
		
		
		return result;
	}

	// 직위 데이터 등록(입력, 추가)
	   @Override
	   public int add(Position position) throws SQLException
	   {
	      int result = 0;
	      
	      Connection conn = datasource.getConnection();
	      
	      String sql = "INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)"
	            + " VALUES(POSITIONSEQ.NEXTVAL, ?, ?)";
	      
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, position.getPositionName());
	      pstmt.setInt(2, position.getMinBasicPay());
	      result = pstmt.executeUpdate();
	      
	      pstmt.close();
	      conn.close();
	      
	      return result;
	   }

	   
	   // 직위 데이터 제거
	   @Override
	   public int remove(String positionId) throws SQLException
	   {
	      int result = 0;
	      
	      Connection conn = datasource.getConnection();
	      
	      String sql = "DELETE FROM POSITION WHERE POSITIONID=?";
	      
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, Integer.parseInt(positionId));
	      result = pstmt.executeUpdate();
	      
	      pstmt.close();
	      conn.close();
	      return result;
	   }

	   
	   // 직위 데이터 수정
	   @Override
	   public int modify(Position position) throws SQLException
	   {
	      int result = 0;
	      
	      Connection conn = datasource.getConnection();
	      
	      String sql = "UPDATE POSITION"
	            + " SET POSITIONNAME=?, MINBASICPAY=?"
	            + " WHERE POSITIONID=?";
	      
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, position.getPositionName());
	      pstmt.setInt(2, position.getMinBasicPay());
	      pstmt.setInt(3, Integer.parseInt(position.getPositionId()));
	      result = pstmt.executeUpdate();
	      
	      pstmt.close();
	      conn.close();
	      
	      return result;
	   }

		

	
}
