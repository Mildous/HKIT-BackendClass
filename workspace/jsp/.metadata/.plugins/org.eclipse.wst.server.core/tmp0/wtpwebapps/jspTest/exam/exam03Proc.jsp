<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String jumin1 = request.getParameter("num1");
	String jumin2 = request.getParameter("num2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String email = request.getParameter("email");
	String email2 = request.getParameter("email2");
	
	String born_ = jumin1.substring(0, 2);
	int born = Integer.parseInt(born_);
	int age = 100 - born + 22;
	
	String gen_ = jumin2.substring(0, 1);
	int gen = Integer.parseInt(gen_);
	String gender = "";
	if(gen == 1 || gen == 3) {
		gender = "남자";
	} else if (gen == 2 || gen == 4) {
		gender = "여자";
	}
%>

당신의 이름은 <%= name %> 입니다.<br>
당신의 주민번호는 <%= jumin1 + " - " + jumin2 %> 입니다.<br>
당신의 연락처는 <%= tel1 + " - " + tel2 + " - " + tel3 %> 입니다.<br>
당신의 이메일은 <%= email + "@" + email2 %> 입니다.<br>
당신의 나이는 <%= age %>세 입니다.<br>
당신의 성별은 <%= gender %>입니다.