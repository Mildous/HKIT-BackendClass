package _proc;

import java.util.Scanner;

import member.proc.MemberExample;
import product.proc.ProductExample;
import sungjuk.proc.SungjukExample;


public class Example {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("------------- 프로그램 선택 --------------");
			System.out.print("(1)회원관리 (2)상품관리 (3)성적관리 (기타)종료 : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				MemberExample memberExample = new MemberExample();
				memberExample.memberExec();
				
			} else if(menu.equals("2")) {
				ProductExample productExample = new ProductExample();
				productExample.productExec();
				
			} else if(menu.equals("3")) {
				SungjukExample sungjukExample = new SungjukExample();
				sungjukExample.sungjukExec();
				
			} else {
				break;
			}
		}

	}

}
