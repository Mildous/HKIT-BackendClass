<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	request.setCharacterEncoding("utf-8");

	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + request.getContextPath() + "/member";	// "/jspPortfolioModel1/member";
	int maxUpload = 1024 * 1024 * 100;	// 업로드 할 수 있는 최대 용량: 100mb
	String encoding = "UTF-8";
	
	// MultipartRequest 인스턴스 생성 - WEB-INF/lib에 cos.jar 추가
	MultipartRequest multi = new MultipartRequest(
		request,
		uploadPath,	// 파일저장경로
		maxUpload,	// 용량
		encoding,	// 인코딩타입
		new DefaultFileRenamePolicy()	// 중복파일처리(동일파일명 업로드 시 뒤에 숫자가 붙음)
		);
	
	String id = multi.getParameter("id");
	String passwd = multi.getParameter("passwd");
	String passwdChk = multi.getParameter("passwdChk");
	String name = multi.getParameter("name");
	String phone = multi.getParameter("phone");
	String email = multi.getParameter("email");
	String jumin1 = multi.getParameter("jumin1");
	String jumin2 = multi.getParameter("jumin2");
	String juso1 = multi.getParameter("juso1");
	String juso2 = multi.getParameter("juso2");
	String juso3 = multi.getParameter("juso3");
	String juso4 = multi.getParameter("juso4");
	String grade = multi.getParameter("grade");
	
	String jumin = jumin1 + "-" + jumin2;
	
	if(juso4 == null || juso4.trim().equals("")) {
		juso4 = "-";
	}
	
	String attachInfo = "";
	try {
		Enumeration<String> files = multi.getFileNames();	// 전송한 전체 파일이름을 가져옴
		while(files.hasMoreElements()) {
			String tagName = "";
			String fileOriginName = "";
			String fileSavedName = "";
			String fileType = "";
			String fileSize = "";
			String fileExtName = "";	// .png .jpg .jpeg, .gif
			String newFileName = "";
			
			// form 태그에서 <input type="file" name="지정한 이름" /> 을 가져옴
			tagName = (String)files.nextElement();
			// input file name에 해당하는 실제 파일을 가져옴
			File fileObj = multi.getFile(tagName);
			
			String imsiResult = "";
			if(fileObj != null){	// 해당 tagName에 파일을 첨부했으면
				fileOriginName = multi.getOriginalFileName(tagName);
				fileSavedName = multi.getFilesystemName(tagName); 
	            fileType = multi.getContentType(tagName);
	            fileSize = String.valueOf(fileObj.length());
	            fileExtName = fileSavedName.substring(fileSavedName.lastIndexOf(".")+1);
	            
	            // 이미지 파일이 아닌 경우
	            int errorImgCounter = 0;
	            if(fileExtName.toLowerCase().equals("png")) {
	            	
	            } else if(fileExtName.toLowerCase().equals("jpg")) {
	            	
	            } else if(fileExtName.toLowerCase().equals("jpeg")) {
	            	
	            } else if(fileExtName.toLowerCase().equals("gif")) {
	            	
	            } else {
	            	errorImgCounter++;
	            }
	            
	            // 파일 삭제
	            if(errorImgCounter > 0) {
	            	String deleteFilePath = uploadPath + "/" + fileSavedName;
	            	java.io.File f = new java.io.File(deleteFilePath);
	    			f.delete();
	    			
	    			// 변수값 초기화
	    			fileOriginName = "";
	    			fileSavedName = "";
	    			fileType = "";
	    			fileSize = "";
	            }
	            
	            
	            imsiResult="비정상적인 파일..";
	            if(fileExtName.toLowerCase().equals("jpg") || fileExtName.toLowerCase().equals("png") || fileExtName.toLowerCase().equals("jpeg") || fileExtName.toLowerCase().equals("gif")) {
	               imsiResult="정상적인 파일";
	            }else{
	               fileObj.delete();
	            }
	            
				newFileName = UUID.randomUUID().toString() + "." + fileExtName;// 새로 생성할 파일 이름
				String oldFilePath = uploadPath + "/" + fileSavedName;	// 기존에 저장된 파일
				String newFilePath = uploadPath+ "/" + newFileName;	//기존에 저장된 파일을 여기이름으로 바꿈
				File f1 = new File(oldFilePath);
		           if(f1.exists()){
		              File newFile = new File(newFilePath);
		              f1.renameTo(newFile);
		              fileSavedName=newFileName;
		           }

				
		           if(!attachInfo.trim().equals("")){
		               attachInfo+=",";
		            }
		            attachInfo += fileOriginName + "|";
		            attachInfo += fileSavedName + "|";
		            attachInfo += fileType + "|";
		            attachInfo += fileSize;
		         }
		         out.print(attachInfo+"<br>");
		}
		
	} catch(Exception e) {
		//e.printStackTrace();
	}
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setId(id);
	arguDto.setPasswd(passwd);
	arguDto.setName(name);
	arguDto.setPhone(phone);
	arguDto.setEmail(email);
	arguDto.setJumin(jumin);
	arguDto.setJuso1(juso1);
	arguDto.setJuso2(juso2);
	arguDto.setJuso3(juso3);
	arguDto.setJuso4(juso4);
	arguDto.setGrade(grade);
	arguDto.setAttachInfo(attachInfo);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=member_list';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.');");
		out.println("location.href='main.jsp?menuGubun=member_insert';)");
		out.println("</script>");
	}
%>