
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String sampleStr = "";
	sampleStr += name + ",";
	sampleStr += email + ",";
	sampleStr += subject + ",";
	sampleStr += content + "\n";
	
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/" + request.getContextPath();
	String uploadFile = uploadPath + "/sample.txt";
	
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
	out.println("location.href = 'write.jsp';");
	out.println("</script>");
	
	
	
	
	
	
%>
