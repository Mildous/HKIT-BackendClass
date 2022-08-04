<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/inc_dbinfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("pw");
	String pwCheck = request.getParameter("pwCheck");
	String name = request.getParameter("name");
	String phone = request.getParameter("tel");
	String address = request.getParameter("addr");
	String email = request.getParameter("email");
/*	
	if(id == null || id.equals("")) {
		out.print("아이디가 입력되지 않았습니다.");
*/
%>
<%--
		<script>
			function move() {
				history.go(-1);
			}
			move();
		</script>
--%>
<%
/*	
		return;
	}
	if(pw == null || pw.equals("")) {
		out.print("비밀번호가 입력되지 않았습니다.");
		return;
	}
	if(pwCheck == null || pwCheck.equals("")) {
		out.print("비밀번호 확인란이 입력되지 않았습니다.");
		return;
	}
	if(!pw.equals(pwCheck)) {
		out.print("비밀번호가 다릅니다.");
		return;
	}
	if(name == null || name.equals("")) {
		out.print("이름이 입력되지 않았습니다.");
		return;
	}
	if(tel == null || tel.equals("")) {
		out.print("전화번호가 입력되지 않았습니다.");
		return;
	}
	if(addr == null || addr.equals("")) {
		out.print("주소가 입력되지 않았습니다.");
		return;
	}
	if(email == null || email.equals("")) {
		out.print("이메일이 입력되지 않았습니다.");
		return;
	}
*/	
	/*
	out.println("id: " + id + "<br>");
	out.println("pw: " + pw + "<br>");
	out.println("pwCheck: " + pwCheck + "<br>");
	out.println("name: " + name + "<br>");
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
		String sql = "insert into member (id,passwd,name,phone,email,address,regiDate) values (?,?,?,?,?,?,sysdate)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setString(4, phone);
		pstmt.setString(5, email);
		pstmt.setString(6, address);
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
		out.println("location.href = 'chuga.jsp';");
		out.println("</script>");
	}
%>