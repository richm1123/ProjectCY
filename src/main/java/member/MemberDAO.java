package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	
	public Connection getConnection() throws Exception{
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb1?serverTimezone=UTC";
//		String dbId = "root";
//		String dbPass = "1234";
//		
//		Connection con = DriverManager.getConnection(dbUrl,dbId,dbPass);
//		return con;
		
		Context init=new InitialContext();
//		init.lookup("자원의 위치/자원이름");
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
		
		
		
	}
	public void insertMember(MemberDTO memberDTO) {
			Connection con = null;
			PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "insert into members(id,name,pass,sample6_pocstode,sample6_address,sample6_detailAddress,sample6_extraAddress,email,phone,mobile,date) values(?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getName());
			pstmt.setString(3, memberDTO.getPass());
			pstmt.setString(4, memberDTO.getSample6_pocstode());		
			pstmt.setString(5, memberDTO.getSample6_address());		
			pstmt.setString(6, memberDTO.getSample6_detailAddress());		
			pstmt.setString(7, memberDTO.getSample6_extraAddress());		
			pstmt.setString(8, memberDTO.getEmail());		
			pstmt.setString(9, memberDTO.getPhone());		
			pstmt.setString(10, memberDTO.getMobile());		
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)
				try {pstmt.close();}
				catch(SQLException ex){}
			if(con != null)	
				try {pstmt.close();}
				catch(SQLException ex) {}
		}
	}
	
	public MemberDTO usercheck(String id, String pass) {
		MemberDTO memberDTO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			
			String sql = "select * from members where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDTO=new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)
				try {pstmt.close();}
				catch(SQLException ex) {}
			if(con!=null)
				try {con.close();}
				catch(SQLException ex) {}
			if(rs!=null)
				try {rs.close();}
				catch(SQLException ex) {}
		}
		return memberDTO;
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO memberDTO = null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {//1,2디비연결 메서드 호출
			con=getConnection();
			// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
			// String sql="select * from 테이블이름 where 조건열=값";
			String sql="select * from members where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
			//=> sql구문을 실행한 결과 저장하는 내장객체 ResultSet
			rs=pstmt.executeQuery();
			// 5단계 결과를 가지고 출력하거나 배열변수 저장(select)
			// if  rs.next() 결과에서 다음행 이동하고 데이터 있으면 true => 열접근=> 출력
			if(rs.next()){
				memberDTO=new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
				memberDTO.setEmail(rs.getString("email"));
				memberDTO.setSample6_pocstode(rs.getString("sample6_pocstode"));
				memberDTO.setSample6_address(rs.getString("sample6_address"));
				memberDTO.setSample6_detailAddress(rs.getString("sample6_detailAddress"));
				memberDTO.setSample6_extraAddress(rs.getString("sample6_extraAddress"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setMobile(rs.getString("mobile"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {if(pstmt != null) try{
			pstmt.close();
		}catch(SQLException ex){}
		if(con != null) try{
			con.close();
		}catch(SQLException ex){}
		if(rs != null) try{
			rs.close();
		}catch(SQLException ex){}
		}
		return memberDTO;
		
		
	}
	
	public void updateMember(MemberDTO updateDTO) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {//1,2 디비연결 메서드 호출
			con = getConnection();
			
			//3단계 수정 String sql="update 테이블이름 set 수정열=값 where 조건열=값";
//			sql="update members set name=? where id=?";
//			pstmt=con.prepareStatement(sql);
//			pstmt.setString(1, name);
//			pstmt.setString(2, id);
//			//4단계 sql구문을 실행 (insert, update, delete)
//			pstmt.executeUpdate();
//			address=? 
			String sql="update members set name=?, pass=?, email=?, phone=?, mobile=?, sample6_pocstode=?, sample6_address=?, sample6_detailAddress=?, sample6_extraAddress=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,updateDTO.getName());
			pstmt.setString(2,updateDTO.getPass());
			pstmt.setString(3,updateDTO.getEmail());
			pstmt.setString(4,updateDTO.getPhone());
			pstmt.setString(5,updateDTO.getMobile());
			pstmt.setString(6,updateDTO.getSample6_pocstode());		
			pstmt.setString(7,updateDTO.getSample6_address());		
			pstmt.setString(8,updateDTO.getSample6_detailAddress());		
			pstmt.setString(9,updateDTO.getSample6_extraAddress());
			pstmt.setString(10,updateDTO.getId());
			//4단계 sql구문을 실행 (insert, update, delete)
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) 
				try{pstmt.close();}
				catch(SQLException ex){}
			if(con != null)
				try{con.close();}
				catch(SQLException ex){}
		}
	}
	
	public int duplecateID(String id){
		Connection con = null;
		PreparedStatement pstmt=null;
		int cnt=0;
	    try{
	    	con = getConnection();
	    	String sql="select count(id) as cnt from members where id=?";
	    	pstmt=con.prepareStatement(sql);
	        pstmt.setString(1, id);
	        
	        ResultSet rs=pstmt.executeQuery();
	        if(rs.next()){
	        	cnt=rs.getInt("cnt");
	        }
	    }catch(Exception e){
	    	e.printStackTrace();
	    }finally {
			if(pstmt != null) 
				try{pstmt.close();}
				catch(SQLException ex){}
			if(con != null)
				try{con.close();}
				catch(SQLException ex){}
		}
	    
	    return cnt;
	}//duplecateID end
	
	
	
	
	
	
	
	
}// MemberDAO end
