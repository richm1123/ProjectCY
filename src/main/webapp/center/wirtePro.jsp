<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/writePro</title>
</head>
<body>
<%
// 한글처리
// request 파라미터 가져오기 pass name subject content
// BoardDTO객체 생성
// set메서드 파라미터값 저장
// readcount 0 저장
request.setCharacterEncoding("utf-8");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
int readcount=0;
BoardDTO boardDTO = new BoardDTO();
boardDTO.setPass(pass);
boardDTO.setName(name);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setReadcount(readcount);
// BoardDTO file 멤버변수 만들기
// set메서드 호출


// BoardDAO 객체 생성
// 리턴값없음 insertBoard(BoardDTO boardDTO)메서드 정의
// insertBoard(boardDTO)메서드 호출
BoardDAO boardDAO = new BoardDAO();
boardDAO.insertBoard(boardDTO);

// notice.jsp 이동
response.sendRedirect("notice.jsp");

%>


</body>
</html>