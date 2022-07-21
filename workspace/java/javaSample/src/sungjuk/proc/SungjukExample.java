package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;


public class SungjukExample {

	public void sungjukExec() {
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.print("성적관리 - (1)목록 (2)상세 (3)추가 (4)수정 (5)삭제 (0)종료 : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				SungjukDAO sungjukDao = new SungjukDAO();
				sungjukDao.getSelectAll();
				
			} else if(menu.equals("2")) {
				SungjukDAO sungjukDao = new SungjukDAO();
				sungjukDao.getSelectOne();
				
			} else if(menu.equals("3")) {
				SungjukDAO sungjukDao = new SungjukDAO();
				sungjukDao.setInsert();
				
			} else if(menu.equals("4")) {
				SungjukDAO sungjukDao = new SungjukDAO();
				sungjukDao.setUpdate();
				
			} else if(menu.equals("5")) {
				SungjukDAO sungjukDao = new SungjukDAO();
				sungjukDao.setDelete();
				
			} else {
				break;
			}
		}
		System.out.println("성적관리 종료..");

	}

}
