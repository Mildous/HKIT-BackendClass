<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@page import="config.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = "";
	String subject = "";
	
	String filename1 = "";
	int fileSize1 = 0;
	
	String filename2 = "";
	int fileSize2 = 0;
	
	String attachPath = Constants.ATTACH_PATH;
	String uploadPath = attachPath + request.getContextPath() + "/testUpload";
	int maxUpload = Constants.MAX_UPLOAD;
	
	try {
		MultipartRequest multi = new MultipartRequest(
			request,
			uploadPath,
			maxUpload,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames();
		String file1 = (String)files.nextElement();
		String file2 = (String)files.nextElement();
		
		filename1 = multi.getFilesystemName(file1);
		java.io.File f1 = multi.getFile(file1);
		fileSize1 = (int)f1.length();
		
		filename2 = multi.getFilesystemName(file2);
		java.io.File f2 = multi.getFile(file2);
		fileSize2 = (int)f2.length();

	} catch(Exception e) {
		//e.printStackTrace();
	}

%>

이름 : <%= name %><br>
제목 : <%= subject %><br>

파일1 이름 : <%= filename1 %><br>
파일1 용량 : <%= fileSize1 %><br>

파일2 이름 : <%= filename2 %><br>
파일2 용량 : <%= fileSize2 %><br>

