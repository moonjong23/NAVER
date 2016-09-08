package pack.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public UserMgr() {
		try {
			Context context = new InitialContext();  //java naming;
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria"); //  "java:comp/env/~~" :필수키워드
		} catch (Exception e) {
			System.out.println("DB연결 실패: " + e);
		}
	}
	
	public ArrayList<UserBean> getUserAll(){
		ArrayList<UserBean> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				UserBean bean = new UserBean();
				bean.setNo(rs.getInt("no"));
				bean.setId(rs.getString("id"));
				bean.setPswd(rs.getString("pswd"));
				bean.setBcnt(rs.getString("bcnt"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getUserAll err: " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
	
}//UserMgr 끝
