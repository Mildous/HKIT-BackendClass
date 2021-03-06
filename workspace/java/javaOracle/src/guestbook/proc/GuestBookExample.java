package guestbook.proc;

import java.util.ArrayList;
import java.util.Scanner;

import guestbook.model.GuestBookDAO;
import guestbook.model.GuestBookDTO;

public class GuestBookExample {

	public void exec() {
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("──────────────── 방명록 ────────────────");
			System.out.println("(1)목록 (2)상세 (3)추가 (4)수정 (5)삭제");
			System.out.println("(기타) 이전 메뉴..");
			System.out.print("==> ");
			String choice = sc.nextLine();
			
			if(choice.equals("1")) {
				GuestBookDAO gbDao = new GuestBookDAO();
				ArrayList<GuestBookDTO> list = gbDao.getSelectAll();
				
				for(int i=0; i<list.size(); i++) {
					GuestBookDTO gbDto = list.get(i);
					gbDto.display("list");
				}
		
			} else if(choice.equals("2")) {
				GuestBookDTO gbDto = new GuestBookDTO();
				gbDto.input("detail");
				
				GuestBookDAO gbDao = new GuestBookDAO();
				GuestBookDTO dto = gbDao.getSelectOne(gbDto);
				
				dto.display("detail");
				
			} else if(choice.equals("3")) {
				GuestBookDTO gbDto = new GuestBookDTO();
				gbDto.input("insert");
				
				GuestBookDAO gbDao = new GuestBookDAO();
				int result = gbDao.setInsert(gbDto);
				
			} else if(choice.equals("4")) {
				GuestBookDTO gbDto = new GuestBookDTO();
				GuestBookDAO gbDao = new GuestBookDAO();
				
				gbDto.input("passwdCheck");
				boolean pwChecker = false;
				pwChecker = gbDao.checkPw(gbDto);
				
				if (pwChecker) {
					gbDto.input("edit");
					int result = gbDao.setUpdate(gbDto);
				}
				
			} else if(choice.equals("5")) {
				GuestBookDTO gbDto = new GuestBookDTO();
				GuestBookDAO gbDao = new GuestBookDAO();
				
				gbDto.input("passwdCheck");
				boolean pwChecker = false;
				pwChecker = gbDao.checkPw(gbDto);
				
				if (pwChecker) {
					gbDto.input("delete");
					int result = gbDao.setDelete(gbDto);
				}
				
			} else {
				break;
			}
		}

	}
}
