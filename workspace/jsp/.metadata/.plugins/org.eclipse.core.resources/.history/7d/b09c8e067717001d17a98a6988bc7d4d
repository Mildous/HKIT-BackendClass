<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<style>
	a{
		text-decoration: none;
		color:black;
	}
</style>
</head>
<h2>회원목록</h2>
<%
	String attachPath = "C:/JIJ/attach";
	String uploadPath = attachPath + "/testFile"+request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
			
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		%><table border="1">
			<tr align="center">
				<td style="width:100px">아이디</td>
				<td style="width:150px">이름</td>
				<td style="width:150px">전화번호</td>
				<td style="width:100px">이메일</td>
				<td style="width:200px">주소</td>
			</tr>
		<%
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			String[] array=data.split("[|]");
			String id=array[0];
			String name=array[2];
			String phone=array[3];
			String email=array[4];
			String address=array[4];
			%>
				<tr align="center">
					<td><a href="#" onClick="moving('<%=id%>')"><%=id%></a></td>
					<td><%=name%></td>
					<td><%=phone%></td>
					<td><%=email%></td>
					<td><%=address%></td>
				</tr>
		<%}%></table><%
		
		
		sReader.close();
		//System.out.println();
	} catch(Exception e) {
		//e.printStackTrace();
		//System.out.println();
	}
%>
<form name="f1">
	<input type="hidden" name="id">
</form>
	<div style="magin-top:30px">
		<a href="#" onClick="move('chuga.jsp')">추가</a>
	</div>
<script>
 	function move(value1){
 		location.href = value1;
 	}
 	function moving(value1){
 		f1.id.value=value1;
 		f1.action="view.jsp";
 		f1.method="post"
 		f1.submit();
 	}
</script>