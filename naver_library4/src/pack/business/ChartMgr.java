package pack.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChartMgr {
	private  Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ChartMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db연결 실패 :" + e);
		}
	}
	
	public int Jen(){
		int Jen = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 1";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Jen = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Jen;
	}
	
	public int Feb(){
		int Feb = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 2";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Feb = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Feb;
	}
	
	public int Mar(){
		int Mar = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 3";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Mar = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Mar;
	}
	
	public int Apr(){
		int Apr = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 4";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Apr = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Apr;
	}
	
	public int May(){
		int May = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 5";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				May = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return May;
	}
	
	public int Jun(){
		int Jun = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 6";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Jun = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Jun;
	}
	public int Jul(){
		int Jul = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 7";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Jul = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Jul;
	}
	public int Aug(){
		int Aug = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 8";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Aug = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Aug;
	}
	
	public int Sep(){
		int Sep = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = '9'";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Sep = rs.getInt("sum(price)");
			}	
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Sep;
	}
	
	public int Oct(){
		int Oct = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 10";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Oct = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Oct;
	}
	public int Nov(){
		int Nov = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 11";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Nov = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Nov;
	}
	public int Dec(){
		int Dec = 0;
		try {
			conn = ds.getConnection();
			String sql = "select sum(price) from bookpay where month(date) = 12";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Dec = rs.getInt(("sum(price)"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return Dec;
	}

}//ChartMgr끝
