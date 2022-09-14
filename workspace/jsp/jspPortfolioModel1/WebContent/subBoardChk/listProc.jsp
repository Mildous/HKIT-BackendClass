<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String procGubun = request.getParameter("procGubun");
	String boardChkNo_ = request.getParameter("boardChkNo");
	String tbl = request.getParameter("tbl");
	String tblName = request.getParameter("tblName");
	
	int errorCounter = 0;
	if(boardChkNo_ == null || boardChkNo_.trim().equals("")) {
		boardChkNo_ = "0";
	}
	
	int boardChkNo = Integer.parseInt(boardChkNo_);

	if(tbl == null || tbl.trim().equals("")) {
		errorCounter++;
	}
	
	if(tblName == null || tblName.trim().equals("")) {
		errorCounter++;
	}
	
	if(errorCounter > 0) {
		return;
	}
	
	// tbl -> 중복체크 해야 함..
	
	SubBoardChkDTO arguDto = new SubBoardChkDTO();
	arguDto.setBoardChkNo(boardChkNo);
	arguDto.setTbl(tbl);
	arguDto.setTblName(tblName);
	
	SubBoardChkDAO dao = new SubBoardChkDAO();
	int result = 0;
	
	if(procGubun.equals("insertProc")) {
		result = dao.setInsert(arguDto);
	} else if(procGubun.equals("updateProc")) {
		result = dao.setUpdate(arguDto);
	} else if(procGubun.equals("deleteProc")) {
		result = dao.setDelete(arguDto);
	}
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('처리 성공!');");
		out.println("location.href='main.jsp?menuGubun=subBoardChk_list'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('처리 실패..');");
		out.println("location.href='main.jsp?menuGubun=subBoardChk_list'");
		out.println("</script>");
	}

%>