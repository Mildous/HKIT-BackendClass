package member.proc;

import java.util.Scanner;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class ExampleView {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("조회할 회원번호를 입력하세요 : ");
		String memberNo_ = sc.nextLine();
		sc.close();
		
		int memberNo = Integer.parseInt(memberNo_);
		
		MemberDTO productDto = new MemberDTO();
		productDto.setMemberNo(memberNo);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getSelectOne(productDto);
		
		System.out.println("memberId : " + dto.getMemberId());
		System.out.println("memberName : " + dto.getMemberName());
		System.out.println("memberJumin : " + dto.getMemberJumin());
		System.out.println("memberPhone : " + dto.getMemberPhone());
		System.out.println("memberEmail : " + dto.getMemberEmail());
		System.out.println("memberAddr : " + dto.getMemberAddr());
		System.out.println("regiDate : " + dto.getRegiDate());

	}

}
