<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String dbNoticeNo_ = request.getParameter("dbNoticeNo");
	int dbNoticeNo = Integer.parseInt(dbNoticeNo_);
	
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	tbl = request.getParameter("tbl");
	
	int memberNo = sessionNo;
	String attachInfo = "-";
	
	SubBoardDAO subBoardDao = new SubBoardDAO();
	
	int noticeNo = 0;
	if(noticeGubun.equals("T")) {
		if(dbNoticeNo > 0) {
			noticeNo = dbNoticeNo;
		} else {
			noticeNo = subBoardDao.getMaxNumRefNoticeNo("noticeNo") + 1;
		}
	}
	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNo(no);
	arguDto.setTbl(tbl);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setMemberNo(memberNo);
	arguDto.setNoticeNo(noticeNo);
	arguDto.setSecretGubun(secretGubun);
	arguDto.setAttachInfo(attachInfo);
	
	SubBoardDTO returnDto = subBoardDao.getSelectOne(arguDto);
	if(!returnDto.getPasswd().equals(passwd)) {
		String imsiUrl = "";
		imsiUrl += "main.jsp?menuGubun=subBoard_update";
		imsiUrl += "&tbl=" + tbl;
		imsiUrl += "&no=" + no;
		imsiUrl += "&searchField=" + searchField;
		imsiUrl += "&searchWord=" + searchWord;
		out.println("<script>");
		out.println("alert('입력한 비밀번호가 다릅니다. \\n확인 후 다시 이용바랍니다.');");
		out.println("location.href='" + imsiUrl + "';");
		out.println("</script>");
		return;
	}
	
	int result = subBoardDao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=subBoard_view&tbl=" + tbl + "&no=" + no + "&searchField=" + searchField + "&searchWord=" + searchWord + "';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 실패..');");
		out.println("location.href='main.jsp?menuGubun=subBoard_update&tbl=" + tbl + "&no=" + no + "&searchField=" + searchField + "&searchWord=" + searchWord + "';");
		out.println("</script>");
	}
%>