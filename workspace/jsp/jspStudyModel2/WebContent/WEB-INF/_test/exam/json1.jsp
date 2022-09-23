<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<%@ include file="../../_include/inc_menu.jsp" %>

<h2>json1</h2>

id : <input type="text" name="id" id="id"><br>
pw : <input type="password" name="pw" id="pw"><br>
name : <input type="text" name="name" id="name"><br>
age : <input type="text" name="age" id="age"><br>
<button type="button" id="btnSave">확인</button>

<hr>
id : <span id="json_id"></span><br>
pw : <span id="json_pw"></span><br>
name : <span id="json_name"></span><br>
age : <span id="json_age"></span><br>

<hr>
<div id="result"></div>

<script>
$(document).ready(function(){
	$("#btnSave").click(function() {
		examProc();
	});
});

function examProc() {
	var param = {
		id: $("#id").val(),
		pw: $("#pw").val(),
		name: $("#name").val(),
		age: $("#age").val()
	}
	
	var url = "${ path }/exam_servlet/join1proc.do";
	
	$.ajax({
		type: "post",
		data: param,
		datatype: "JSON",
		url: url,
		success: function(data) {
			//$("#result").text(data);
			//console.log("data : " + data);
			
			var jsonMember = JSON.parse(data);
			$("#result").text(data);
			$("#json_id").text(jsonMember.id);
			$("#json_pw").text(jsonMember.pw);
			$("#json_name").text(jsonMember.name);
			$("#json_age").text(jsonMember.age);
		}
	});
}
</script>
</body>
</html>