<%@page import="java.util.List"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

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
	
	String info = "";
			
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
					
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			String[] imsiArray = data.split(",");
			
			if(id.equals(imsiArray[0])) {
				info = data;
				break;
			}
		}
		sReader.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	String[] tempArray = info.split(",");
	String name = tempArray[2];
	String phone = tempArray[3];
	String addr = tempArray[4];
	String email = tempArray[5];

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>

<table border="1" width="80%" align="center">

<tr>
	<td height="300px;" align="center">
		<h2>회원상세보기</h2>
		<table border="1" align="center" width="70%">
			<tr>
				<td>아이디</td>
				<td><%= id %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= name %></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><%= phone %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%= addr %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%= email %></td>
			</tr>
			
		</table>
		<div style="border: 0px solid blue; width: 70%; margin-top: 10px;" align="right">
		|
		<a href="#" onClick="move('list.jsp');">목록</a>
		|
		<a href="#" onClick="move('chuga.jsp');">등록</a>
		|
		<a href="#" onClick="move('sujung.jsp', '<%= id %>');">수정</a>
		|
		<a href="#" onClick="move('delete.jsp', '<%= id %>');">삭제</a>
		|
		</div>
	</td>
</tr>
</table>
<script>
function move(value1, value2) {
	location.href = value1 + "?arg1=" + value2;
}
</script>
</body>
</html>