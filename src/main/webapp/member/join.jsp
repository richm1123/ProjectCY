<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8">

  <title>join</title>

  <script src="../main/main.js" defer></script> 
<!--   헤더 js파일 햄버거바작동 -->
  <link rel="stylesheet" href="../css/main.css"> <!-- 메인 css 파일 -->
  <link rel="stylesheet" href="../css/join.css"> <!-- 회원가입 css파일 -->
  <script src="https://kit.fontawesome.com/017b0b67ba.js" crossorigin="anonymous"></script><!-- 햄버거 아이콘 -->
<!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- 주소확인 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  
  
  
  <script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
  <script type="text/javascript" src="join.js"></script>
  <script type="text/javascript">
	$(document).ready(function(){
		$('.id').blur(function(){
 			if($('.id').val()!=""){
//          dupCheck2.jsp 갈때   class="id" val()을 들고 가서 아이디 중복체크 하고 
//           그결과를 가져와서  id="dupdiv" 내용 변경
			$.ajax({
				url:'../jQuery1/dupCheck2.jsp',
				data:{'id':$('#id').val()},
				success:function(rdata){
					$('#dupdiv').html(rdata).css('color','blue');
				}//success function
			}); //ajax
 			} // if 
 			else {
 				$('#dupdiv').html("아이디를 입력하세요").css('color','blue');
 			}
 		});// blur
	
	}); //document
	
</script>
  
  
 </head>
 <body>
<!-- 헤더들어가는 곳 시작 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 끝-->
<div id="wrap"> 
 <h1> 회원가입 </h1>

<!-- 본문내용 -->
 <article class="main-container">
  <form action="joinPro.jsp" id="join" name="form" method="post" onsubmit="return memberCheck()" >
	<label for="id">사용자 ID (필수)</label>
	<div id="b-id">
		<input type="text" id="id" name="id" class="id" placeholder="이름을 입력하세요">
<!-- 		<input type="button" id="button-i" class="dup" value="아이디중복체크" > -->
<!-- 아이디 중복체크 여부 -->
		<label></label><div id="dupdiv"></div>
	</div>
	<br>
	<label>비밀번호 (필수)</label>
		<input type="password" name="pass" onkeyup="checkPass(this.value)" placeholder="비밀번호를 입력해주세요"><br>
	<span id="checkPassResult"><!-- 패스워드 규칙 판별 결과 표시 영역 --></span>
	<div id="b-ps">
	 <label>비밀번호 확인 (필수)</label>
		<input type="password" name="pass2" onblur="checkRetypePass(this.value)"><br>
<!-- 		<input type="button" id="button-p" value="비밀번호확인" onclick="checkPass()"><br> -->
		<span id="checkRetypePassResult"><!-- 패스워드 일치 여부 표시 영역 --></span>
<!-- 비밀번호 충복 체크 여부 -->
<!-- 		<input type="hidden" name="passDuplication" value="passUncheck"> -->
	</div>

	<label>이름 (필수)</label>
		<input type="text" name="name" ><br>
    <label>핸드폰번호 (필수)</label>
		<input type="text" name="mobile"  onblur="mobileCheck(this.value)"><br>
		<span id="checkMobileResult"><!-- 휴대폰번호 일치 여부 표시 영역 --></span>
	<label>E-Mail (필수)</label>
		<input type="email" name="email"><br>
	<label>집전화번호 (선택)</label>
		<input type="text" name="phone" ><br>
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
		<input type="submit" value="회원가입" class="submit" name="form" >
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