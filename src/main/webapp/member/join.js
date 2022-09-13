/**
 * 
 */
 function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

var checkIdResult = false;			// 아이디검사
var checkPassResult = false;		// 패스워드 검사
var checkRetypePassResult = false;	// 패스워드 확인 결과
var checkMobileResult = false; // 휴대폰 검사
	// 패스워드 보안강도 검사
	function checkPass(pass){
		
		// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
		var spanElem = document.getElementById("checkPassResult");
//		
//		// 정규표현식 패턴 정의
		var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/; // 길이 및 사용 가능 문자 규칙
		var engUpperRegex = /[A-Z]/;	// 대문자
		var engLowerRegex = /[a-z]/;	// 소문자
		var numRegex = /[0-9]/;		// 숫자 규칙
		var specRegex = /[!@#$%]/;	// 특수문자 규칙
//		
		var count = 0;	// 각 규칙별 검사 결과를 카운팅 할 변수
//		
		if(lengthRegex.exec(pass)){	// 패스워드 길이 및 사용 가능 문자 규칙 통과 시
			spanElem.innerHTML = "사용 가능한 패스워드";
			spanElem.style.color = "GREEN";
//			
//			// 각 규칙별 검사 후 해당 항목이 포함되어 있을 경우 카운트 증가
			if(engUpperRegex.exec(pass)) count++;
			if(engLowerRegex.exec(pass)) count++;
			if(numRegex.exec(pass)) count++;
			if(specRegex.exec(pass)) count++;
//			
			switch(count){
			case 4:	// 특수문자, 대문자, 소문자, 숫자 중 4개를 만족
				spanElem.innerHTML = "사용 가능한 패스워드(안전)";
				spanElem.style.color = "GREEN";
				checkPassResult = true;
				break;
			case 3: // 특수문자, 대문자, 소문자, 숫자 중 3개를 만족
				spanElem.innerHTML = "사용 가능한 패스워드(보통)";
				spanElem.style.color = "YELLOW";
				checkPassResult = true;
				break;
			case 2: // 특수문자, 대문자, 소문자, 숫자 중 2개를 만족
				spanElem.innerHTML = "사용 가능한 패스워드(위험)";
				spanElem.style.color = "ORANGE";
				checkPassResult = true;
				break;
			default: 
				spanElem.innerHTML = "영문자, 숫자, 특수문자 중 2가지 이상 조합 필수!";
				spanElem.style.color = "RED";
				checkPassResult = false;
			}			
		} else {
			spanElem.innerHTML = "사용 불가능한 패스워드";
			spanElem.innerHTML = "영문자, 숫자, 특수문자 조합 8 ~ 16자리 필수";
			spanElem.style.color = "RED";
			checkPassResult = false;
		}
		
	}
	
	// 패스워드 일치 여부 검사
	function checkRetypePass(pass2){
		var pass = document.form.pass.value;
		var spanElem = document.getElementById("checkRetypePassResult");
		if(pass == pass2){	// 패스워드 일치
			spanElem.innerHTML = "패스워드 일치";
			spanElem.style.color = "GREEN";
			checkRetypePassResult = true;
		} else {	// 패스워드 불일치
			spanElem.innerHTML = "패스워드 불일치";
			spanElem.style.color = "RED"
			checkRetypePassResult = false;
		}
		
	}




// 핸드폰 번호 체크
   function mobileCheck(mobile){

	var phone=/^(010|011)[-\s]?\d{3,4}[-\s]?\d{4}$/;
	var spanElem = document.getElementById("checkMobileResult");
	
	if(mobile==0 || mobile==""){
		spanElem.innerHTML = "휴대폰번호를 입력해주세요";
		spanElem.style.color = "red";
		checkMobileResult = false;
	} else if(!phone.test(mobile)){
		spanElem.innerHTML = "휴대폰 번호가 올바르지 않습니다.";
		spanElem.style.color = "red";
		checkMobileResult = false;
	}else {
	spanElem.innerHTML = "올바른 휴대폰 번호입니다.";
	spanElem.style.color = "green";
	var regNumber = /[^0-9]/g;
	form.mobile.value = mobile.replace(regNumber, "");
	checkMobileResult = true;
	
	}
}


// 전체 체크
function memberCheck(){
	var checkName = document.form.name.value;
	var checkEmail = documnet.form.email.value;
		if(!checkIdResult){
			alert("아이디를 확인해주세요!");
			document.form.id.focus(); 
			return false;
		} else if(!checkPassResult){
			alert("올바른 패스워드 입력 필수!");
			document.form.pass.focus();
			return false;
		} else if(!checkRetypePassResult){
			alert("패스워드 확인 필수!");
			document.form.pass2.focus();
			return false;
		} else if(!checkMobileResult){
			alert("휴대폰 번호 확인 필수!")
			return false;
		} else if(checkName.length==0||checkName==""){
			alert("이름을 입력해주세요")
			return false;
		} else if(checkEmail.length==0||checkEmail==""){
			alert("이메일을 입력해주세요")
			return false;
		}
		else {
			return true;
		}
    
}
