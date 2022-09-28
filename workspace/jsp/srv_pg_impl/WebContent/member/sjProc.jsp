<%@page import="member.SjDAO"%>
<%@page import="member.SjDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String sname = request.getParameter("sname");
	
	String mun1 = request.getParameter("mun_1");
	String mun2 = request.getParameter("mun_2");
	String mun3 = request.getParameter("mun_3");
	String mun4 = request.getParameter("mun_4");
	String mun5 = request.getParameter("mun_5");
	
	SjDTO sjDto = new SjDTO();
	
	sjDto.setName(name);
	sjDto.setSname(sname);
	sjDto.setMun_1(Integer.parseInt(mun1));
	sjDto.setMun_2(Integer.parseInt(mun2));
	sjDto.setMun_3(Integer.parseInt(mun3));
	sjDto.setMun_4(Integer.parseInt(mun4));
	sjDto.setMun_5(Integer.parseInt(mun5));
	
	String[] jungdab = {"1", "2", "3", "4", "3"};
	String[] mundab = {mun1, mun2, mun3, mun4, mun5};
	ArrayList<String> oxlist = new ArrayList<String>();
	int jumsu = 0;

	
	for(int i=0; i<mundab.length; i++) {
		if(mundab[i].equals(jungdab[i])) {
			String ox = "O";
			oxlist.add(ox);
			jumsu += 20;
		} else {
			String ox = "X";
			oxlist.add(ox);
		}
	}
	
	sjDto.setMun_ox_1(oxlist.get(0));
	sjDto.setMun_ox_2(oxlist.get(1));
	sjDto.setMun_ox_3(oxlist.get(2));
	sjDto.setMun_ox_4(oxlist.get(3));
	sjDto.setMun_ox_5(oxlist.get(4));
	sjDto.setJumsu(jumsu);
	
	SjDAO dao = new SjDAO();
	int result = dao.setInsert(sjDto);
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('등록 성공');");
		out.println("location.href = 'sjList.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 실패..');");
		out.println("location.href = 'sj.jsp';");
		out.println("</script>");
	}

%>