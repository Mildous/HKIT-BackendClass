<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwCheck = request.getParameter("pwCheck");
	String name = request.getParameter("name");
	String phone = request.getParameter("tel");
	String address = request.getParameter("addr");
	String email = request.getParameter("email");
	
	if(!pw.equals(pwCheck)) {
		out.print("비밀번호가 다릅니다.");
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
	
	String sampleStr = "";
	sampleStr += id + "/";
	sampleStr += pw + "/";
	sampleStr += name + "/";
	sampleStr += phone + "/";
	sampleStr += address + "/";
	sampleStr += email + "\n";
	
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/" + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	String ment = "";
	
	try {
		FileWriter fw = new FileWriter(uploadFile, true);
		fw.write(sampleStr);
		fw.close();
		//response.sendRedirect("write.jsp");
		ment = "저장 성공..";
	} catch(Exception e) {
		//e.printStackTrace();
		ment = "저장 실패..";
	}
	out.println("<script>");
	out.println("alert('" + ment + "');");
	out.println("location.href = 'list.jsp';");
	out.println("</script>");
	
%>