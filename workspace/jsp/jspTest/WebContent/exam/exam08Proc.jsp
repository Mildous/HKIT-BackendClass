<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String hobby1 = request.getParameter("hobby1");
	String hobby2 = request.getParameter("hobby2");
	String hobby3 = request.getParameter("hobby3");
	String hobby4 = request.getParameter("hobby4");
	String hobby5 = request.getParameter("hobby5");
	String hobby6 = request.getParameter("hobby6");
	String hobby7 = request.getParameter("hobby7");
	String hobby8 = request.getParameter("hobby8");
	String hobby9 = request.getParameter("hobby9");
	
	//선택하지 않은 checkbox는 null로 출력
	out.println("hobby1 : " + hobby1 + "<br>");
	out.println("hobby2 : " + hobby2 + "<br>");
	out.println("hobby3 : " + hobby3 + "<br>");
	out.println("hobby4 : " + hobby4 + "<br>");
	out.println("hobby5 : " + hobby5 + "<br>");
	out.println("hobby6 : " + hobby6 + "<br>");
	out.println("hobby7 : " + hobby7 + "<br>");
	out.println("hobby8 : " + hobby8 + "<br>");
	out.println("hobby9 : " + hobby9 + "<br>");
%>
<br><hr><br>
<%
	//공백과 null을 같이 체크할 때는 null처리를 먼저 해야한다.
	//null은 값이 없기때문에 공백을 인식하지 못해서 에러가 발생한다.
	if(hobby1 == null || hobby2.equals("")) {
		out.print("hahahaha");
		return;
	}

	String hobby = "";
	if(hobby1 != null) { hobby += "," + hobby1; }
	if(hobby2 != null) { hobby += "," + hobby2; }
	if(hobby3 != null) { hobby += "," + hobby3; }
	if(hobby4 != null) { hobby += "," + hobby4; }
	if(hobby5 != null) { hobby += "," + hobby5; }
	if(hobby6 != null) { hobby += "," + hobby6; }
	if(hobby7 != null) { hobby += "," + hobby7; }
	if(hobby8 != null) { hobby += "," + hobby8; }
	if(hobby9 != null) { hobby += "," + hobby9; }
	
	hobby = hobby.substring(1);
	out.println("hobby : " + hobby + "<br>");
%>