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


public class BookMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public BookMgr() {
		try {
			Context context = new InitialContext();  //java naming;
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria"); //  "java:comp/env/~~" :필수키워드
		} catch (Exception e) {
			System.out.println("DB연결 실패: " + e);
		}
	}
	
	public ArrayList<BookBean> getBookAll(){
		ArrayList<BookBean> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from book";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BookBean bean = new BookBean();
				bean.setBid(rs.getInt("bid"));
				bean.setBname(rs.getString("bname"));
				bean.setBauthor(rs.getString("bauthor"));
				bean.setBcompany(rs.getString("bcompany"));
				bean.setBguk(rs.getString("bguk"));
				bean.setByear(rs.getString("byear"));
				bean.setBlocation(rs.getString("blocation"));
				bean.setBjang(rs.getString("bjang"));
				bean.setBimgsrc(rs.getString("bimgsrc"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getBookAll err: " + e);
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
	
	public BookBean getBook(String bid){ 
		//System.out.println(bid);
		BookBean bean = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from book where bid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new BookBean();
				bean.setBid(rs.getInt("bid"));
				bean.setBname(rs.getString("bname"));
				bean.setBauthor(rs.getString("bauthor"));
				bean.setBcompany(rs.getString("bcompany"));
				bean.setBguk(rs.getString("bguk"));
				bean.setByear(rs.getString("byear"));
				bean.setBlocation(rs.getString("blocation"));
				bean.setBjang(rs.getString("bjang"));
				bean.setBimgsrc(rs.getString("bimgsrc"));
				
			}
		} catch (Exception e) {
			System.out.println("getBook err: " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return bean;
	}
	
	public boolean InsertBook(HttpServletRequest request){
		boolean b = false;
		try {
			String uploadDir="C:/Users/mj/git/Library/naver_library1/WebContent/img/book";
			//절대경로
			MultipartRequest multi = new MultipartRequest(
					request, uploadDir, 5*1024*1024,"utf-8", new DefaultFileRenamePolicy()
					);
			//System.out.println(multi.getFilesystemName("bimgsrc"));
			String sql="insert into book("
					+ "bname,bauthor,bcompany,bguk,byear,blocation,bjang,bimgsrc"
					+ ") "
					+ "values(?,?,?,?,?,?,?,?)";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("bname"));
			pstmt.setString(2, multi.getParameter("bauthor"));
			pstmt.setString(3, multi.getParameter("bcompany"));
			pstmt.setString(4, multi.getParameter("bguk"));
			pstmt.setString(5, multi.getParameter("byear"));
			pstmt.setString(6, multi.getParameter("blocation"));
			pstmt.setString(7, multi.getParameter("bjang"));
			if(multi.getFilesystemName("bimgsrc") == null){
				pstmt.setString(8, "../img/book/ready.gif");
			}else{
				pstmt.setString(8, "../img/book/"+multi.getFilesystemName("bimgsrc"));
				//파일명은 경로명
			}
			if(pstmt.executeUpdate()>0) b = true;
			
		} catch (Exception e) {
			System.out.println("InsertBook err: " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
	public boolean UpdateBook(HttpServletRequest request){
		boolean b = false;
		try {
			String uploadDir="C:/Users/mj/git/Library/naver_library1/WebContent/img/book";
			//절대경로
			MultipartRequest multi = new MultipartRequest(
					request, uploadDir, 5*1024*1024,"utf-8", new DefaultFileRenamePolicy()
					);
			conn = ds.getConnection();
			System.out.println("메소드: " + multi.getParameter("bname"));
			if(multi.getFilesystemName("bimgsrc") == null){
				String sql="update book set "
						+ "bname = ?,bauthor = ?,bcompany = ?,bguk = ?,byear = ?,blocation = ?,bjang = ? "
						+ "where bid= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("bname"));
				pstmt.setString(2, multi.getParameter("bauthor"));
				pstmt.setString(3, multi.getParameter("bcompany"));
				pstmt.setString(4, multi.getParameter("bguk"));
				pstmt.setString(5, multi.getParameter("byear"));
				pstmt.setString(6, multi.getParameter("blocation"));
				pstmt.setString(7, multi.getParameter("bjang"));
				pstmt.setString(8, multi.getParameter("bid"));
				
			}else{
				String sql="update book set "
						+ "bname = ?,bauthor = ?,bcompany = ?,bguk = ?,byear = ?,blocation = ?,bjang = ?,bimgsrc = ? "
						+ "where bid= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("bname"));
				pstmt.setString(2, multi.getParameter("bauthor"));
				pstmt.setString(3, multi.getParameter("bcompany"));
				pstmt.setString(4, multi.getParameter("bguk"));
				pstmt.setString(5, multi.getParameter("byear"));
				pstmt.setString(6, multi.getParameter("blocation"));
				pstmt.setString(7, multi.getParameter("bjang"));
				pstmt.setString(8, "../img/book/"+multi.getFilesystemName("bimgsrc"));
				//파일명은 경로명
				pstmt.setString(9, multi.getParameter("bid"));
			}
			
			if(pstmt.executeUpdate()>0) b = true;
			
		} catch (Exception e) {
			System.out.println("UpdateBook err: " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println("Mgr: " + b);
		return b;
	}
	
	public boolean DeleteBook(String bid){
		boolean b = false;
		try {
			String sql="delete from book where bid=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			if(pstmt.executeUpdate()>0) b = true;
		} catch (Exception e) {
			System.out.println("DeleteBook err: " + e);
		}finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
}//BookMgr 끝
