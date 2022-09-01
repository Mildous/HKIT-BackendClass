<%@page import="product.model.dto.ProductDTO"%>
<%@page import="product.model.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	ProductDAO dao = null;
	ProductDTO dto = null;
	int productCode = 0;
	if( fileName.equals("regi") || fileName.equals("regiProc") || fileName.equals("view") || fileName.equals("edit") || fileName.equals("editProc") || fileName.equals("drop") || fileName.equals("dropProc")) {
		String productCode_ = request.getParameter("productCode");
		if(productCode_ == null || productCode_.trim().equals("")) {
			productCode_ = "0";
		}
		productCode = Integer.parseInt(productCode_);
		
		ProductDTO arguDto = new ProductDTO();
		arguDto.setProductCode(productCode);
			
		dao = new ProductDAO();	
		dto = dao.getSelectOne(arguDto);
	}
%>