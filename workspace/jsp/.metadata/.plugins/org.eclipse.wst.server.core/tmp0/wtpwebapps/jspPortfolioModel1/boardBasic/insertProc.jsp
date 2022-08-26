<%@page import="config.Util"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	
	Util util = new Util();
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	BoardBasicDAO dao = new BoardBasicDAO();
	
	String writer = request.getParameter("writer");
	writer = util.getNullBlankCheck(writer, "");
	writer = util.getCheckString(writer);
	
	String subject = request.getParameter("subject");
	subject = util.getNullBlankCheck(subject, "");
	subject = util.getCheckString(subject);
	
	String content = request.getParameter("content");
	content = util.getNullBlankCheck(content, "");
	content = util.getCheckString(content);
	
	String email = request.getParameter("email");
	email = util.getNullBlankCheck(email, "");
	email = util.getCheckString(email);
	
	String passwd = request.getParameter("passwd");
	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	int num = dao.getMaxNum() + 1;
	int hit = 0;
	int refNo = dao.getMaxRef() + 1;
	int stepNo = 1;
	int levelNo = 0;
	int parentNo = 0;
	
	if(no > 0) {	//답글일때	
		BoardBasicDTO dto = new BoardBasicDTO();
		dto.setNo(no);
		BoardBasicDTO resultDto = dao.getSelectOne(dto);
		refNo = resultDto.getRefNo();
		stepNo = resultDto.getStepNo() + 1;
		dao.updateLevelNo(refNo, resultDto.getLevelNo());
		levelNo =  resultDto.getLevelNo()+1;
		parentNo = no;
	}
	levelNo += 1;
	
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
	arguDto.setParentNo(parentNo);
	//arguDto.setMemberNo(memberNo);
	//arguDto.setIp(ip);
	
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