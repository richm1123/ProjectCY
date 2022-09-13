package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberDTO;

public class BoardDAO {
	// 디비연결 메서드
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	// 리턴할형 List   getBoardList() 메서드 정의
	public List getBoardList(int startRow,int pageSize) {
		// 여러명을 저장할 변수 => 자바API 배열 변수
		List boardList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2 디비연결 메서드 호출
			con=getConnection();
			// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
//			String sql="select * from board";
//			String sql="select * from board order by num desc"; limit는 시작하는 곳을 포함안함 그래서 -1 해줌
			String sql="select * from boards order by num desc limit ?,?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
			//=> sql구문을 실행한 결과 저장하는 내장객체 ResultSet
			rs=pstmt.executeQuery();
			// 5단계 결과를 가지고 출력하거나 배열변수 저장(select)
			// rs.next() 결과에서 다음행 이동하고 데이터 있으면 true/없으면 false 
			// while(rs.next()){
				// 데이터 있으면 true => 열접근
			while(rs.next()) {
				BoardDTO boardDTO=new BoardDTO();
				
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setPass(rs.getString("pass"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				boardDTO.setDate(rs.getTimestamp("date"));
				//배열한칸에 글 정보 저장
				boardList.add(boardDTO);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return boardList;		
	}
	
	
	public BoardDTO getboard(int num) {
		BoardDTO boardDTO = null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {//1,2디비연결 메서드 호출
			con=getConnection();
			// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
			// String sql="select * from 테이블이름 where 조건열=값";
			String sql="select * from boards where num=?";
//			String sql="select * from board order by num=desc";
			// 최근글이 위로 올라오게 정렬 num 기준값을 내림차순 정
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
			//=> sql구문을 실행한 결과 저장하는 내장객체 ResultSet
			rs=pstmt.executeQuery();
			// 5단계 결과를 가지고 출력하거나 배열변수 저장(select)
			// if  rs.next() 결과에서 다음행 이동하고 데이터 있으면 true => 열접근=> 출력
			if(rs.next()){
				boardDTO=new BoardDTO();
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setPass(rs.getString("pass"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				boardDTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				  if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
				  if(con != null) try{con.close();} catch(SQLException ex){}
				  if(rs != null) try{rs.close();} catch(SQLException ex){}
		}
		return boardDTO;
	}
	// 리턴값없음 insertBoard(BoardDTO boardDTO)메서드 정의
	public void insertBoard(BoardDTO boardDTO) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con=getConnection();
			String sql="select max(num) from boards";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int num=0;
			if(rs.next()) num = rs.getInt("max(num)")+1;
			
			sql="insert into boards(num,pass,name,subject,content,readcount,date) values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardDTO.getPass());
			pstmt.setString(3, boardDTO.getName());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.setInt(6, boardDTO.getReadcount());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			  if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			  if(con != null) try{con.close();} catch(SQLException ex){}
			  if(rs != null) try{rs.close();} catch(SQLException ex){}
	}
		
		
	}
	// 리턴할 형 없음 updateBoard(BoardDTO boardDTO)
	public void updateBoard(BoardDTO boardDTO) {
		Connection con = null;
		PreparedStatement pstmt=null;
		
		try { con=getConnection();
		
		String sql="update boards set subject=?,content=? where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, boardDTO.getSubject());
		pstmt.setString(2, boardDTO.getContent());
		pstmt.setInt(3, boardDTO.getNum());
		pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			  if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			  if(con != null) try{con.close();} catch(SQLException ex){}
	}
		
	}
	// 리턴값없음 deleteBoard(int num) 메서드 정의
	// deleteBoard(num) 메서드 호출
	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try { con=getConnection();
		String sql = "delete from boards where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			  if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			  if(con != null) try{con.close();} catch(SQLException ex){}
		}
	}//deleteBoard

	public int getBoardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int count = 0;
		try {
			con=getConnection();
			String sql = "select count(*) from boards";
			pstmt=con.prepareStatement(sql);
			//4 실행결과 저장
			rs=pstmt.executeQuery();
			//5 다음행으로 이동 데이터 있으면 열 접근
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			  if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			  if(con != null) try{con.close();} catch(SQLException ex){}
			  if(rs != null) try{rs.close();} catch(SQLException ex){}
		}
		return count;
	}// getBoardCont 
	
	public void updateReadcount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			String sql="update boards set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 실행 
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
	}
	
	public List getBoardList1(String keyWord, String search, int startRow,int pageSize) {
		// 여러명을 저장할 변수 => 자바API 배열 변수
		List boardList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println(keyWord+"/"+search); //값 제대로 넘어오는지 확인용
		try {
			//1, 2 디비연결 메서드 호출
			con=getConnection();
			String sql="select * from boards ";
			if(keyWord.equals("Title")) {
				sql += "where subject like ? order by num desc limit ?,?";
			}else if(keyWord.equals("Content")) {
				sql += "where content like ? order by num desc limit ?,?";
			}else {
				sql += "where name like ? order by num desc limit ?,?";
			}
			
//			// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
////			String sql="select * from board";
////			String sql="select * from board order by num desc"; limit는 시작하는 곳을 포함안함 그래서 -1 해줌
//			sql="select * from board order by num desc limit ?,?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
			//=> sql구문을 실행한 결과 저장하는 내장객체 ResultSet
			rs=pstmt.executeQuery();
			// 5단계 결과를 가지고 출력하거나 배열변수 저장(select)
			// rs.next() 결과에서 다음행 이동하고 데이터 있으면 true/없으면 false 
			// while(rs.next()){
				// 데이터 있으면 true => 열접근
			while(rs.next()) {
				BoardDTO boardDTO=new BoardDTO();
				
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setPass(rs.getString("pass"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				boardDTO.setDate(rs.getTimestamp("date"));
							
				//배열한칸에 글 정보 저장
				boardList.add(boardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return boardList;
		
	}
	
	public int getBoardCount1(String keyWord, String search) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int count = 0;
		try {
			con=getConnection();
			String sql="select count(*) from boards ";
			if(keyWord.equals("Title")) {
				sql += "where subject like ?";
			}else if(keyWord.equals("Content")){	
				sql += "where content like ?";
			}else {
				sql += "where name like ?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
			//=> sql구문을 실행한 결과 저장하는 내장객체 ResultSet
			//4 실행결과 저장
			rs=pstmt.executeQuery();
			//5 다음행으로 이동 데이터 있으면 열 접근
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			  if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			  if(con != null) try{con.close();} catch(SQLException ex){}
			  if(rs != null) try{rs.close();} catch(SQLException ex){}
		}
//		System.out.println("검색게시글 총갯수"+count);
		return count;
	}// getBoardCont 
	
	
	
	
	
}//클래스

