<%@page import="java.util.List"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("arg1");

	if(id == null || id.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}

	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/jspTest";
	String uploadFile = uploadPath + "/member.txt";
	
	String name="";
	String pw="";
	String phone="";
	String email="";
	String addr="";

	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
					
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			String[] imsiArray = data.split(",");
			
			if(id.equals(imsiArray[0])) {
				pw = imsiArray[1];
				name = imsiArray[2];
	            phone = imsiArray[3];
	            addr = imsiArray[4];
	            email = imsiArray[5];

			}
		}
		sReader.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>

<table border="1" width="80%" align="center">

<tr>
	<td height="300px;" align="center">
		<h2>회원정보수정</h2>
		<form name="sujungForm">
		<input type="text" name="arg1" value="<%=id%>">
		<table border="1" align="center" width="70%">
			<tr>
				<td>아이디</td>
				<td><%= id %><input type="hidden" name="id" value="<%=id %>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= name %><input type="hidden" name="name" value="<%= name %>"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="tel" value="<%= phone %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%= addr %>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%= email %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" onClick="sujung();">수정하기</button>
				</td>
			</tr>
		</table>
		<div style="border: 0px solid blue; width: 70%; margin-top: 10px;" align="right">
		|
		<a href="#" onClick="move('list.jsp');">목록</a>
		|
		<a href="#" onClick="move('chuga.jsp');">등록</a>
		|
		<a href="#" onClick="move('sujung.jsp');">수정</a>
		|
		<a href="#" onClick="move('delete.jsp');">삭제</a>
		|
		</div>
		</form>
	</td>
</tr>
</table>
<script>
function move(value1, value2) {
	location.href = value1 + "?arg1=" + value2;
}
function sujung() {
	document.sujungForm.action="sujungProc.jsp";
	document.sujungForm.method="post";
	document.sujungForm.submit();
}
</script>
</body>
</html>