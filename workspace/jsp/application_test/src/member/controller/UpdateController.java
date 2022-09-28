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

@WebServlet("/member/updatePass.do")
public class UpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String logId = (String)session.getAttribute("id");
		if(logId == null) {
			req.getRequestDispatcher("../member/login.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("../member/change.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String passwd = req.getParameter("pass");
		String passwdChk = req.getParameter("passChk");
		
		if(passwd == null || passwd.equals("")) {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 입력하지 않았습니다.\\n다시 확인하세요..');");
			out.println("location.href='../member/updatePass.do?id=" + id + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}
		
		if(passwdChk == null || passwdChk.equals("")) {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 확인을 입력하지 않았습니다.\\n다시 확인하세요..');");
			out.println("location.href='../member/updatePass.do?id=" + id + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}
		if(!passwd.equals(passwdChk)) {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호와 비밀번호 확인이 다릅니다.\\n다시 확인하세요..');");
			out.println("location.href='../member/updatePass.do?id=" + id + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}

		MemberDAO dao = new MemberDAO();
		int result = dao.updatePass(id, passwd);
		
		if(result > 0) {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 변경 성공..');");
			out.println("location.href='../member/main.jsp?id=" + id + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		} else {
			
			return;
		}
	}
	
}
	
