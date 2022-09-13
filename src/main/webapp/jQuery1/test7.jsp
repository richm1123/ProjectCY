<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery1/test7.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
// 		click()  id="btn" 클릭했을때 
//      ajax()  url test7_json.jsp , success function(rdata) dataType:'json'
//      each()    배열변수(rdata) 내용을 접근 반복해서 
//      append()  table태그 뒤부분에 출력 <tr><td>아이디</td><td>이름</td></tr>
		$('#btn').click(function(){
// 			alert("클릭");
			$.ajax({
				url:'test7_json.jsp',
				dataType:'json',
				success:function(rdata){
					$.each(rdata,function(index,item){
						$('table').append("<tr><td>"+item.id+"</td><td>"+item.name+"</td></tr>");
					});
				}
			});
		});
	});
</script>
</head>
<body>
<input type="button" value="버튼" id="btn">

<table border="1">
<tr><td>아이디</td><td>이름</td></tr>
</table>

</body>
</html>