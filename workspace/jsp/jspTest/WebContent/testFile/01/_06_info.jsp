<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_06_info.jsp</title>
</head>
<body>

<h2>파일 정보</h2>

<%
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	java.io.File f = new java.io.File(uploadFile);
	
	if(f.exists()) {
		String fileName = f.getName();
		String absPath = f.getAbsolutePath();
		long fileSize = f.length();
		
		out.println("파일명 : " + fileName + "<br>");
		out.println("절대경로 : " + absPath + "<br>");
		out.println("파일용량 : " + fileSize + "<br>");
	} else {
		out.println("파일 존재하지 않음..");
	}
	
	
%>

</body>
</html>