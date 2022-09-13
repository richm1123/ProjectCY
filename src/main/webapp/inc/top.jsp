<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");



if(id!=null){
	//세션값 있다=>로그인성공 =>..님 logout update
			%> 
		<div class="grid-container1">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div><%=id %>님 <a href="../member/logout.jsp">로그아웃</a></div>  
			<div><a href="../member/update.jsp">회원정보수정</a></div>
			<div></div>
			
		</div>			
			<%
			
}else{
	//세션값 없다=>로그인안함 =>login join
		%>
		 <div class="grid-container1">
		 	<div></div>
			<div></div>
			<div></div>
			<div></div>
  			<div><a href="../member/login.jsp">로그인</a></div>
  			<div><a href="../member/join.jsp">회원가입</a></div>
  			<div></div>
		</div>
		
		<%	
}


%>







<!-- ==================================================================================================== -->





<nav class="navbar">
    <div class="navbar-logo"><a href="./index.html"><img src="../images/name1.jpg"></a></div>
    <ul class="navbar-menu">
      <li><a href="../main/main.jsp">홈으로</a></li>
      <li><a href="../company/welcome.jsp">철학원소개</a></li>
      <li><a href="../gcenter/gnotice.jsp">명리학 이야기</a></li>
      <li><a href="../center/notice.jsp">상담예약</a></li>
      <li><a href="../fcenter/fnotice.jsp">명리학 수강신청</a></li>
      <li><a href="../company/come.jsp">오시는길</a></li>
    </ul>
<!--     <ul class="navbar-icons"> -->
<!--      <li><a href="https://www.instagram.com/"></a> -->
<!--      <i class="fa-brands fa-instagram"></i>인스타</li> -->
<!--     </ul> -->
    <a href="#" class="navbar__toggleBtn">
      <i class="fa-solid fa-bars"></i>
    </a>
</nav>





