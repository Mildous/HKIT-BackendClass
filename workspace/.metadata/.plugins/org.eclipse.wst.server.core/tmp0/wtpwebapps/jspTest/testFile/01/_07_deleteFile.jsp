<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_07_deleteFile.jsp</title>
</head>
<body>

<h2>파일 삭제</h2>

<%
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	java.io.File f = new java.io.File(uploadFile);
	
	if(f.delete()) {
		out.println("파일 삭제 됨 : " + f.getName());
	} else {
		out.println("파일 삭제되지 않음..");
	}

%>
	
</body>
</html>