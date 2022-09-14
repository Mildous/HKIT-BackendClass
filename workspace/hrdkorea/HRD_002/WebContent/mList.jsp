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
		String sql = "select m.m_name, m.m_no, m.p_school, m.m_jumin, m.m_city, ";
		sql += " (select p_tel1 from tbl_party_202005 p where p.p_code = m.p_code) tel1,";
		sql += " (select p_tel2 from tbl_party_202005 p where p.p_code = m.p_code) tel2, ";
		sql += " (select p_tel3 from tbl_party_202005 p where p.p_code = m.p_code) tel3, ";
		sql += " (select p_name from tbl_party_202005 p where p.p_code = m.p_code) p_name ";
		sql += " from tbl_member_202005 m order by m.m_no asc";

		con = DBconnect.getConnection();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<header>
	<p>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</p>
</header>
<nav>
	<p><a href="mList.jsp">후보조회</a></p>
	<p><a href="vVote.jsp">투표하기</a></p>
	<p><a href="vList.jsp">투표검수조회</a></p>
	<p><a href="mRank.jsp">후보자등수</a></p>
	<p><a href="index.jsp">홈으로</a></p>
</nav>
<section>
<p id="title">후보조회</p>
<div class="tbl">
<table border="1">
	<tr>
		<th>후보번호</th>
		<th>성명</th>
		<th>소속정당</th>
		<th>학력</th>
		<th>주민번호</th>
		<th>지역구</th>
		<th>대표전화</th>
	</tr>
<%
	while(rs.next()) {
		String school = "박사";
		if(rs.getString("p_school").trim().equals("1")) { 
			school = "고졸";
		} else if(rs.getString("p_school").trim().equals("2")) {
			school = "학사";
		} else if(rs.getString("p_school").trim().equals("3")) {
			school = "석사";
		}
		
		String jumin = rs.getString("m_jumin").substring(0, 6) + "-";
		jumin += rs.getString("m_jumin").substring(6, 13);
		
		String tel = rs.getString("tel1") + "-";
		tel += rs.getString("tel2") + "-";
		tel += rs.getString("tel3");
%>
	<tr>
		<td align="center"><%= rs.getString("m_no") %></td>
		<td align="center"><%= rs.getString("m_name") %></td>
		<td align="center"><%= rs.getString("p_name") %></td>
		<td align="center"><%= school %></td>
		<td align="center"><%= jumin %></td>
		<td align="center"><%= rs.getString("m_city") %></td>
		<td align="center"><%= tel %></td>
	</tr>
<%
	}
%>
	
</table>
</div>
</section>
<footer>
	<p>HRDKOREA Copyright&copy;2015 All right reserved. Human Resources Development Service of Korea</p>
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