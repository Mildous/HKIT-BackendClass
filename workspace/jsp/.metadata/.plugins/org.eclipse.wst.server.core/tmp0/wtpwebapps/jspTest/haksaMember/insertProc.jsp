<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String parentPhone = request.getParameter("parentPhone");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String addr3 = request.getParameter("addr3");
	String addr4 = request.getParameter("addr4");
	
	if (addr4 == null || addr4.trim().equals("")) {
		addr4 = "-";
	}
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setName(name);
	arguDto.setPhone(phone);
	arguDto.setParentPhone(parentPhone);
	arguDto.setAddr1(addr1);
	arguDto.setAddr2(addr2);
	arguDto.setAddr3(addr3);
	arguDto.setAddr4(addr4);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'insert.jsp';");
		out.println("</script>");
	}
%>