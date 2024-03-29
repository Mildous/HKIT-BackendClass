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
		String sql = "select m1.custno, m1.custname, m1.grade, sum(price) sales";
		sql += " from member_tbl_02 m1 inner join money_tbl_02 m2";
		sql += " on m1.custno = m2.custno group by m1.custno, m1.custname, m1.grade";
		sql += " order by sum(price) desc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver1.0</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
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
<h3>회원매출조회</h3>

<div class="tbl2">
<table border="1" width="50%">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
<%
	while(rs.next()) {
		String grade = "직원";
		if(rs.getString("grade").trim().equals("A")) {
			grade = "VIP";
		} else if(rs.getString("grade").trim().equals("B")) {
			grade = "일반";
		}
%>
	<tr>
		<td align="center"><%= rs.getInt("custno") %></td>
		<td align="center"><%= rs.getString("custname") %></td>
		<td align="center"><%= grade %></td>
		<td align="center"><%= rs.getString("sales") %></td>
	</tr>
<%
	}
%>	
</table>
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