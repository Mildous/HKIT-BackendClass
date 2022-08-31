<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	java.io.File isDir = new java.io.File(uploadPath);
	if(!isDir.exists()) {
		try {
			isDir.mkdirs();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// MultipartRequest 인스턴스 생성 - WEB-INF/lib에 cos.jar 추가
	MultipartRequest multi = new MultipartRequest(
		request,
		uploadPath,	// 파일저장경로
		maxUpload,	// 용량
		encoding,	// 인코딩타입
		new DefaultFileRenamePolicy()	// 중복파일처리(동일파일명 업로드 시 뒤에 숫자가 붙음)
	);
	
	String productName = multi.getParameter("productName");
	String productPrice_ = multi.getParameter("productPrice");
	String vendorCode_ = multi.getParameter("vendorCode");
	int productPrice = Integer.parseInt(productPrice_);
	int vendorCode = Integer.parseInt(vendorCode_);
	
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
		e.printStackTrace();
	}
	
	if(attachInfo == null || attachInfo.equals("")) {
		attachInfo = "-";
	}
	ProductDTO arguDto = new ProductDTO();
	arguDto.setProductName(productName);
	arguDto.setProductPrice(productPrice);
	arguDto.setVendorCode(vendorCode);
	arguDto.setAttachInfo(attachInfo);
	
	int result = dao.setInsert(arguDto);
	/*
	int result = 0;
	for(int i=7; i<=100; i++) {
		arguDto.setProductName(productName + " - " + i);
		result = dao.setInsert(arguDto);
	}
	*/
	
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=shopProduct_list';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.');");
		out.println("location.href='main.jsp?menuGubun=shopProduct_regi';)");
		out.println("</script>");
	}
%>