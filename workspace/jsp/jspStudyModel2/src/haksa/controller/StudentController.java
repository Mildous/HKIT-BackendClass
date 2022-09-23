package haksa.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _common.Util;
import haksa.model.dao.StudentDAO;
import haksa.model.dto.StudentDTO;

@WebServlet("/haksaStudent_servlet/*")
public class StudentController extends HttpServlet {
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
			StudentDAO dao = new StudentDAO();
			ArrayList<StudentDTO> list = dao.getSelectAll();
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/student/list.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("regi.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/haksa/student/regi.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO dto = new StudentDTO();
			StudentDAO dao = new StudentDAO();
			dto = dao.getSelectOne(hakbun);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/student/view.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("edit.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO dto = new StudentDTO();
			StudentDAO dao = new StudentDAO();
			dto = dao.getSelectOne(hakbun);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/student/edit.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("drop.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO dto = new StudentDTO();
			StudentDAO dao = new StudentDAO();
			dto = dao.getSelectOne(hakbun);
	
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher("/WEB-INF/_test/haksa/student/drop.jsp").forward(request, response);
			
		}
		
		// ---------------------------------------------------process
		
		if(imsiUriFileName.equals("regiProc.do")) {	//url.contains("01.do")
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String parentPhone = request.getParameter("parentPhone");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			String addr4 = request.getParameter("addr4");
			
			if(addr4 == null || addr4.equals("")) {
				addr4 = "-";
			}
			
			StudentDTO dto = new StudentDTO();
			dto.setName(name);
			dto.setPhone(phone);
			dto.setParentPhone(parentPhone);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			dto.setAddr3(addr3);
			dto.setAddr4(addr4);
			
			StudentDAO dao = new StudentDAO();
			int result = dao.setInsert(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaStudent_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaStudent_servlet/regi.do");
			}
			
		} else if(imsiUriFileName.equals("editProc.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			String phone = request.getParameter("phone");
			String parentPhone = request.getParameter("parentPhone");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			String addr4 = request.getParameter("addr4");
			
			if(addr4 == null || addr4.equals("")) {
				addr4 = "-";
			}
			
			StudentDTO dto = new StudentDTO();
			dto.setHakbun(hakbun);
			dto.setPhone(phone);
			dto.setParentPhone(parentPhone);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			dto.setAddr3(addr3);
			dto.setAddr4(addr4);
			
			StudentDAO dao = new StudentDAO();
			int result = dao.setUpdate(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaStudent_servlet/view.do?hakbun=" + hakbun);
			} else {
				response.sendRedirect(path + "/haksaStudent_servlet/edit.do?hakbun=" + hakbun);
			}
			
		} else if(imsiUriFileName.equals("dropProc.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO dto = new StudentDTO();
			dto.setHakbun(hakbun);
			
			StudentDAO dao = new StudentDAO();
			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaStudent_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaStudent_servlet/drop.do?hakbun=" + hakbun);
			}
		
		}
		
	}

}
