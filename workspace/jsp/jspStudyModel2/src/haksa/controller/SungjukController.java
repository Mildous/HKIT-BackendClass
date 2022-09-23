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
import haksa.model.dao.SungjukDAO;
import haksa.model.dto.SungjukDTO;

@WebServlet("/haksaSungjuk_servlet/*")
public class SungjukController extends HttpServlet {
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
			SungjukDAO dao = new SungjukDAO();
			ArrayList<SungjukDTO> list = dao.getSelectAll();
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sungjuk/list.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("regi.do")) {
			SungjukDAO dao = new SungjukDAO();
			ArrayList<SungjukDTO> list = dao.getSelectAll();
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sungjuk/regi.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO dto = new SungjukDTO();
			SungjukDAO dao = new SungjukDAO();
			dto = dao.getSelectOne(sungjukNo);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sungjuk/view.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("edit.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO dto = new SungjukDTO();
			SungjukDAO dao = new SungjukDAO();
			dto = dao.getSelectOne(sungjukNo);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sungjuk/edit.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("drop.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO dto = new SungjukDTO();
			SungjukDAO dao = new SungjukDAO();
			dto = dao.getSelectOne(sungjukNo);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/sungjuk/drop.jsp").forward(request, response);
			
		}
		
		// ---------------------------------------------------process
		
		if(imsiUriFileName.equals("regiProc.do")) {	//url.contains("01.do")
			String kor_ = request.getParameter("kor");
			String eng_ = request.getParameter("eng");
			String mat_ = request.getParameter("mat");
			String sci_ = request.getParameter("sci");
			String his_ = request.getParameter("his");
			String hakbun_ = request.getParameter("hakbun");
			String sihumNo_ = request.getParameter("sihumNo");
			
			int kor = util.getNumberCheck(kor_, 0);
			int eng = util.getNumberCheck(eng_, 0);
			int mat = util.getNumberCheck(mat_, 0);
			int sci = util.getNumberCheck(sci_, 0);
			int his = util.getNumberCheck(his_, 0);
			int hakbun = util.getNumberCheck(hakbun_, 0);
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			int tot = kor + eng + mat + sci + his;
			double avg = tot / 5;
			
			String grade = "F";
			if(avg > 95) {
				grade = "A";
			} else if(avg > 90) {
				grade = "B";
			} else if(avg > 80) {
				grade = "C";
			} else if(avg > 70) {
				grade = "D";
			} else if(avg > 60) {
				grade = "E";
			}
			
			SungjukDTO dto = new SungjukDTO();
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			dto.setSci(sci);
			dto.setHis(his);
			dto.setTot(tot);
			dto.setAvg(avg);
			dto.setGrade(grade);
			dto.setHakbun(hakbun);
			dto.setSihumNo(sihumNo);
			
			SungjukDAO dao = new SungjukDAO();
			int result = dao.setInsert(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSungjuk_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSungjuk_servlet/regi.do");
			}
			
		} else if(imsiUriFileName.equals("editProc.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			String kor_ = request.getParameter("kor");
			String eng_ = request.getParameter("eng");
			String mat_ = request.getParameter("mat");
			String sci_ = request.getParameter("sci");
			String his_ = request.getParameter("his");
			String hakbun_ = request.getParameter("hakbun");
			String sihumNo_ = request.getParameter("sihumNo");
			
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			int kor = util.getNumberCheck(kor_, 0);
			int eng = util.getNumberCheck(eng_, 0);
			int mat = util.getNumberCheck(mat_, 0);
			int sci = util.getNumberCheck(sci_, 0);
			int his = util.getNumberCheck(his_, 0);
			int hakbun = util.getNumberCheck(hakbun_, 0);
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			int tot = kor + eng + mat + sci + his;
			double avg = tot / 5;
			
			String grade = "F";
			if(avg > 95) {
				grade = "A";
			} else if(avg > 90) {
				grade = "B";
			} else if(avg > 80) {
				grade = "C";
			} else if(avg > 70) {
				grade = "D";
			} else if(avg > 60) {
				grade = "E";
			}
			
			SungjukDTO dto = new SungjukDTO();
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			dto.setSci(sci);
			dto.setHis(his);
			dto.setTot(tot);
			dto.setAvg(avg);
			dto.setGrade(grade);
			dto.setHakbun(hakbun);
			dto.setSihumNo(sihumNo);
			dto.setSungjukNo(sungjukNo);
			
			SungjukDAO dao = new SungjukDAO();
			int result = dao.setUpdate(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSungjuk_servlet/view.do?sungjukNo=" + sungjukNo);
			} else {
				response.sendRedirect(path + "/haksaSungjuk_servlet/edit.do?sungjukNo=" + sungjukNo);
			}
			
		} else if(imsiUriFileName.equals("dropProc.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO dto = new SungjukDTO();
			dto.setSungjukNo(sungjukNo);
			
			SungjukDAO dao = new SungjukDAO();
			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSungjuk_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSungjuk_servlet/drop.do?sungjukNo=" + sungjukNo);
			}
		
		}
		
	}

}
