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

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("../member/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String passwd = req.getParameter("pass");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getSelectOne(id, passwd);
		dto.getId();
		dto.getPasswd();
		dto.getChangeDate();
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(1*60);
		if(dto.getId() != null) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("passwd", dto.getPasswd());
			
			MemberDTO monthDto = new MemberDTO();
			monthDto = dao.getPassMonths(id);
			int passMonth = monthDto.getPassMonth();
			if(passMonth >= 6) {
				resp.sendRedirect("../member/change.jsp");
			} else {
				resp.sendRedirect("../member/main.jsp");
			}
			
			
		} else {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 잘못되었습니다.\\n확인 후 다시 이용바랍니다.');");
			out.println("location.href='../member/login.do';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}
	}
	
}
	
