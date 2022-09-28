<%@page import="member.ProductDAO"%>
<%@page import="member.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String cate = request.getParameter("cate");
	String pname = request.getParameter("pname");
	String price_ = request.getParameter("price");
	int price = Integer.parseInt(price_);
	
	ProductDTO dto = new ProductDTO();
	ProductDAO dao = new ProductDAO();
	
	dto.setCate(cate);
	dto.setPname(pname);
	dto.setPrice(price);
	
	int result = dao.setInsert(dto);
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('등록 성공');");
		out.println("location.href = 'product.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 실패..');");
		out.println("location.href = 'product.jsp';");
		out.println("</script>");
	}

%>