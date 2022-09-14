<%@page import="DBPKG.DBconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String custno_ = request.getParameter("custno");
	int custno = Integer.parseInt(custno_);
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate").replaceAll("-", "");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	
	try {
		con = DBconnect.getConnection();
		String sql = "update member_tbl_02 set ";
		sql += " custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? ";
		sql += " where custno = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setInt(7, custno);
		result = pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
		System.out.println("DB 연결 해제");
	}
	
	if(result > 0) {
%>
	<script>
		alert("회원수정이 완료되었습니다!");
		history.back();
	</script>
	
<%	} else {	%>
	<script>
		alert("회원수정에 실패하였습니다..");
		history.back();
	</script>
<%	}	%>