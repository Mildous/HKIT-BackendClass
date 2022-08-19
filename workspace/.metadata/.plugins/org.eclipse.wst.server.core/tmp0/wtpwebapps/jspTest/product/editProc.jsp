<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/inc_dbinfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String arg1_ = request.getParameter("arg1");
	
	if(arg1_ == null || arg1_.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}
	
	int arg1 = Integer.parseInt(arg1_);
	String pPrice_ = request.getParameter("pPrice");
	String pContent = request.getParameter("pContent");
	String pVendor = request.getParameter("pVendor");
	
	int pPrice = Integer.parseInt(pPrice_);
	

	if(pPrice_ == null || pPrice_.equals("")) {
		out.print("상품가격이 입력되지 않았습니다.");
		%>
		<script>
			function move() {
				history.go(-1);
			}
			move();
		</script>
<%
		return;
	}


	if(pContent == null || pContent.equals("")) {
		out.print("상품정보가 입력되지 않았습니다.");
		%>
		<script>
			function move() {
				history.go(-1);
			}
			move();
		</script>
<%
		return;
	}
	if(pVendor == null || pVendor.equals("")) {
		out.print("제조사가 입력되지 않았습니다.");
		%>
		<script>
			function move() {
				history.go(-1);
			}
			move();
		</script>
<%
		return;
	}
	
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

int result = 0;
try {
	Class.forName(dbDriver);
	conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	System.out.println("오라클 접속 성공..");
	//-------------------------------------------------------
	String sql = "update product set productPrice = ?, productContent = ?, Vendor = ? where productCode = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, pPrice);
	pstmt.setString(2, pContent);
	pstmt.setString(3, pVendor);
	pstmt.setInt(4, arg1);
	result = pstmt.executeUpdate();
	
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
if (result > 0) {
	//response.sendRedirect("list.jsp");
	out.println("<script>");
	//out.println("alert('정상적으로 수정되었습니다.');");
	out.println("location.href = 'view.jsp?arg1=" + arg1 + "';");
	out.println("</script>");
} else {
	//response.sendRedirect("chuga.jsp");
	out.println("<script>");
	out.println("alert('수정 처리 중 오류가 발생했습니다.');");
	out.println("location.href = 'edit.jsp?arg1=" + arg1 + "';");
	out.println("</script>");
}
	//response.sendRedirect("view.jsp");
%>

<a href="#" onclick="movePage();">[목록 페이지로]</a>