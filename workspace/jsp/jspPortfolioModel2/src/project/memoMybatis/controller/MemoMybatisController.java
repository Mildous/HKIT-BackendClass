package project.memoMybatis.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Pagenation;
import project.common.Util;
import project.memoMybatis.model.dao.MemoMybatisDAO;
import project.memoMybatis.model.dto.MemoMybatisDTO;

@WebServlet("/memoMybatis_servlet/*")
public class MemoMybatisController extends HttpServlet {
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
		
		if(sessionNo <= 0) {	// 로그인 안한 상태
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용바랍니다.');");
			out.println("location.href='" + path + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}
		
		request.setAttribute("referer", referer);
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
			MemoMybatisDTO dto = new MemoMybatisDTO();
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			/* 페이징 처리 */
			int pageSize = 10;
			int blockSize = 5;
			
			int totalRecord = dao.getTotalRecord(dto);
			
			int startRecord = pageSize * (pageNum - 1) + 1;
			int lastRecord = pageSize * pageNum;
			
			MemoMybatisDTO listDto = new MemoMybatisDTO();
			listDto.setStartRecord(startRecord);
			listDto.setLastRecord(lastRecord);
			listDto.setSearchField(searchField);
			listDto.setSearchWord(searchWord);
			
			List<MemoMybatisDTO> list = dao.getSelectAll(listDto);
			Map<String, Object> map = new HashMap<String, Object>();
			String pagingImg = Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, path + "/memoMybatis_servlet/memoMybatis_list.do", searchField, searchWord);
			
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
			
			MemoMybatisDTO param = new MemoMybatisDTO();
			param.setNo(no);
			param.setSearchField(searchField);
			param.setSearchWord(searchWord);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			MemoMybatisDTO dto = dao.getSelectOne(param);
			
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("dto", dto);
			request.setAttribute("content", content);
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		} else if(fileName.equals("regi")) {
			
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		} else if(fileName.equals("edit")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, pageNum);
			
			if(no == 0) {
				return;
			}
			
			MemoMybatisDTO param = new MemoMybatisDTO();
			param.setNo(no);
			param.setSearchField(searchField);
			param.setSearchWord(searchWord);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			MemoMybatisDTO dto = dao.getSelectOne(param);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		} else if(fileName.equals("drop")) {
			
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("search")) {
			String moveUrl = "";
			moveUrl += path + "/memoMybatis_servlet/memoMybatis_list.do?" + searchQuery;
			
			response.sendRedirect(moveUrl);
		}
		
		/* ===================== Process ===================== */
		
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
			
			MemoMybatisDTO dto = new MemoMybatisDTO();
			dto.setWriter(writer);
			dto.setContent(content);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			int result = dao.setInsert(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_list.do");
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_regi.do");
			}
			
			
		} else if(fileName.equals("editProc")) {
			String content = request.getParameter("content");
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, pageNum);
			
			if(no == 0) {
				return;
			}
			
			content = util.getNullBlankCheck(content);
			
			int failCounter = 0;
			if(content.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				return;
			}
			
			content = util.getCheckString(content);
			MemoMybatisDTO dto = new MemoMybatisDTO();
			dto.setContent(content);
			dto.setNo(no);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			int result = dao.setUpdate(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_view.do?no=" + no);
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_edit.do?no=" + no);
			}
			
		} else if(fileName.equals("dropProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, pageNum);
			
			if(no == 0) {
				return;
			}
			
			MemoMybatisDTO dto = new MemoMybatisDTO();
			dto.setNo(no);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_list.do");
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_view.do?no=" + no);
			}
		}
		
		
	}
}
