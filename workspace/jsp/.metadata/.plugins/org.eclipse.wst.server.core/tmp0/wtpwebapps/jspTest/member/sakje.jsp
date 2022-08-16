<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/inc_dbinfo.jsp" %>
<%
	String arg1 = request.getParameter("arg1");

	if(arg1 == null || arg1.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}
	
	String id = "";
	String passwd = "";
	String name = "";
	String phone = "";
	String email = "";
	String address = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
   
	int result = 0;
	try {
      
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		System.out.println("오라클 접속 성공..");
		//-------------------------------------------------------
		String sql = "select * from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, arg1);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			id = rs.getString("id");
			passwd = rs.getString("passwd");
			name = rs.getString("name");
			phone = rs.getString("phone");
			email = rs.getString("email");
			address = rs.getString("address");
	}
	//-------------------------------------------------------
	} catch (Exception e) {
	//   e.printStackTrace();
		System.out.println("오라클 접속 실패..");
	} finally {
		if (rs != null) { rs.close(); }
		if (pstmt != null) { pstmt.close(); }
		if (conn != null) { conn.close(); }
		System.out.println("오라클 접속 해제..");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
</head>
<body>

<table border="1" width="80%" align="center">
<tr>
	<td height="100px;" align="center">
<!-- 상단 메뉴 시작 -->
<%@ include file = "../include/inc_menu.jsp" %>
	</td>
</tr>
<tr>
	<td height="300px;" align="center">
	<h2>회원삭제</h2>
	<form name="sakjeForm">
	<input type="text" name="arg1" value="<%=id%>">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><%= id %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
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
				<td><%= address %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%= email %></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" onClick="sakje();">삭제하기</button>
				</td>
			</tr>
		</table>
		<div style="border: 0px solid blue; width: 50%; margin-top: 10px;" align="right">
		|
		<a href="#" onClick="move('list.jsp');">목록</a>
		|
		<a href="#" onClick="move('chuga.jsp');">등록</a>
		|
		<a href="#" onClick="move('sujung.jsp');">수정</a>
		|
		<a href="#" onClick="move('sakje.jsp');">삭제</a>
		|
		</div>
	</form>
	
	</td>
</tr>
<tr>
	<td height="100px;" align="center">
		<%@ include file = "../include/inc_bottom.jsp" %>
	</td>
</tr>
</table>
<%@ include file = "../include/inc_script.jsp" %>
<script>
function sakje() {
	document.sakjeForm.action="sakjeProc.jsp";
	document.sakjeForm.method="post";
	document.sakjeForm.submit();
}
</script>
</body>
</html>