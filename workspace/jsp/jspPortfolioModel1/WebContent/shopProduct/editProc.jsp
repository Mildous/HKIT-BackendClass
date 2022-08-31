<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String productPrice_ = request.getParameter("productPrice");

	Util util = new Util();
	
	int failCounter = 0;
	
	productPrice_ = util.getNullBlankCheck(productPrice_, "");
	productPrice_ = util.getCheckString(productPrice_);
	if(productPrice_.length() <= 0) { failCounter++; }
	
	if(failCounter > 0) {
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
		out.println("alert('등록 중 오류가 발생했습니다.');");
		out.println("location.href='main.jsp?menuGubun=shopProduct_edit&productCode=" + dto.getProductCode());
		out.println("</script>");
	}
%>