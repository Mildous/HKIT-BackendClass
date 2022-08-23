<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/inc_dbinfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String arg1 = request.getParameter("arg1");
	
	if(arg1 == null || arg1.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}
	
	String passwd = request.getParameter("pw");
	String phone = request.getParameter("tel");
	String address = request.getParameter("addr");
	String email = request.getParameter("email");
	

	if(passwd == null || passwd.equals("")) {
		out.print("비밀번호가 입력되지 않았습니다.");
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


	if(phone == null || phone.equals("")) {
		out.print("전화번호가 입력되지 않았습니다.");
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
	if(address == null || address.equals("")) {
		out.print("주소가 입력되지 않았습니다.");
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
	if(email == null || email.equals("")) {
		out.print("이메일이 입력되지 않았습니다.");
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
/*
	out.println("arg1: " + arg1 + "<br>");
	out.println("pw: " + pw + "<br>");
	out.println("tel: " + tel + "<br>");
	out.println("addr: " + addr + "<br>");
	out.println("email: " + email + "<br>");
*/
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

int result = 0;
try {
	Class.forName(dbDriver);
	conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	System.out.println("오라클 접속 성공..");
	//-------------------------------------------------------
	String sql = "update member set phone = ?, email = ?, address = ? where id = ? and passwd = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, phone);
	pstmt.setString(2, email);
	pstmt.setString(3, address);
	pstmt.setString(4, arg1);
	pstmt.setString(5, passwd);
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
	out.println("location.href = 'sujung.jsp?arg1=" + arg1 + "';");
	out.println("</script>");
}
	//response.sendRedirect("view.jsp");
%>

<a href="#" onclick="movePage();">[목록 페이지로]</a>