<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	String postCode = request.getParameter("postCode");
	String address = request.getParameter("address");
	String detailAddr = request.getParameter("detailAddr");
	String extraAddr = request.getParameter("extraAddr");
	
	out.println("id : " + id + "<br>");
	out.println("pw : " + passwd + "<br>");
	out.println("name : " + name + "<br>");
	out.println("postCode : " + postCode + "<br>");
	out.println("address : " + address + "<br>");
	out.println("detailAddr : " + detailAddr + "<br>");
	out.println("extraAddr : " + extraAddr + "<br>");
	
	String postValue = "(" + postCode + ") " + address + " " + detailAddr + " " + extraAddr; 
	out.println("Address : " + postValue);

%>