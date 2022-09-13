<%@page import="board.gBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gdelete</title>
</head>
<body>
<%
// num 파라미터 가져오기
// BoardDAO 객체생성
// 리턴값없음 deleteBoard(int num) 메서드 정의
// deleteBoard(num) 메서드 호출
int num =Integer.parseInt( request.getParameter("num"));
gBoardDAO boardDAO = new gBoardDAO();
boardDAO.deleteBoard(num);
// notice.jsp 이동
%>
<script type="text/javascript">
alert()

</script>

<%
response.sendRedirect("gdeletePage.jsp");
%>


</body>
</html>