<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="config.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String attachPath = Constants.ATTACH_PATH;
String uploadPath = attachPath + request.getContextPath();	// 프로젝트 이름(/포함)
String uploadFile = uploadPath + "/sungjuk.txt";

java.io.File isDir = new java.io.File(uploadPath);
if(!isDir.exists()) {	// 디렉토리가 존재하지 않으면
	try { 
		isDir.mkdirs();	// 디렉토리 생성
	} catch(Exception e) {
		//e.printStackTrace();
	}
}

java.io.File f = new java.io.File(uploadFile);
if(!f.exists()) {	// 파일이 존재하지 않으면 
	f.createNewFile();
}

%>