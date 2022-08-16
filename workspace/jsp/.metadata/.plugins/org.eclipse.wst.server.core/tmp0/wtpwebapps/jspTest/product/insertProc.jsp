<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/inc_dbinfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String pName = request.getParameter("pName");
	String pPrice_ = request.getParameter("pPrice");
	String pContent = request.getParameter("pContent");
	String pCategory = request.getParameter("pCategory");
	String pVendor = request.getParameter("pVendor");
	
	int pPrice = Integer.parseInt(pPrice_);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int result = 0;
	try {
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		System.out.println("오라클 접속 성공..");
		//-------------------------------------------------------
		String sql = "insert into product values (seq_product.nextval, ?, ?, ?, ?, ?, sysdate)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pName);
		pstmt.setInt(2, pPrice);
		pstmt.setString(3, pContent);
		pstmt.setString(4, pCategory);
		pstmt.setString(5, pVendor);
		result = pstmt.executeUpdate();
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
	
 	if (result > 0) {
		//response.sendRedirect("list.jsp");
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		//response.sendRedirect("chuga.jsp");
		out.println("<script>");
		out.println("alert('추가 처리 중 오류가 발생했습니다.');");
		out.println("location.href = 'insert.jsp';");
		out.println("</script>");
	}
%>