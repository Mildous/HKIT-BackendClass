<%@page import="DBPKG.DBconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	try {
		con = DBconnect.getConnection();
		String sql = "select max(custno) + 1 seq from member_tbl_02";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int custno = 100001;
		if(rs.next()) {
			custno = rs.getInt("seq");
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver1.0</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<script>
function validateForm(form) {
	if(form.custname.value == "") {
		alert('회원성명이 입력되지 않았습니다');
		form.custname.focus();
		return false;
	}
	if(form.phone.value == "") {
		alert('회원전화가 입력되지 않았습니다');
		form.phone.focus();
		return false;
	}
	if(form.address.value == "") {
		alert('회원주소가 입력되지 않았습니다');
		form.address.focus();
		return false;
	}
	if(form.joindate.value == "") {
		alert('가입일자가 입력되지 않았습니다');
		form.joindate.focus();
		return false;
	}
	if(form.grade.value == "") {
		alert('회원등급이 입력되지 않았습니다');
		form.grade.focus();
		return false;
	}
	if(form.city.value == "") {
		alert('도시코드가 입력되지 않았습니다');
		form.city.focus();
		return false;
	}
}
</script>

</head>
<body>
<header>
	<h2>쇼핑몰 회원관리 ver1.0</h2>
</header>

<nav>
	<div class="menu"><a href="mJoin.jsp">회원등록</a></div>
	<div class="menu"><a href="mList.jsp">회원목록조회/수정</a></div>
	<div class="menu"><a href="sList.jsp">회원매출조회</a></div>
	<div class="menu"><a href="index.jsp">홈으로</a></div>
</nav>

<section>
<h3>홈쇼핑 회원 등록</h3>
<div class="tbl">
<form name="joinForm" method="post" action="mJoinProc.jsp" onsubmit="return validateForm(this);">
<table border="1">
	<tr>
		<th>회원번호(자동발생)</th>
		<td width="50%"><input type="text" name="custno" value="<%= custno %>" style="width: 100px;" readonly /></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname" style="width: 100px;"/></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone" /></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type="text" name="address" style="width: 200px;"/></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type="text" name="joindate" style="width: 100px;" /></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP, B:일반, C:직원]</th>
		<td><input type="text" name="grade" style="width: 100px;"/></td>
	</tr>
	<tr>
		<th>도시코드</th>
		<td><input type="text" name="city" style="width: 100px;" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit" >등 록</button>
			<button type="button" onclick="location.href='mList.jsp';">조 회</button>
		</td>
	</tr>
</table>
</form>
</div>
</section>

<footer>
	<p>HRDKOREA Copyright&copy;2016 All right reserved. Human Resources Development Service of Korea</p>
</footer>
</body>
</html>
<%
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
		System.out.println("DB 연결 해제");
	}

%>