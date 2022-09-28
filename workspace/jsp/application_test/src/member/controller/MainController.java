package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dao.MemberDAO;
import member.model.dto.MemberDTO;

@WebServlet("/")
public class MainController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String logId = (String)session.getAttribute("id");
		if(logId == null) {
			resp.sendRedirect("member/login.jsp");
		} else {
			req.getRequestDispatcher("member/main.jsp?id=" + logId).forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String logId = (String)session.getAttribute("id");
		if(logId == null) {
			req.getRequestDispatcher("member/login.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("member/main.jsp?id=" + logId).forward(req, resp);
		}
	}
	
}
	
