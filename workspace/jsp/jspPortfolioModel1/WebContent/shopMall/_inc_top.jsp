<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList" %>

<%@ page import = "shopMall.model.dao.CartDAO" %>
<%@ page import = "shopMall.model.dto.CartDTO" %>

<%@ page import = "product.model.dao.ProductDAO" %>
<%@ page import = "product.model.dto.ProductDTO" %>

<%@ include file = "../_include/inc_header.jsp" %>
<%@ include file = "../_include/inc_sessionChk.jsp" %>

<%
	String pageNum_ = request.getParameter("pageNum");
	if(pageNum_ == null || pageNum_.trim().equals("")) {
		pageNum_ = "1";
	}
	int pageNum = Integer.parseInt(pageNum_);
%>