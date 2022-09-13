<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	
	String writer = request.getParameter("writer");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	tbl = request.getParameter("tbl");
	SubBoardDAO subBoardDao = new SubBoardDAO();
	
	int num = subBoardDao.getMaxNumRefNoticeNo("num") + 1;

	// 새글일때..
	int refNo = subBoardDao.getMaxNumRefNoticeNo("refNo") + 1;
	int stepNo = 1;
	int levelNo = 1;
	int parentNo = 0;
	
	if(no > 0) {
		SubBoardDTO imsiArguDto = new SubBoardDTO();
		imsiArguDto.setNo(no);
		imsiArguDto.setTbl(tbl);
		
		SubBoardDAO imsiSubBoardDao = new SubBoardDAO();
		SubBoardDTO imsiReturnDto = imsiSubBoardDao.getSelectOne(imsiArguDto);
		
		imsiSubBoardDao.setUpdateRelevel(imsiReturnDto);
		
		refNo = imsiReturnDto.getRefNo();
		stepNo = imsiReturnDto.getStepNo() + 1;
		levelNo = imsiReturnDto.getLevelNo() + 1;
		parentNo = no;
	}
	
	int hit = 0;
	//String ip = "";
	
	int memberNo = sessionNo;
	
	int noticeNo = 0;
	if(noticeGubun.equals("T")) {
		noticeNo = subBoardDao.getMaxNumRefNoticeNo("noticeNo") + 1;
	}
	String attachInfo = "-";
	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNum(num);
	arguDto.setTbl(tbl);
	arguDto.setWriter(writer);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setRefNo(refNo);
	arguDto.setStepNo(stepNo);
	arguDto.setLevelNo(levelNo);
	arguDto.setParentNo(parentNo);
	arguDto.setHit(hit);
	arguDto.setIp(ip);
	arguDto.setMemberNo(memberNo);
	arguDto.setNoticeNo(noticeNo);
	arguDto.setSecretGubun(secretGubun);
	arguDto.setAttachInfo(attachInfo);
	
	
	int result = subBoardDao.setInsert(arguDto);
	/*
	int result = 0;
	for(int i=151; i<=200; i++) {
		arguDto.setSubject(subject + " - " + i);
		arguDto.setRefNo(i);
		arguDto.setNum(i);
		result = subBoardDao.setInsert(arguDto);
	}
	*/
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=subBoard_list&tbl=" + tbl + "';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 실패..');");
		out.println("location.href='main.jsp?menuGubun=subBoard_insert&tbl=" + tbl + "';");
		out.println("</script>");
	}
%>