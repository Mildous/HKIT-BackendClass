package project.guestBook.controller;

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

import project.common.Pagenation;
import project.common.Util;
import project.guestBook.model.dao.GuestBookDAO;
import project.guestBook.model.dto.GuestBookDTO;

@WebServlet("/guestBook_servlet/*")
public class GuestBookController extends HttpServlet {
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
			GuestBookDTO dto = new GuestBookDTO();
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			/* 페이징 처리 */
			int pageSize = 10;
			int blockSize = 5;
			GuestBookDAO dao = new GuestBookDAO();
			
			int totalRecord = dao.getTotalRecord(dto);
			
			int startRecord = pageSize * (pageNum - 1) + 1;
			int lastRecord = pageSize * pageNum;
			
			GuestBookDTO listDto = new GuestBookDTO();
			listDto.setStartRecord(startRecord);
			listDto.setLastRecord(lastRecord);
			listDto.setSearchField(searchField);
			listDto.setSearchWord(searchWord);
			
			ArrayList<GuestBookDTO> list = dao.getSelectAll(listDto);
			Map<String, Object> map = new HashMap<String, Object>();
			String pagingImg = Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, path + "/guestBook_servlet/guestBook_list.do", searchField, searchWord);
			
			map.put("pagingImg", pagingImg);
			map.put("totalRecord", totalRecord);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
			
			request.setAttribute("guestBook", list);
			request.setAttribute("map", map);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("view")) {
			int no = Integer.parseInt(request.getParameter("no"));
			GuestBookDTO arguDto = new GuestBookDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			GuestBookDAO dao = new GuestBookDAO();
			GuestBookDTO dto = dao.getSelectOne(arguDto);
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("dto", dto);
			request.setAttribute("content", content);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("regi")) {
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("edit")) {
			int no = Integer.parseInt(request.getParameter("no"));
			GuestBookDTO arguDto = new GuestBookDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			GuestBookDAO dao = new GuestBookDAO();
			GuestBookDTO dto = dao.getSelectOne(arguDto);
			
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("content", content);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("drop")) {
			int no = Integer.parseInt(request.getParameter("no"));
			GuestBookDTO arguDto = new GuestBookDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			GuestBookDAO dao = new GuestBookDAO();
			GuestBookDTO dto = dao.getSelectOne(arguDto);
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("content", content);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("search")) {
			String moveUrl = "";
			moveUrl += path + "/guestBook_servlet/guestBook_list.do?" + searchQuery;
			
			response.sendRedirect(moveUrl);
		}
		
		// ============ process ==============
		if(fileName.equals("regiProc")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			name = util.getNullBlankCheck(name);
			email = util.getNullBlankCheck(email);
			passwd = util.getNullBlankCheck(passwd);
			content = util.getNullBlankCheck(content);
			
			int failCounter = 0;
			if(name.equals("")) { failCounter++; }
			if(email.equals("")) { failCounter++; }
			if(passwd.equals("")) { failCounter++; }
			if(content.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				return;
			}
			name = util.getCheckString(name);
			email = util.getCheckString(email);
			passwd = util.getCheckString(passwd);
			content = util.getCheckString(content);
			
			GuestBookDTO dto = new GuestBookDTO();
			dto.setName(name);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			
			GuestBookDAO dao = new GuestBookDAO();
			int result = dao.setInsert(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/guestBook_servlet/guestBook_list.do");
			} else {
				response.sendRedirect(path + "/guestBook_servlet/guestBook_regi.do");
			}
			
		} else if(fileName.equals("editProc")) {
			String content = request.getParameter("content");
			String passwd = request.getParameter("passwd");
			String email = request.getParameter("email");
			int no = Integer.parseInt(request.getParameter("no"));
			
			content = util.getNullBlankCheck(content);
			passwd = util.getNullBlankCheck(passwd);
			email = util.getNullBlankCheck(email);
			
			no = util.getNumberCheck(no + "", 0);
			int failCounter = 0;
			if(content.equals("")) { failCounter++; }
			if(email.equals("")) { failCounter++; }
			if(passwd.equals("")) { failCounter++; }
			if(no == 0) { failCounter++; }
			if(failCounter > 0) {
				return;
			}
			
			content = util.getCheckString(content);
			passwd = util.getCheckString(passwd);
			email = util.getCheckString(email);
			
			GuestBookDTO dto = new GuestBookDTO();
			dto.setEmail(email);
			dto.setContent(content);
			dto.setNo(no);
			dto.setPasswd(passwd);
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			GuestBookDAO dao = new GuestBookDAO();
			GuestBookDTO returnDto = dao.getSelectOne(dto);
			
			if(!passwd.equals(returnDto.getPasswd())) {
				return;
			}
			
			int result = dao.setUpdate(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/guestBook_servlet/guestBook_view.do?no=" + no);
			} else {
				response.sendRedirect(path + "/guestBook_servlet/guestBook_edit.do?no=" + no);
			}
		
		} else if(fileName.equals("dropProc")) {
			String passwd = request.getParameter("passwd");
			int no = Integer.parseInt(request.getParameter("no"));
			passwd = util.getNullBlankCheck(passwd);
			
			no = util.getNumberCheck(no + "", 0);
			int failCounter = 0;
			if(no == 0) { failCounter++; }
			if(passwd.equals("")) { failCounter++; }
			if(failCounter > 0) {
				return;
			}
			
			GuestBookDTO dto = new GuestBookDTO();
			dto.setNo(no);
			dto.setPasswd(passwd);
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			GuestBookDAO dao = new GuestBookDAO();
			GuestBookDTO returnDto = dao.getSelectOne(dto);
			
			if(!passwd.equals(returnDto.getPasswd())) {
				return;
			}
			
			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/guestBook_servlet/guestBook_list.do");
			} else {
				response.sendRedirect(path + "/guestBook_servlet/guestBook_view.do?no=" + no);
			}
			
		}
	}

}
