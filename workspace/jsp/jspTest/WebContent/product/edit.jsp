<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/inc_dbinfo.jsp" %>
<%
	String arg1_ = request.getParameter("arg1");

	if(arg1_ == null || arg1_.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}
	
	int arg1 = Integer.parseInt(arg1_);
	int pCode = 0;
	String pName = "";
	int pPrice = 0;
	String pContent = "";
	String pCategory = "";
	String pVendor = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int result = 0;
	try {
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		System.out.println("오라클 접속 성공..");
		//-------------------------------------------------------
		String sql = "select * from product where productCode = ?";
		
		pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, arg1);
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	    	pCode = rs.getInt("productCode");
	    	pName = rs.getString("productName");
	    	pPrice = rs.getInt("productPrice");
	    	pContent = rs.getString("productContent");
	    	pCategory = rs.getString("productCategory");
	    	pVendor = rs.getString("vendor");
	}
		//-------------------------------------------------------
	} catch (Exception e) {
//		e.printStackTrace();
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
<title>상품정보수정</title>
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
	<h2>상품정보수정</h2>
	<form name="editForm">
		<table border="1" align="center" width="50%">
			<tr>
				<td>상품코드</td>
				<td><%= pCode %></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><%= pName %></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><%= pPrice %></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><%= pContent %></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><%= pCategory %></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><%= pVendor %></td>
			</tr>
		
		</table>
		
		<div style="border: 0px solid blue; width: 50%; margin-top: 10px;" align="right">
		|
		<a href="#" onClick="move('list.jsp');">목록</a>
		|
		<a href="#" onClick="move('insert.jsp');">등록</a>
		|
		<a href="#" onClick="move('edit.jsp', '<%= pCode%>');">수정</a>
		|
		<a href="#" onClick="move('delete.jsp', '<%= pCode%>');">삭제</a>
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
function sujung() {
	document.sujungForm.action="sujungProc.jsp";
	document.sujungForm.method="post";
	document.sujungForm.submit();
}
</script>
</body>
</html>