package project.board.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.board.model.dao.BoardDAO;
import project.board.model.dto.BoardDTO;
import project.common.Pagenation;
import project.common.Util;

@WebServlet("/board_servlet/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Util util = new Util();
		
		String[] serverInfo = util.getSeverInfo(request);
		String referer = serverInfo[0];
		String path = serverInfo[1];
		String url = serverInfo[2];
		String uri = serverInfo[3];
		String ip = serverInfo[4];
		String ip6 = serverInfo[5];
		String folderName = serverInfo[6];
		String fileName = serverInfo[7];
		
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
		request.setAttribute("path", path);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		request.setAttribute("ip", ip);
		
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		String pageNum_ = request.getParameter("pageNum");
		int pageNum = util.getNumberCheck(pageNum_, 1);
		
		String imsiSearchYN = "Y";
		searchField = util.getNullBlankCheck(searchField);
		searchWord = util.getNullBlankCheck(searchWord);
		if(searchField.equals("") || searchWord.equals("")) {
			imsiSearchYN = "N";
			searchField = "";
			searchWord = "";
		}
		
		searchField = URLDecoder.decode(searchField, "UTF-8");
		searchWord = URLDecoder.decode(searchWord, "UTF-8");
		
		String searchQuery = "searchField=&searchWord=";
		if(imsiSearchYN.equals("Y")) {
			String imsisearchField = URLEncoder.encode(searchField, "UTF-8");
			String imsisearchWord = URLEncoder.encode(searchWord, "UTF-8");
			searchQuery = "searchField=" + imsisearchField + "&searchWord=" + imsisearchWord;
		}
		
		request.setAttribute("searchField", searchField);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("searchQuery", searchQuery);
		request.setAttribute("pageNum", pageNum);
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		
		if(fileName.equals("list")) {
			BoardDTO dto = new BoardDTO();
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			/* 페이징 처리 */
			int pageSize = 10;
			int blockSize = 5;
			
			BoardDAO dao = new BoardDAO();
			int totalRecord = dao.getTotalRecord(dto);
			int startRecord = pageSize * (pageNum - 1) + 1;
			int lastRecord = pageSize * pageNum;
			
			BoardDTO listDto = new BoardDTO();
			listDto.setStartRecord(startRecord);
			listDto.setLastRecord(lastRecord);
			listDto.setSearchField(searchField);
			listDto.setSearchWord(searchWord);
			
			ArrayList<BoardDTO> list = dao.getSelectAll(listDto);
			Map<String, Object> map = new HashMap<String, Object>();
			String pagingImg = Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, path + "/guestBook_servlet/guestBook_list.do", searchField, searchWord);
			
			map.put("pagingImg", pagingImg);
			map.put("totalRecord", totalRecord);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
			
			request.setAttribute("board", list);
			request.setAttribute("map", map);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0) {
				return;
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			BoardDAO dao = new BoardDAO();
			dao.setUpdateHit(arguDto);
			BoardDTO dto = dao.getSelectOne(arguDto);

			String content = dto.getContent().replaceAll("\n", "<br>");
			
			request.setAttribute("dto", dto);
			request.setAttribute("content", content);
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		} else if(fileName.equals("regi")) {
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		} else if(fileName.equals("edit")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0) {
				return;
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			BoardDAO dao = new BoardDAO();
			dao.setUpdateHit(arguDto);
			BoardDTO dto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("drop")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0) {
				return;
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			BoardDAO dao = new BoardDAO();
			dao.setUpdateHit(arguDto);
			BoardDTO dto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		} else if(fileName.equals("search")) {
			String moveUrl = "";
			moveUrl += path + "/board_servlet/board_list.do?" + searchQuery;
			
			response.sendRedirect(moveUrl);
			
		}
		
		// ============ process ==============
		if(fileName.equals("regiProc")) {
			String writer = request.getParameter("writer");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String noticeGubun = request.getParameter("noticeGubun");
			String secretGubun = request.getParameter("secretGubun");
			
			
			writer = util.getNullBlankCheck(writer);
			email = util.getNullBlankCheck(email);
			passwd = util.getNullBlankCheck(passwd);
			content = util.getNullBlankCheck(content);
			subject = util.getNullBlankCheck(subject);
			noticeGubun = util.getNullBlankCheck(noticeGubun);
			secretGubun = util.getNullBlankCheck(secretGubun);
			
			int failCounter = 0;
			if(writer.equals("")) { failCounter++; }
			if(email.equals("")) { failCounter++; }
			if(passwd.equals("")) { failCounter++; }
			if(content.equals("")) { failCounter++; }
			if(subject.equals("")) { failCounter++; }
			if(noticeGubun.equals("")) { failCounter++; }
			if(secretGubun.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				return;
			}
			writer = util.getCheckString(writer);
			email = util.getCheckString(email);
			passwd = util.getCheckString(passwd);
			content = util.getCheckString(content);
			
			BoardDTO dto = new BoardDTO();
			dto.setWriter(writer);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			
			BoardDAO dao = new BoardDAO();
			
			int num = dao.getMaxNumRefNo("num") + 1;
			String tbl = "-";
			
			// 새글일때..
			int refNo = dao.getMaxNumRefNo("refNo") + 1;
			int stepNo = 1;
			int levelNo = 1;
			int parentNo = 0;
			
			// 답변글일때..
			if(dto.getNo() > 0) {
				dao.setUpdateRelevel(dto);
				refNo = dto.getRefNo();
				stepNo = dto.getStepNo() + 1;
				levelNo = dto.getLevelNo() + 1;
				parentNo = dto.getNo();
				
			}
			
			int hit = 0;
			int memberNo = sessionNo;
			int noticeNo = 0;
			if(noticeGubun.equals("T")) {	// 공지글일 경우..
				noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;
			}
			
			String attachInfo = "-";
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNum(num);
			arguDto.setTbl(tbl);
			arguDto.setWriter(writer);
			arguDto.setSubject(subject);
			arguDto.setContent(content);
			arguDto.setEmail(email);
			arguDto.setPasswd(passwd);
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
			
			int result = dao.setInsert(arguDto);
			
			
			if(result > 0) {
				response.sendRedirect(path + "/board_servlet/board_list.do");
			} else {
				response.sendRedirect(path + "/board_servlet/board_regi.do");
			}
			
		} else if(fileName.equals("editProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0) {
				return;
			}
			String passwd = request.getParameter("passwd");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String noticeGubun = request.getParameter("noticeGubun");
			String secretGubun = request.getParameter("secretGubun");
			
			passwd = util.getNullBlankCheck(passwd);
			content = util.getNullBlankCheck(content);
			subject = util.getNullBlankCheck(subject);
			noticeGubun = util.getNullBlankCheck(noticeGubun);
			secretGubun = util.getNullBlankCheck(secretGubun);
			
			int failCounter = 0;
			if(passwd.equals("")) { failCounter++; }
			if(content.equals("")) { failCounter++; }
			if(subject.equals("")) { failCounter++; }
			if(noticeGubun.equals("")) { failCounter++; }
			if(secretGubun.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				return;
			}
			
			passwd = util.getCheckString(passwd);
			content = util.getCheckString(content);
			
			int memberNo = sessionNo;
			int noticeNo = 0;
			BoardDTO dto = new BoardDTO();
			BoardDAO dao = new BoardDAO();
			dto.setNo(no);
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			dto = dao.getSelectOne(dto);
			
			if(noticeGubun.equals("T")) {
				if(dto.getNoticeNo() > 0) {	// 기존 글이 공지글이면..
					noticeNo = dto.getNoticeNo();
				} else {	// 기존 글이 공지글이 아니면..
					noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;
				}
			}
			
			String attachInfo = dto.getAttachInfo();
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(dto.getNo());
			arguDto.setSubject(subject);
			arguDto.setContent(content);
			arguDto.setPasswd(passwd);
			arguDto.setMemberNo(memberNo);
			arguDto.setNoticeNo(noticeNo);
			arguDto.setSecretGubun(secretGubun);
			arguDto.setAttachInfo(attachInfo);
			
			BoardDAO editDao = new BoardDAO();
			int result = editDao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/board_servlet/board_view.do?no=" + dto.getNo());
			} else {
				response.sendRedirect(path + "/board_servlet/board_edit.do?no=" + dto.getNo());
			}
			
		
		} else if(fileName.equals("dropProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0) {
				return;
			}
			String passwd = request.getParameter("passwd");
			
			passwd = util.getNullBlankCheck(passwd);
			
			int failCounter = 0;
			if(passwd.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				return;
			}
			
			passwd = util.getCheckString(passwd);
			
			BoardDTO dto = new BoardDTO();
			dto.setNo(no);
			dto.setPasswd(passwd);
			
			BoardDAO dao = new BoardDAO();
			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/board_servlet/board_list.do");
			} else {
				response.sendRedirect(path + "/board_servlet/board_drop.do?no=" + dto.getNo());
			}
			
		}
		
		
	}
}
