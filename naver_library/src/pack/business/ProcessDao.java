package pack.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.admin.UserBean;
import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private static ProcessDao dao = new ProcessDao();
	
	public static ProcessDao getInstance(){
		return dao;
	}
	
	public ProcessDao() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("OrderMgr db연결 실패 :" + e);
		}
	}
	
	private Connection conn;
	private PreparedStatement pstmt, pstmt1, pstmt2, pstmt3;
	private ResultSet rs;
	private DataSource ds;
	//paging
	private int tot;  
	private int pList = 5; 
	private int pageSu; 
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List selectdataAllBook() throws SQLException{
		//반환을 각각의 dto에 넣어서 list로 반환해준다.
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectDataAllBook"); //DataMapper의 id를 읽기
		sqlSession.close();
		return list;
	}
	
	
	public List selectDataAllByJang(String bjang) throws SQLException{
		//반환을 각각의 dto에 넣어서 list로 반환해준다.
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectDataAllByJang",bjang);
		//bjang의 id를 읽기
		sqlSession.close();
		return list;
	}
	
	
	public List selectFindByName(String bname) throws SQLException{
		//반환을 각각의 dto에 넣어서 list로 반환해준다.
		SqlSession sqlSession = factory.openSession();
		String input="%"+bname+"%";
		List list = sqlSession.selectList("selectFindByName",input);
		System.out.println(input);
		//bjang의 id를 읽기
		sqlSession.close();
		return list;
	}
	
	public boolean selectUserLogin(UserDto udto) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		boolean b = false;
		try {
			UserDto dto = sqlSession.selectOne("selectUserLogin",udto); 
			System.out.println(dto.getId());
			b=true;
		}catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
		  
		return b;
	}
	
	public boolean selectAdminLogin(AdminDto adto) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		boolean b = false;
		try {
			AdminDto dto = sqlSession.selectOne("selectAdminLogin",adto); 
			System.out.println(dto.getId());
			b=true;
		}catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
		  
		return b;
	}
	
	
	
	
	public boolean book_basketInsert(OrderDto dto) throws SQLException{
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			OrderDto dto2 = sqlSession.selectOne("book_basketInsert", dto);
			b=true;
		} catch (Exception e) {
			System.out.println("book_basketInsert err : " + e);
		} finally{
			sqlSession.close();
		}
		
		return b;
	}
	
	public boolean book_basketInsertCheck(String cid, String bid) throws SQLException{
		boolean b = true;
		try {
			conn = ds.getConnection();
			String sql = "select * from bookbasket where cid=? and bid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, bid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				b = false;
			}else{
				b = true;
			}
			
		} catch (Exception e) {
			System.out.println("book_basketInsertCheck err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		//System.out.println("basket check " + b);
		return b;
	}
	
	public List book_basketList(String id) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("book_basketList", id);
		sqlSession.close();
		return list;
	}
	
	//구매목록 인서트
	public boolean insertOrder(String id){
		boolean a = false;
		boolean b = true;
		boolean c = false;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from bookbasket left join book on book.bid = bookbasket.bid where bookbasket.cid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString("state").equals("0")){
					a = true;
					//System.out.println(a);
				}else{
					b = false;
					//System.out.println(b);
				}
				
			}
			
			if(a&&b == true){
				c = true;
			}
			rs.beforeFirst();
			
			while(rs.next()){
				System.out.println(c);
			}
			rs.beforeFirst();
			
			
			while(rs.next() && c){
				//System.out.println(rs.getString("state"));
				
					String sql1 = "insert into bookpay(bid,bname,bauthor,bcompany,bguk,byear,blocation,bjang,bimgsrc,price,date,enddate,bandate,cid,state) "
							+ "values(?,?,?,?,?,?,?,?,?,?,now(),DATE_ADD(NOW(), INTERVAL +14 DAY),now(),?,?)";
					pstmt1 = conn.prepareStatement(sql1);
					pstmt1.setString(1, rs.getString("bid"));
					pstmt1.setString(2, rs.getString("bname"));
					pstmt1.setString(3, rs.getString("bauthor"));
					pstmt1.setString(4, rs.getString("bcompany"));
					pstmt1.setString(5, rs.getString("bguk"));
					pstmt1.setString(6, rs.getString("byear"));
					pstmt1.setString(7, rs.getString("blocation"));
					pstmt1.setString(8, rs.getString("bjang"));
					pstmt1.setString(9, rs.getString("bimgsrc"));
					pstmt1.setString(10, rs.getString("price"));
					pstmt1.setString(11, id);
					pstmt1.setString(12, "1");
					pstmt1.executeUpdate();
					
					String sql2 = "update book set state='1',cid=?,date=now(),enddate=DATE_ADD(NOW(), INTERVAL +14 DAY) where bid = ?";
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, id);
					pstmt2.setString(2, rs.getString("bid"));
					pstmt2.executeUpdate();
					
					String sql3 = "delete from bookbasket where bid = ? and cid=?";
					pstmt3 = conn.prepareStatement(sql3);
					pstmt3.setString(1, rs.getString("bid"));
					pstmt3.setString(2, id);
					pstmt3.executeUpdate();

				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("insertOrder err : " + e);
		}  finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) {
					pstmt.close();
					pstmt1.close();
					pstmt2.close();
					pstmt3.close();
				}
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		
		return c;
	}
	
	public void basket_del(OrderDto dto) throws SQLException{
		SqlSession sqlSession = factory.openSession();	 //수동
		//SqlSession sqlSession = factory.openSession(true);   //auto commit
		int re = sqlSession.delete("basket_del", dto);  
		//System.out.println("re : " + re);
		sqlSession.commit();    //sqlSession.rollback();
		sqlSession.close();
	}
	
	//내도서현황 리스트
	public List mytabList(String id) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("mytabList", id);
		sqlSession.close();
		return list;
	}
	
	//반납 매쏘드
	public boolean bannap(String bid, String cid){
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update book left join bookpay on book.bid=bookpay.bid set book.state = '0', book.cid = null,book.date = null, book.enddate = null, bookpay.state='0',bookpay.bandate = now() where book.bid = ? and book.cid = ? and bookpay.state = '1'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			pstmt.setString(2, cid);
			if(pstmt.executeUpdate() > 0 ) b = true;
		
			
		} catch (Exception e) {
			System.out.println("bannap err : " + e);
		}  finally { 
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
	
	//대여중인 도서 카운트
	public int countbook(String cid){
		int a = 0;
		try {
			conn = ds.getConnection();
			String sql = "select count(*) from bookpay where cid=? and state='1'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			rs.next();
			a = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("countbook err : " + e);
		}  finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return a;
	}
	
	public List selectNotice() throws SQLException{
		//반환을 각각의 dto에 넣어서 list로 반환해준다.
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectNotice"); //DataMapper의 id를 읽기
		sqlSession.close();
		return list;
	}
	
	public ArrayList<OrderDto> payInfo(String id, int page){
		ArrayList<OrderDto> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from bookpay where cid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			for (int i = 0; i < (page - 1) * pList; i++) {	//시작점 정하는거
				rs.next();  
			}
			
			int k = 0;
			while(rs.next() && k < pList){		//시작점 부터 다섯번만 돌게 하는거
				OrderDto dto = new OrderDto();
				dto.setNo(rs.getInt("no"));
				dto.setBid(rs.getString("bid"));
				dto.setBname(rs.getString("bname"));
				dto.setBauthor(rs.getString("bauthor"));
				dto.setBcompany(rs.getString("bcompany"));
				dto.setBguk(rs.getString("bguk"));
				dto.setByear(rs.getString("byear"));
				dto.setBlocation(rs.getString("blocation"));
				dto.setBjang(rs.getString("bjang"));
				dto.setBimgsrc(rs.getString("bimgsrc"));
				dto.setPrice(rs.getString("price"));
				dto.setDate(rs.getString("date"));
				dto.setCid(id);
				list.add(dto);
				k++;
			}
			
		} catch (Exception e) {
			System.out.println("payInfo err : " + e);
		}  finally { 
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
	
	public void pointUpdate(String id, int sum, int count){
		int point = 0;
		double coupon = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql2 = "select * from user where id= ?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				point = rs.getInt("point");
				coupon = rs.getDouble("coupon");
			}
			pstmt.close();
			
			String sql = "update user set point=?,coupon=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point + (sum/10));
			pstmt.setDouble(2, coupon + ((0.1)*count));
			pstmt.setString(3, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("pointUpdate err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public ArrayList<UserDto> selectPoint(String id){
		ArrayList<UserDto> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from user where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				UserDto dto = new UserDto();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPoint(rs.getInt("point"));
				dto.setCoupon(rs.getDouble("coupon"));
				list.add(dto);
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
		return list;
	}
	
	public void updateSumbook(String id, int count){
		try {
			conn = ds.getConnection();
			String sql = "update user set sumbook=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
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
	}
	
	public void totalList(String cid){  
		String sql = "select count(*) from bookpay where cid=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			rs.next();
			tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("totalList err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	public int getPageSu(){ 
		pageSu = tot / pList;
		if(tot % pList > 0) pageSu++;   
		return pageSu;
	}
	
	public UserBean getUserAll(String id){
		UserBean bean = new UserBean();
		try {
			conn = ds.getConnection();
			String sql = "select * from user where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bean.setNo(rs.getInt("no"));
				bean.setId(rs.getString("id"));
				bean.setPswd(rs.getString("pswd"));
				bean.setPoint(rs.getInt("point"));
				bean.setCoupon(rs.getDouble("coupon"));
				bean.setSumbook(rs.getInt("sumbook"));
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
		
		return bean;
	}
	
	public ArrayList<OrderDto> sumbook(String id){
		ArrayList<OrderDto> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from bookpay where cid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setNo(rs.getInt("no"));
				dto.setBid(rs.getString("bid"));
				dto.setBname(rs.getString("bname"));
				dto.setBauthor(rs.getString("bauthor"));
				dto.setBcompany(rs.getString("bcompany"));
				dto.setBguk(rs.getString("bguk"));
				dto.setByear(rs.getString("byear"));
				dto.setBlocation(rs.getString("blocation"));
				dto.setBjang(rs.getString("bjang"));
				dto.setBimgsrc(rs.getString("bimgsrc"));
				dto.setPrice(rs.getString("price"));
				dto.setDate(rs.getString("date"));
				dto.setCid(id);
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
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
}
