<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	MemoDTO arguDto = new MemoDTO();
	MemoDAO dao = new MemoDAO();
	
	arguDto.setNo(no);
	
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=memo_list';</script>");
	} else {
		String moveUrl = "main.jsp?menuGubun=memo_delete&no=" + no;
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='" + moveUrl + "';");
		out.println("</script>");
	}
%>