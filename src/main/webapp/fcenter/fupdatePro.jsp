<%@page import="board.fBoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 한글처리
// num name subject content 파라미터 가져오기
request.setCharacterEncoding("utf-8");
// 업로드 경로지정
String uploadPath=request.getRealPath("/upload");
//파일 업로드 크기
int maxSize=10*1024*1024; 
//파일 업로드 => MultipartRequest 객체생성
MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
// multi num name subject content file old file 파라미터가져오기
int num =  Integer.parseInt(multi.getParameter("num"));
String name = multi.getParameter("name");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
// file 파라미터 가져오기
String file = multi.getFilesystemName("file");
// if file 없으면 oldfile 가져오기
if(file==null){
	file = multi.getParameter("oldfile");
}
// BoardDTO 객체 생성
BoardDTO boardDTO = new BoardDTO();
// set메서드 호출 파라미터값 저장
boardDTO.setNum(num);
boardDTO.setName(name);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
// 파일 저장
boardDTO.setFile(file);
// BoardDAO 객체생성
// 리턴할 형 없음 updateBoard(BoardDTO boardDTO)
// updateBoard(boardDTO) 호출
fBoardDAO boardDAO = new fBoardDAO();
boardDAO.updateBoard(boardDTO);

// fdeleteUpdatePage.jsp 이동 업데이트 확인 페이지로 이동
response.sendRedirect("fdeleteUpdatePage.jsp");

%>

</body>
</html>