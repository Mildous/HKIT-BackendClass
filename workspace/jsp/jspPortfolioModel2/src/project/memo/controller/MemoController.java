package project.memo.controller;

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
import project.memo.model.dao.MemoDAO;
import project.memo.model.dto.MemoDTO;

@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet {
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
			MemoDTO dto = new MemoDTO();
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			/* 페이징 처리 */
			int pageSize = 10;
			int blockSize = 5;
			MemoDAO dao = new MemoDAO();
			
			int totalRecord = dao.getTotalRecord(dto);
			
			int startRecord = pageSize * (pageNum - 1) + 1;
			int lastRecord = pageSize * pageNum;
			
			MemoDTO listDto = new MemoDTO();
			listDto.setStartRecord(startRecord);
			listDto.setLastRecord(lastRecord);
			listDto.setSearchField(searchField);
			listDto.setSearchWord(searchWord);
			
			ArrayList<MemoDTO> list = dao.getSelectAll(listDto);
			Map<String, Object> map = new HashMap<String, Object>();
			String pagingImg = Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, path + "/memo_servlet/memo_list.do", searchField, searchWord);
			
			map.put("pagingImg", pagingImg);
			map.put("totalRecord", totalRecord);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
			
			request.setAttribute("memo", list);
			request.setAttribute("map", map);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, pageNum);
			if(no == 0) {
				return;
			}
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			MemoDAO dao = new MemoDAO();
			MemoDTO dto = dao.getSelectOne(arguDto);
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("dto", dto);
			request.setAttribute("content", content);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("regi")) {
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("edit")) {
			int no = Integer.parseInt(request.getParameter("no"));
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			MemoDAO dao = new MemoDAO();
			MemoDTO dto = dao.getSelectOne(arguDto);
			
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("content", content);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("drop")) {
			int no = Integer.parseInt(request.getParameter("no"));
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			MemoDAO dao = new MemoDAO();
			MemoDTO dto = dao.getSelectOne(arguDto);
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("content", content);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("search")) {
			String moveUrl = "";
			moveUrl += path + "/memo_servlet/memo_list.do?" + searchQuery;
			
			response.sendRedirect(moveUrl);
		}
		
		// ============ process ==============
		if(fileName.equals("regiProc")) {
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			writer = util.getNullBlankCheck(writer);
			content = util.getNullBlankCheck(content);
			
			int failCounter = 0;
			if(writer.equals("")) { failCounter++; }
			if(content.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				return;
			}
			writer = util.getCheckString(writer);
			content = util.getCheckString(content);
			
			MemoDTO dto = new MemoDTO();
			dto.setWriter(writer);
			dto.setContent(content);
			
			MemoDAO dao = new MemoDAO();
			int result = dao.setInsert(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memo_servlet/memo_list.do");
			} else {
				response.sendRedirect(path + "/memo_servlet/memo_regi.do");
			}
			
		} else if(fileName.equals("editProc")) {
			String content = request.getParameter("content");
			int no = Integer.parseInt(request.getParameter("no"));

			content = util.getNullBlankCheck(content);
			no = util.getNumberCheck(no + "", 0);
			int failCounter = 0;
			if(content.equals("")) { failCounter++; }
			if(no == 0) { failCounter++; }
			if(failCounter > 0) {
				return;
			}
			
			content = util.getCheckString(content);
			
			MemoDTO dto = new MemoDTO();
			dto.setContent(content);
			dto.setNo(no);
			
			MemoDAO dao = new MemoDAO();
			int result = dao.setUpdate(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memo_servlet/memo_view.do?no=" + no);
			} else {
				response.sendRedirect(path + "/memo_servlet/memo_edit.do?no=" + no);
			}
		
		} else if(fileName.equals("dropProc")) {
			
			int no = Integer.parseInt(request.getParameter("no"));

			no = util.getNumberCheck(no + "", 0);
			int failCounter = 0;
			if(no == 0) { failCounter++; }
			if(failCounter > 0) {
				return;
			}
			
			MemoDTO dto = new MemoDTO();
			dto.setNo(no);
			
			MemoDAO dao = new MemoDAO();
			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memo_servlet/memo_list.do");
			} else {
				response.sendRedirect(path + "/memo_servlet/memo_view.do?no=" + no);
			}
			
		}
	}

}
