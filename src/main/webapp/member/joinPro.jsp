<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%

//post 한글처리
request.setCharacterEncoding("utf-8");
// request id pass name email address phone mobile파라미터값 가져오기 => 멤버변수저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");

String sample6_pocstode = request.getParameter("sample6_pocstode");
String sample6_address = request.getParameter("sample6_address");
String sample6_detailAddress = request.getParameter("sample6_detailAddress");
String sample6_extraAddress = request.getParameter("sample6_extraAddress");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

// 자바파일 : 데이터를 담아서 전달 
MemberDTO memberDTO = new MemberDTO();
memberDTO.setId(id);
memberDTO.setPass(pass);
memberDTO.setName(name);
memberDTO.setEmail(email);

memberDTO.setSample6_pocstode(sample6_pocstode);
memberDTO.setSample6_address(sample6_address);
memberDTO.setSample6_detailAddress(sample6_detailAddress);
memberDTO.setSample6_extraAddress(sample6_extraAddress);

memberDTO.setPhone(phone);
memberDTO.setMobile(mobile);

MemberDAO memberDAO = new MemberDAO();
memberDAO.insertMember(memberDTO);
//insertMember() 메서드 정의
//객체생성 => 클래스 기억장소 할당
//메서드 호출
//memberDAO.insertMember(id,pass,name);
// 패키지 member 파일이름 MemberDTO
// 멤버변수 정의, 멤버변수 접근 메서드 정의
// id pass name email address phone mobile
// 객체생성 => 기억장소 할당

// cmd
// mysql -uroot -p jspdb1
// 1234

// alter table members
// add email varchar(30);

// alter table members
// add address varchar(50);

// alter table members
// add phone varchar(30);

// alter table members
// add mobile varchar(30);

// 멤버변수에 값을 저장하는 메서드 호출

// 자바파일 메서드정의(디비) 메서드호출
// 패키지 member 파일 이름 MemberDAO


%>
<script type="text/javascript">
	alert("회원가입 성공");
	location.href="login.jsp";
</script>
</body>
</html>