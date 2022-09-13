<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");

MemberDAO memberDAO = new MemberDAO();

MemberDTO memberDTO = memberDAO.usercheck(id, pass);

if(memberDTO!=null){
	session.setAttribute("id", id);
	response.sendRedirect("../main/main.jsp");
}else{
	%>
	<script type="text/javascript">
	alert("아이디 비밀번호 틀림");
	history.back();
	</script>
	<%
}
%>
</body>
</html>