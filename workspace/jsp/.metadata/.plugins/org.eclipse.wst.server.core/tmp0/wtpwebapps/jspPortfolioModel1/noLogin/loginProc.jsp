<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setId(id);
	arguDto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO returnDto = dao.getLogin(arguDto);
	
	// 세션(session) - 서버에 저장
	if(returnDto.getNo() > 0) {
		session.setAttribute("sessionNo", returnDto.getNo());	//회원 번호
		session.setAttribute("sessionId", id);	//회원 아이디
		session.setAttribute("sessionName",  returnDto.getName());	//회원 이름
		session.setAttribute("sessionGrade",  returnDto.getGrade());	//회원 등급
		
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("location.href='main.jsp?menuGubun=dashBoard_list';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록된 정보가 없습니다.\\n확인 후 다시 로그인 바랍니다.');");
		out.println("location.href='main.jsp?menuGubun=noLogin_login';");
		out.println("</script>");
	}

%>