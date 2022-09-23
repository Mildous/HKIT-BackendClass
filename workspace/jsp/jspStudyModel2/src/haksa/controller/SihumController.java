package haksa.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _common.Util;
import haksa.model.dao.SihumDAO;
import haksa.model.dto.SihumDTO;

@WebServlet("/haksaSihum_servlet/*")
public class SihumController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Util util = new Util();
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		
		request.setAttribute("path", path);
		
		if(imsiUriFileName.equals("list.do")) {	//url.contains("01.do")
			SihumDAO dao = new SihumDAO();
			ArrayList<SihumDTO> list = dao.getSelectAll();
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sihum/list.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("regi.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sihum/regi.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO dto = new SihumDTO();
			SihumDAO dao = new SihumDAO();
			dto = dao.getSelectOne(sihumNo);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sihum/view.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("edit.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO dto = new SihumDTO();
			SihumDAO dao = new SihumDAO();
			dto = dao.getSelectOne(sihumNo);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sihum/edit.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("drop.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO dto = new SihumDTO();
			SihumDAO dao = new SihumDAO();
			dto = dao.getSelectOne(sihumNo);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sihum/drop.jsp").forward(request, response);
			
		}
		
		// ---------------------------------------------------process
		
		if(imsiUriFileName.equals("regiProc.do")) {	//url.contains("01.do")
			String sihumName = request.getParameter("sihumName");
			String sihumDate_ = request.getParameter("sihumDate");
			Date sihumDate = Date.valueOf(sihumDate_);
			
			SihumDTO dto = new SihumDTO();
			dto.setSihumName(sihumName);
			dto.setSihumDate(sihumDate);
			
			SihumDAO dao = new SihumDAO();
			int result = dao.setInsert(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSihum_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSihum_servlet/regi.do");
			}
			
		} else if(imsiUriFileName.equals("editProc.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			String sihumName = request.getParameter("sihumName");
			String sihumDate_ = request.getParameter("sihumDate");
			Date sihumDate = Date.valueOf(sihumDate_);
			
			SihumDTO dto = new SihumDTO();
			dto.setSihumNo(sihumNo);
			dto.setSihumName(sihumName);
			dto.setSihumDate(sihumDate);
			
			SihumDAO dao = new SihumDAO();
			int result = dao.setUpdate(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSihum_servlet/view.do?sihumNo=" + sihumNo);
			} else {
				response.sendRedirect(path + "/haksaSihum_servlet/edit.do?sihumNo=" + sihumNo);
			}
			
		} else if(imsiUriFileName.equals("dropProc.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO dto = new SihumDTO();
			dto.setSihumNo(sihumNo);
			
			SihumDAO dao = new SihumDAO();
			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSihum_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSihum_servlet/drop.do?sihumNo=" + sihumNo);
			}
		
		}
		
	}

}
