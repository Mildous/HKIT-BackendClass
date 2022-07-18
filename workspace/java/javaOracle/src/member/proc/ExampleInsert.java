package member.proc;

import java.util.Scanner;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class ExampleInsert {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("ID : ");
		String memberId = sc.nextLine();
		System.out.print("Password : ");
		String memberPw = sc.nextLine();
		System.out.print("Name : ");
		String memberName = sc.nextLine();
		System.out.print("JuminNumber : ");
		String memberJumin = sc.nextLine();
		System.out.print("Phone : ");
		String memberPhone = sc.nextLine();
		System.out.print("Email : ");
		String memberEmail = sc.nextLine();
		System.out.print("Address : ");
		String memberAddr = sc.nextLine();
		sc.close();
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberId(memberId);
		dto.setMemberPw(memberPw);
		dto.setMemberName(memberName);
		dto.setMemberJumin(memberJumin);
		dto.setMemberPhone(memberPhone);
		dto.setMemberEmail(memberEmail);
		dto.setMemberAddr(memberAddr);
		
		MemberDAO dao = new MemberDAO();
		dao.setInsert(dto);
	
	}

}
