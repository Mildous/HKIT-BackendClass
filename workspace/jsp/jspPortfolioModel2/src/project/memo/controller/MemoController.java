package project.memo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		if(fileName.equals("list")) {
			MemoDAO dao = new MemoDAO();
			ArrayList<MemoDTO> list = dao.getSelectAll();
			
			request.setAttribute("memo", list);
			
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("view")) {
			int no = Integer.parseInt(request.getParameter("no"));
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
			
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
			
			MemoDAO dao = new MemoDAO();
			MemoDTO dto = dao.getSelectOne(arguDto);
			String content = dto.getContent().replaceAll("\n", "<br>");
			request.setAttribute("content", content);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
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
