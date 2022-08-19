<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String no_ = request.getParameter("no");
	String passwd = request.getParameter("passwd");
	int no = Integer.parseInt(no_);
	

	MemberDTO arguDto = new MemberDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=member_list';</script>");
	} else {
		String moveUrl = "main.jsp?menuGubun=member_delete&no=" + no;
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='" + moveUrl + "';");
		out.println("</script>");
	}
%>