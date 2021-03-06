package member.proc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class ExampleEdit {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("수정할 회원번호를 입력하세요 : ");
		String memberNo_ = sc.nextLine();
		System.out.print("새로운 아이디를 입력하세요 : ");
		String memberId = sc.nextLine();
		System.out.print("새로운 이름을 입력하세요 : ");
		String memberName = sc.nextLine();
		sc.close();
		
		int memberNo = Integer.parseInt(memberNo_);
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberNo(memberNo);
		dto.setMemberId(memberId);
		dto.setMemberName(memberName);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.setUpdate(dto);
		
		if (result > 0) {
			System.out.println("-- success update! --");
		} else {
			System.out.println("-- fail update ! --");
		}
	}

}
