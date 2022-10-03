package com.oy.springStudy._common;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class MultipartUpload {

	String attachPath = Constants.ATTACH_PATH;
	int maxUpload = Constants.MAX_UPLOAD;
	
/*
	Servers > server.xml
	<Context docBase="C:/Users/HKIT/attach" reloadable="true"/>
*/
	private int createDirectory(String uploadPath) {
		java.io.File isDir = new java.io.File(uploadPath);
		if(!isDir.isDirectory()) {
			isDir.mkdirs();
		}
		int result = 0;
		if(isDir.exists()) {
			result++;
		}
		return result;
	}
	
	// 파일 이름이 중복되지 않도록 처리
	private String attachFileReName(String originalFileName, byte[] fileData, String uploadPath) {
		String ext = originalFileName.substring(originalFileName.lastIndexOf('.')).toLowerCase();
		
		//UUID 생성 (Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		
		String newFileName = uuid.toString() + ext;
		// 임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.copy(바이트배열, 파일객체);
		java.io.File f1 = new java.io.File(uploadPath, newFileName);
		
		try {
			FileCopyUtils.copy(fileData, f1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return newFileName;
	}
	
	public List<String> attachProc(List<MultipartFile> multiFileList, String savePath) {
		System.out.println("aaa");
		String uploadPath = attachPath + savePath;	// /springStudy/member
		int createDirResult = createDirectory(uploadPath);
		if(createDirResult <= 0) {
			System.out.println("디렉터리가 존재하지 않습니다.");
		}
		
		List<String> list = new ArrayList<>();
		
		for(int i=0; i<multiFileList.size(); i++) {
			MultipartFile file = multiFileList.get(i);
			
			String originalFileName = "";
			String newFileName = "";
			long fileSize = 0;
			String contentType = "";
			String mineType = "";
			
			try {
				originalFileName = file.getOriginalFilename();
				newFileName = attachFileReName(originalFileName, file.getBytes(), uploadPath);
				fileSize = file.getSize();
				contentType = file.getContentType();
				
				InputStream inputStream;
				inputStream = file.getInputStream();
				Tika tika = new Tika();
				mineType = tika.detect(inputStream);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			if(contentType.equals(mineType)) {
//					Map<String, String> map = new HashMap<>();
//					map.put("originalFileName", originalFileName);
//					map.put("newFileName", newFileName);
//					map.put("fileSize", fileSize);
				
				
				String msg = "";
				msg += originalFileName + ",";
				msg += newFileName + ",";
				msg += fileSize + ",";
				msg += contentType + ",";
				msg += mineType;
				list.add(msg);
			} else {
				
			}
		}
		return list;
	}
	
}
