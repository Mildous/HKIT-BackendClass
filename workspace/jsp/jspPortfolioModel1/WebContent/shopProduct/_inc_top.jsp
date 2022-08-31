<%@page import="java.util.ArrayList"%>
<%@page import="config.Util"%>
<%@page import="product.model.dao.ProductDAO"%>
<%@page import="product.model.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	ProductDAO dao = null;
	ProductDTO dto = null;
	int ProductCode = 0;
	if( fileName.equals("regi") || fileName.equals("regiProc") || fileName.equals("view") || fileName.equals("edit") || fileName.equals("editProc") || fileName.equals("drop") || fileName.equals("dropProc")) {
		String productCode_ = request.getParameter("productCode");
		if(productCode_ == null || productCode_.trim().equals("")) {
			productCode_ = "0";
		}
		ProductCode = Integer.parseInt(productCode_);
		
		ProductDTO arguDto = new ProductDTO();
		arguDto.setProductCode(ProductCode);
			
		dao = new ProductDAO();	
		dto = dao.getSelectOne(arguDto);
	}
	
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + request.getContextPath() + "/product";	// "/jspPortfolioModel1/product";
	int maxUpload = 1024 * 1024 * 100;	// 업로드 할 수 있는 최대 용량: 100mb
	String encoding = "UTF-8";
%>
