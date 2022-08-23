<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_03_writeFile.jsp</title>
</head>
<body>

<h2>파일에 쓰기</h2>

<%
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	String content = "";
	//줄바꿈 : /n
	content += "홍길동,90,80,70,60,50\n";
	content += "이성순,99,88,77,66,55\n";
	
	try {
		//FileWriter fw = new FileWriter(uploadFile);	// write() : 덮어쓰기
		FileWriter fw = new FileWriter(uploadFile, true);	// append.. 기존 내용 뒤에 추가
		fw.write(content);
		fw.close();
		System.out.println("저장 성공..");
	} catch(Exception e) {
		//e.printStackTrace();
		System.out.println("저장 실패..");
		
	}
	
%>

</body>
</html>