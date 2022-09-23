package _test.exam.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tika.Tika;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import _common.Util;

@WebServlet("/exam_servlet/*")
public class ExamController extends HttpServlet {
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
		
		String forwardPage = "/WEB-INF/_test/exam";
		if(imsiUriFileName.equals("01.do")) {	//url.contains("01.do")
			forwardPage += "/01.jsp";
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(imsiUriFileName.equals("01Proc.do")) {
			forwardPage += "/01Result.jsp";
			
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			int age = Integer.parseInt(request.getParameter("age"));
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(imsiUriFileName.equals("02.do")) {
			forwardPage += "/02.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("02Proc.do")) {
			String name = request.getParameter("name");
			String bornYear = request.getParameter("bornYear");
			request.setAttribute("name", name);
			request.setAttribute("bornYear", bornYear);
			
			forwardPage += "/02Result.jsp";
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(imsiUriFileName.equals("03.do")) {
			forwardPage += "/03.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("03Proc.do")) {
			String name = request.getParameter("name");
			String regiNum = request.getParameter("regiNum");
			int year = Integer.parseInt(regiNum.substring(0, 2));
			String genderNo = regiNum.substring(7, 8);
			String gender = "";
			int age = 0;
			
			if(genderNo.equals("1") || genderNo.equals("3")) {
				gender = "남성";
				if(genderNo.equals("3")) {
					age = 22 - year + 1; 
				} else {
					age = 2022 - (1900 + year) + 1; 
				}
			} else if(genderNo.equals("2") || genderNo.equals("4")) {
				gender = "여성";
				if(genderNo.equals("4")) {
					age = 22 - year + 1; 
				} else {
					age = 2022 - (1900 + year) + 1; 
				}
			}

			request.setAttribute("name", name);
			request.setAttribute("regiNum", regiNum);
			request.setAttribute("gender", gender);
			request.setAttribute("age", age);
			
			forwardPage += "/03Result.jsp";
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(imsiUriFileName.equals("04.do")) {
			forwardPage += "/04.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("04Proc.do")) {
			ArrayList<String> list = new ArrayList<String>();
			int formCounter = Integer.parseInt(request.getParameter("formCounter"));

			for(int i=1; i<=formCounter; i++) {
				String name = request.getParameter("name_" + i);
				String address = request.getParameter("address_" + i);
				String age_ =request.getParameter("age_" + i);
				int age = Integer.parseInt(age_);
				
				String msg = name + "|" + address + "|" + age;
				list.add(msg);
			}
			
			request.setAttribute("list", list);
			
			forwardPage += "/04Result.jsp";
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(imsiUriFileName.equals("05.do")) {
			forwardPage += "/05.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("05Proc.do")) {
			String[] names = request.getParameterValues("name");
			String name = "";
			for(int i=0; i<names.length; i++) {
				name += "," + names[i];
			}
			name = name.substring(1);
			
			String gender = request.getParameter("gender");
			String aboutAge = request.getParameter("aboutAge");
			
			String[] hobbys = request.getParameterValues("hobby");
			String hobby = "";
			for(int i=0; i<hobbys.length; i++) {
				hobby += "," + hobbys[i];
			}
			hobby = hobby.substring(1);
			
			int age = Integer.parseInt(request.getParameter("age"));
			String memo = request.getParameter("memo").replace("\n", "<br>");
			String birthDay = request.getParameter("birthDay");
			
			HashMap<String, String> map = new HashMap<>();
			map.put("name", name);
			map.put("gender", gender);
			map.put("aboutAge", aboutAge);
			map.put("hobby", hobby);
			map.put("age", age + "");
			map.put("memo", memo);
			map.put("birthDay", birthDay);
			
			request.setAttribute("map", map);
			
			forwardPage += "/05Result.jsp";
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(imsiUriFileName.equals("06.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/06.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("06Proc.do")) {
			String testDbId = "hr";
			String testDbPw = "1234";
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			String ment = "<h2>로그인 실패..</h2>";
			if(id.equals(testDbId)) {
				ment = "<h2>로그인 성공!</h2>";
			}
			
			request.setAttribute("ment", ment);
			request.getRequestDispatcher("/WEB-INF/_test/exam/06Result.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("06Result.do")) {
			String ment = request.getParameter("ment");
			request.setAttribute("ment", ment);
			//response.sendRedirect("/jspStudyModel2/exam_servlet/06Result.do?ment=" + ment);
			request.getRequestDispatcher("/WEB-INF/_test/exam/06Result2.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("07.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/07.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("07Proc.do")) {
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String age = request.getParameter("age");
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			request.getRequestDispatcher("/WEB-INF/_test/exam/07Result.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("08.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/08.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("08Proc.do")) {
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			int age = Integer.parseInt(request.getParameter("age"));
			String test = request.getParameter("test");
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			int result = Integer.parseInt(request.getParameter("result"));
			
			int imsiResult = 0;
			if(test.equals("+")) {
				imsiResult = num1 + num2;
			} else if(test.equals("-")) {
				imsiResult = num1 - num2;
			} else if(test.equals("*")) {
				imsiResult = num1 * num2;
			} else if(test.equals("/")) {
				imsiResult = num1 / num2;
			}
			if(result - imsiResult != 0) {
				//response.sendRedirect(path + "/exam_servlet/08.do");
//				response.setContentType("text/html; charset=utf-8");
//				PrintWriter out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('결과가 다름');");
//				out.println("location.href='" + path + "/exam_servlet/08.do';");
//				out.println("</script>");
//				out.flush();
//				out.close();
				request.setAttribute("errorCode", "error001");
				request.setAttribute("errorMsg", "결과값이 다릅니다.");
				request.getRequestDispatcher("/WEB-INF/_test/exam/error.jsp").forward(request, response);
				return;
			}
			
			HashMap<String, String> map = new HashMap<>();
			map.put("name", name);
			map.put("addr", addr);
			map.put("age", age + "");
			map.put("test", test);
			map.put("num1", num1 + "");
			map.put("num2", num2 + "");
			map.put("result", result + "");
			
			request.setAttribute("map", map);
			request.getRequestDispatcher("/WEB-INF/_test/exam/08Result.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("09.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/09.jsp").forward(request, response);
			
		} else if(imsiUriFileName.equals("09Proc.do")) {
			String name = request.getParameter("name");
			int kor = Integer.parseInt(request.getParameter("kor"));
			int eng = Integer.parseInt(request.getParameter("eng"));
			int math = Integer.parseInt(request.getParameter("math"));
			
			request.setAttribute("name", name);
			request.setAttribute("kor", kor);
			request.setAttribute("eng", eng);
			request.setAttribute("math", math);
			request.getRequestDispatcher("/WEB-INF/_test/exam/09Result.jsp").forward(request, response);
			/*
			String queryString = "";
			queryString += "?name=" + name;
			queryString += "?kor=" + kor;
			queryString += "?eng=" + eng;
			queryString += "?math=" + math;
			
			String imsiPage = path + "/exam_servlet/09Result.do" + queryString;
			response.sendRedirect(imsiPage);
			*/
		} else if(imsiUriFileName.equals("json1.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/json1.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("join1proc.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", id);
			jsonObject.put("pw", pw);
			jsonObject.put("name", name);
			jsonObject.put("age", age);
			
			String jsonMember = jsonObject.toString();
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(jsonMember);
			out.flush();
			out.close();
		} else if(imsiUriFileName.equals("json2.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/json2.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("join2proc.do")) {
			String name = request.getParameter("name");
			int kor = Integer.parseInt(request.getParameter("kor"));
			int eng = Integer.parseInt(request.getParameter("eng"));
			int math = Integer.parseInt(request.getParameter("math"));
			int sci = Integer.parseInt(request.getParameter("sci"));
			int his = Integer.parseInt(request.getParameter("his"));
			
			int tot = kor + eng + math + sci + his;
			double avg = tot / 5;
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name", name);
			jsonObject.put("kor", kor);
			jsonObject.put("eng", eng);
			jsonObject.put("math", math);
			jsonObject.put("sci", sci);
			jsonObject.put("his", his);
			jsonObject.put("tot", tot);
			jsonObject.put("avg", avg);
			
			String jsonMember = jsonObject.toString();
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(jsonMember);
			out.flush();
			out.close();
		} else if(imsiUriFileName.equals("attach1.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/attach1.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("attach1Proc.do")) {
			String attachPath = _common.Constants.ATTACH_PATH;
			int maxUpload = _common.Constants.MAX_UPLOAD;
			
			String uploadPath = attachPath + path + "/test";
			
			MultipartRequest multi = new MultipartRequest(
					request, uploadPath, maxUpload, "utf-8", new DefaultFileRenamePolicy()
					);
			String memo = multi.getParameter("memo");
			
			String originalName = "-";
			String savedName = "-";
			long fileSize = 0;
			String fileType = "-";
			String mineType = "-";
			
			java.io.File file_1 = multi.getFile("file_1");
			
			if(file_1 != null) {
				originalName = multi.getOriginalFileName("file_1");
				savedName = multi.getFilesystemName("file_1");
				fileSize = file_1.length();
				fileType = multi.getContentType("file_1");
				
				Tika tika = new Tika();
				mineType = tika.detect(file_1);
				
				String extName = savedName.substring(savedName.lastIndexOf(".") + 1);
				String newSavedName = util.getDateTime() + "_" +  util.createUuid() + "." + extName;
				
				java.io.File newFile = new java.io.File(uploadPath + "/" + newSavedName);
				file_1.renameTo(newFile);	// 파일이름 변경..
				savedName = newSavedName;
				
				if(!fileType.equals(mineType)) {
					java.io.File f1 = new java.io.File(uploadPath + "/" + savedName);
					if(f1.exists()) {
						f1.delete();
					}
					originalName = "-";
					savedName = "-";
					fileSize = 0;
					fileType = "-";
					mineType = "-";
				}
			}
			
			String attachInfo = "";
			attachInfo += originalName + "|";
			attachInfo += savedName+ "|";
			attachInfo += fileSize+ "|";
			attachInfo += fileType + "|";
			attachInfo += mineType + "|";
			
			response.sendRedirect(path + "/exam_servlet/attach1.do");
		
		} else if(imsiUriFileName.equals("attachWhile.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/attachWhile.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("attachWhileProc.do")) {
			String attachPath = _common.Constants.ATTACH_PATH;
			int maxUpload = _common.Constants.MAX_UPLOAD;
			
			String uploadPath = attachPath + path + "/test";
			
			MultipartRequest multi = new MultipartRequest(
					request, uploadPath, maxUpload, "utf-8", new DefaultFileRenamePolicy()
					);
			String memo = multi.getParameter("memo");
			int attachCounter = Integer.parseInt(multi.getParameter("attachCounter"));
			String[] array = new String[attachCounter];
			
			Enumeration files = multi.getFileNames();	// 첨부파일의 집합..
			while(files.hasMoreElements()) {	// 다음 요소가 있으면..
				String originalName = "-";
				String savedName = "-";
				long fileSize = 0;
				String fileType = "-";
				String mineType = "-";
				
				String tagName = (String)files.nextElement();	// 첨부파일의 박스 이름..
				java.io.File f1 = multi.getFile(tagName);
				if(f1 != null) {
					originalName = multi.getOriginalFileName(tagName);
					savedName = multi.getFilesystemName(tagName);
					fileSize = f1.length();
					fileType = multi.getContentType(tagName);
					
					Tika tika = new Tika();
					mineType = tika.detect(f1);
					
					String extName = savedName.substring(savedName.lastIndexOf(".") + 1);
					String newSavedName = util.getDateTime() + "_" +  util.createUuid() + "." + extName;
					
					java.io.File newFile = new java.io.File(uploadPath + "/" + newSavedName);
					f1.renameTo(newFile);	// 파일이름 변경..
					savedName = newSavedName;
					
					if(!fileType.equals(mineType)) {
						java.io.File f2 = new java.io.File(uploadPath + "/" + savedName);
						if(f2.exists()) {
							f2.delete();
						}
						
						originalName = "-";
						savedName = "-";
						fileSize = 0;
						fileType = "-";
						mineType = "-";
					}
				}
				String attachInfo = "";
				attachInfo += originalName + "|";
				attachInfo += savedName+ "|";
				attachInfo += fileSize+ "|";
				attachInfo += fileType + "|";
				attachInfo += mineType + "|";
				
				int idx = Integer.parseInt(tagName);
				array[idx] = attachInfo;
			}
			
			String dispInfo = "";
			for(int i=0; i<array.length; i++) {
				dispInfo += "," + array[i];
			}
			dispInfo = dispInfo.substring(1);
			//System.out.println("dispInfo : " + dispInfo);
			response.sendRedirect(path + "/exam_servlet/attachWhile.do");
			
		} else if(imsiUriFileName.equals("attachFor.do")) {
			request.getRequestDispatcher("/WEB-INF/_test/exam/attachFor.jsp").forward(request, response);
		
		} else if(imsiUriFileName.equals("attachForProc.do")) {
			String attachPath = _common.Constants.ATTACH_PATH;
			int maxUpload = _common.Constants.MAX_UPLOAD;
			
			String uploadPath = attachPath + path + "/test";
			
			MultipartRequest multi = new MultipartRequest(
					request, uploadPath, maxUpload, "utf-8", new DefaultFileRenamePolicy()
					);
			String memo = multi.getParameter("memo");
			int attachCounter = Integer.parseInt(multi.getParameter("attachCounter"));
			String[] array = new String[attachCounter];
			for(int i=0; i<attachCounter; i++) {
				String originalName = "-";
				String savedName = "-";
				long fileSize = 0;
				String fileType = "-";
				String mineType = "-";
				
				String tagName = "file_" + i;	// 첨부파일의 박스 이름..
				java.io.File f1 = multi.getFile(tagName);
				if(f1 != null) {
					originalName = multi.getOriginalFileName(tagName);
					savedName = multi.getFilesystemName(tagName);
					fileSize = f1.length();
					fileType = multi.getContentType(tagName);
					
					Tika tika = new Tika();
					mineType = tika.detect(f1);
					
					String extName = savedName.substring(savedName.lastIndexOf(".") + 1);
					String newSavedName = util.getDateTime() + "_" +  util.createUuid() + "." + extName;
					
					java.io.File newFile = new java.io.File(uploadPath + "/" + newSavedName);
					f1.renameTo(newFile);	// 파일이름 변경..
					savedName = newSavedName;
					
					if(!fileType.equals(mineType)) {
						java.io.File f2 = new java.io.File(uploadPath + "/" + savedName);
						if(f2.exists()) {
							f2.delete();
						}
						
						originalName = "-";
						savedName = "-";
						fileSize = 0;
						fileType = "-";
						mineType = "-";
					}
				}
				String attachInfo = "";
				attachInfo += originalName + "|";
				attachInfo += savedName+ "|";
				attachInfo += fileSize+ "|";
				attachInfo += fileType + "|";
				attachInfo += mineType + "|";
				
				String idx_ = tagName.replace("file_", "");
				int idx = Integer.parseInt(idx_);
				array[idx] = attachInfo;
			}
			response.sendRedirect(path + "/exam_servlet/attachFor.do");
			
		} else {
			return;
		}
	}

}
