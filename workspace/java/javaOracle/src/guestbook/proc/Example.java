package guestbook.proc;

import java.util.ArrayList;
import java.util.Scanner;

import guestbook.model.GuestBookDAO;
import guestbook.model.GuestBookDTO;

public class Example {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("메뉴를 선택하세요..");
			System.out.println("(0)종료 (1)목록 (2)글보기 (3)작성하기 (4)수정하기 (5)삭제하기");
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
				gbDto.input("edit");

				GuestBookDAO gbDao = new GuestBookDAO();
				int result = gbDao.setUpdate(gbDto);
				
			} else if(choice.equals("5")) {
				GuestBookDTO gbDto = new GuestBookDTO();
				gbDto.input("delete");

				GuestBookDAO gbDao = new GuestBookDAO();
				int result = gbDao.setDelete(gbDto);
				
			} else {
				break;
			}
		}
		System.out.println("프로그램 종료.. ");
	}

}
