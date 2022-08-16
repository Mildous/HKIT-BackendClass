<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<h2>JSON TEST 02</h2>

id : <input type="text" name="id" id="id"><br>
password : <input type="password" name="password" id="password"><br>
name : <input type="text" name="name" id="name"><br>
age : <input type="text" name="age" id="age"><br>
<button type="button" onClick="btnSave();">확인</button>

<hr>

id : <span id="json_id"></span><br>
password : <span id="json_password"></span><br>
name : <span id="json_name"></span><br>
age : <span id="json_age"></span><br>

<script>
$(document).ready(function(){
	$("#btnSave").click(function(){
		examProc();
	});
});

function examProc() {
	var param = {
		"id": $("#id").val(),
		"password": $("#password").val(),
		"name": $("#name").val(),
		"age": $("#age").val()
	}
	
	$.ajax({
		type: "post",
		data: param,
		datatype: "JSON",
		url: "exam02Proc.jsp",
		success: function(data) {
			var json_member = JSON.parse(data);
			$("#json_id").text(json_member.id);
			$("#json_password").text(json_member.password);
			$("#json_name").text(json_member.name);
			$("#json_age").text(json_member.age);
		}
	});
}
</script>	

</body>
</html>