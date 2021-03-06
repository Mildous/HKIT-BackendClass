package _proc;

import java.util.Scanner;

import guestbook.proc.GuestBookExample;
import member.proc.MemberExample;
import product.proc.ProductExample;
import sungjuk.proc.SungjukExample;

public class Example {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("──────────────── 메인메뉴 ────────────────");
			System.out.println("(1)회원관리 (2)성적관리 (3)상품관리 (4)방명록");
			System.out.println("(기타) 프로그램 종료..");

			System.out.print("==> ");
			String choice = sc.nextLine();
			
			if(choice.equals("1")) {
				MemberExample member = new MemberExample();
				member.exec();
			} else if(choice.equals("2")) {
				SungjukExample sungjuk = new SungjukExample();
				sungjuk.exec();

			} else if(choice.equals("3")) {
				ProductExample product = new ProductExample();
				product.exec();

			} else if(choice.equals("4")){
				GuestBookExample guestBook = new GuestBookExample();
				guestBook.exec();
				
			} else {
				break;
			}
			
		}
		System.out.println("────────────── 프로그램 종료 ──────────────");
	}
}
