<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_02_createFile.jsp</title>
</head>
<body>

<h2>파일 만들기</h2>
<%
	String attachPath = "C:/Users/HKIT/COY/attach";	// C:/??/attach == C:\\??\\attach
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	// System.out.println(uploadFile);
	// C:/Users/HKIT/COY/attach/testFile/aaa/test01.txt
	
	File f = new File(uploadFile);
	
	if(f.exists()) {
		System.out.println("파일이 존재함");
	} else {
		System.out.println("파일이 존재하지 않음");
	
	}
	
	if(f.createNewFile()) {
		System.out.println("파일 생성됨 : " + f.getName());
	} else {
		System.out.println("파일 생성되지 않음..");
	}
	
%>

</body>
</html>