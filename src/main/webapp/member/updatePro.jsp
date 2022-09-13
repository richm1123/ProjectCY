<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>../member/updatePro</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("phone");
String mobile = request.getParameter("mobile");
String sample6_pocstode = request.getParameter("sample6_pocstode");
String sample6_address = request.getParameter("sample6_address");
String sample6_detailAddress = request.getParameter("sample6_detailAddress");
String sample6_extraAddress = request.getParameter("sample6_extraAddress");
String phone = request.getParameter("phone");

MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.usercheck(id, pass);

if(memberDTO!=null){
	MemberDTO updateDTO = new MemberDTO();
	
	updateDTO.setId(id);
	updateDTO.setEmail(email);
	updateDTO.setMobile(mobile);
	updateDTO.setName(name);
	updateDTO.setPhone(phone);
	updateDTO.setPass(pass);
	
	updateDTO.setSample6_pocstode(sample6_pocstode);
	updateDTO.setSample6_address(sample6_address);
	updateDTO.setSample6_detailAddress(sample6_detailAddress);
	updateDTO.setSample6_extraAddress(sample6_extraAddress);
	
	memberDAO.updateMember(updateDTO);
	response.sendRedirect("../main/main.jsp");
	
}else{
	%>
	alert("아이디, 비밀번호 틀림");
	history.back();
	<%
}




%>

</body>
</html>