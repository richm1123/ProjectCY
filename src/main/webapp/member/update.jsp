<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8">

  <title>join</title>

  <script src="update.js" defer></script> <!-- 회원가입 js파일 -->
  <script src="../main/main.js" defer></script> <!-- 헤더 js파일 햄버거바작동-->
  <link rel="stylesheet" href="../css/main.css"> <!-- 메인 css 파일 -->
  <link rel="stylesheet" href="../css/join.css"> <!-- 회원가입 css파일 -->
  <script src="https://kit.fontawesome.com/017b0b67ba.js" crossorigin="anonymous"></script><!-- 햄버거 아이콘 -->
<!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- 주소확인 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 </head>
 <body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문내용 -->
<%
// 세션값 가져오기
// MemberDAO 객체생성
// MemberDTO memberDTO = getMember(id) 메서드 호출
String id =(String)session.getAttribute("id");
MemberDAO memberDAO = new MemberDAO();

MemberDTO memberDTO = memberDAO.getMember(id);
%>



<div id="wrap"> 
 <h1> 회원정보수정 </h1>
<!-- 본문내용 -->
 <article class="main-container">
  <form action="updatePro.jsp" id="join" name="form" method="post">
	<label for="id">사용자 ID</label>
	<div id="b-id">
		<input type="text" name="id" class="id" value="<%=id %>" readonly><br>
	</div>

	<label>비밀번호</label>
		<input type="password" name="pass" onkeyup="checkPass(this.value)" placeholder="비밀번호를 입력해주세요"><br>
	<span id="checkPassResult"><!-- 패스워드 규칙 판별 결과 표시 영역 --></span>
	<div id="b-ps">
	 <label>비밀번호 확인</label>
		<input type="password" name="pass2" onblur="checkRetypePass(this.value)"><br>
<!-- 		<input type="button" id="button-p" value="비밀번호확인" onclick="checkPass()"><br> -->
		<span id="checkRetypePassResult"><!-- 패스워드 일치 여부 표시 영역 --></span>
<!-- 비밀번호 충복 체크 여부 -->
<!-- 		<input type="hidden" name="passDuplication" value="passUncheck"> -->
	</div>

	<label>이름 (필수)</label>
		<input type="text" name="name" value="<%=memberDTO.getName()%>" ><br>
    <label>핸드폰번호 (필수)</label>
		<input type="text" name="mobile" value="<%=memberDTO.getMobile()%>" onblur="mobileCheck(this.value)"><br>
		<span id="checkMobileResult"><!-- 휴대폰번호 일치 여부 표시 영역 --></span>
	<label>E-Mail (필수)</label>
		<input type="email" name="email" value="<%=memberDTO.getEmail()%>"><br>
	<label>집전화번호 (선택)</label>
		<input type="text" name="phone" value="<%=memberDTO.getPhone()%>"><br>
	<label>주소 (선택)</label>
	<div id="b-pst">
		<input type="text" onclick="sample6_execDaumPostcode()" name="sample6_pocstode" id="sample6_postcode" placeholder="우편번호">
		<input type="button" id="button-pst" onclick="sample6_execDaumPostcode()"  value="우편번호"><br>
 	</div>
 
 		<input type="text" onclick="sample6_execDaumPostcode()" name="sample6_address" id="sample6_address" placeholder="주소"><br>
 		<input type="text"  name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소"> 
        <input type="text" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목">

	<div class="clear"></div>
	<div id="buttons">
		<input type="submit" value="정보수정" class="submit" name="form" >
		<input type="button" value="취소" class="cancel" >
	</div>
  </form>
 </article>


 <div class="clear"></div>
<!-- 푸터들어가는 곳 -->
 <jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
 </body>
 </html>