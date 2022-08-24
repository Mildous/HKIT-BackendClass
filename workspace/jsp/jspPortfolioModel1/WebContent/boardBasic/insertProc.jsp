<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	BoardBasicDTO arguDto = new BoardBasicDTO();
	BoardBasicDAO dao = new BoardBasicDAO();
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	int num = dao.getMaxNum() + 1;
	int refNo = 0;
	int stepNo = 0;
	int levelNo = 0;
	int hit = 0;
	
	arguDto.setNum(num);
	arguDto.setWriter(writer);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setRefNo(refNo);
	arguDto.setStepNo(stepNo);
	arguDto.setLevelNo(levelNo);
	arguDto.setHit(hit);
	
	
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=boardBasic_list';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.');");
		out.println("location.href='main.jsp?menuGubun=boardBasic_insert';)");
		out.println("</script>");
	}
	
%>