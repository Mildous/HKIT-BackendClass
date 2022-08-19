<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String fileName = request.getParameter("fileName");
	out.println("fimeName : " + fileName);
	
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile";
	String uploadFile = uploadPath + "/" + fileName;
	
	java.io.File f = new java.io.File(uploadFile);
	
	if(f.delete()) {
		response.sendRedirect("_08_directoryList.jsp");
	} else {
		response.sendRedirect("_08_directoryList.jsp");
	}	
%>