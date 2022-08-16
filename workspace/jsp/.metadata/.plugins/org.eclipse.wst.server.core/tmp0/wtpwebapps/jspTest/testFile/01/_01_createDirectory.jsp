<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_01_createDirectory.jsp</title>
</head>
<body>
<h2>디렉토리 만들기</h2>
<!-- C:\Users\HKIT\COY\attach -->
	
<%
	String attachPath = "C:/Users/HKIT/COY/attach";	// C:/??/attach == C:\\??\\attach
	String uploadPath = attachPath + "/testFile/aaa";
	
	//System.out.println("uploadPath : " + uploadPath);
	
	java.io.File isDir = new java.io.File(uploadPath);
	
	if(isDir.exists()) {
		System.out.println("디렉토리 존재함..");
	} else {
		System.out.println("디렉토리 존재하지 않음..");
		
		try {
			isDir.mkdirs();	//mkdir() : 폴더 1개만 생성, mkdirs() : 경로대로 폴더 생성
			System.out.println("디렉토리 생성 성공..");
		} catch(Exception e) {
			//e.printStackTrace();
			System.out.println("디렉토리 생성 실패..");
		}
		
	}
	
%>
</body>
</html>