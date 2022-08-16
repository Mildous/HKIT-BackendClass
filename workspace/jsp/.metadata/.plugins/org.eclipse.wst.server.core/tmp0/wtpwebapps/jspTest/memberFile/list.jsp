<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/jspTest";
	String uploadFile = uploadPath + "/member.txt";
	
	ArrayList<String> list = new ArrayList<>();
			
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
					
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			list.add(data);
		}
		sReader.close();
	} catch(Exception e) {
		//e.printStackTrace();
	}
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
		<h2>회원목록</h2>
		<table border="1" align="center" width="70%">
			<tr>
				<th>순번</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				
			</tr>
			<%
				int totalCounter = list.size();
				for(int i=0; i<list.size(); i++) {
					String[] mArray = list.get(i).split(",");
					String id = mArray[0];
					String pw = mArray[1];
					String name = mArray[2];
					String phone = mArray[3];
					String addr = mArray[4];
					String email = mArray[5];		
			%>
			<tr>
				<td><%= totalCounter %></td>
				<td><a href="#" onclick="move('view.jsp', '<%= id %>');"><%= id %></a></td>
				<td><%= name %></td>
				<td><%= phone %></td>
				<td><%= email %></td>
			</tr>
			<%		
				totalCounter--;
			}
			%>
			
		</table>
		<div style="border: 0px solid blue; width: 70%; margin-top: 10px;" align="right">
		|
		<a href="#" onClick="move('list.jsp');">목록</a>
		|
		<a href="#" onClick="move('chuga.jsp');">등록</a>
		|
		</div>
	</td>
</tr>
</table>
<script>
function move(value1, value2) {
	location.href = value1 + "?id=" + value2;	//view.jsp?id=jang
}
</script>
</body>
</html>