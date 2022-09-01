<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	Util util = new Util();
	int failCount = 0;
	
	String productPrice_ = request.getParameter("productPrice");
	productPrice_ = util.getNullBlankCheck(productPrice_, "");
	productPrice_ = util.getCheckString(productPrice_);
	if(productPrice_.length() <= 0) { failCount++; }

	if(failCount > 0) {
		out.println("<script>");
		out.println("alert('입력값이 정확하지 않습니다.');");
		out.println("location.href = 'main.jsp?menuGubun=shopProduct_list';");
		out.println("</script>");
		return;
	}
	
	int productPrice = Integer.parseInt(productPrice_);
	ProductDTO arguDto = new ProductDTO();
	arguDto.setProductPrice(productPrice);
	arguDto.setProductCode(dto.getProductCode());
	
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=shopProduct_list';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.');");
		out.println("location.href='main.jsp?menuGubun=shopProduct_edit&productCode=" + dto.getProductCode());
		out.println("</script>");
	}
%>