package member.proc;

import java.sql.Date;
import java.util.ArrayList;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class ExampleList {

	public static void main(String[] args) {
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.getSelectAll();
		
		for(int i=0; i<list.size(); i++) {
			MemberDTO dto = list.get(i);
			int memberNo = dto.getMemberNo();
			String memberId = dto.getMemberId();
			String memberName = dto.getMemberName();
			Date regiDate = dto.getRegiDate();
			
			System.out.println("memberNo : " + memberNo);
			System.out.println("memberId : " + memberId);
			System.out.println("memberName : " + memberName);
			System.out.println("regiDate : " + regiDate);
			System.out.println("----------------------------------");
		}
	}

}
