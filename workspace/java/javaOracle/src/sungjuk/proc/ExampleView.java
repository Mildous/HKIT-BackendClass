package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleView {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("조회할 번호를 입력하세요.. ");
		int no = Integer.parseInt(sc.nextLine());
		
		SungjukDTO dto = new SungjukDTO();
		dto.setNo(no);
		
		SungjukDAO dao = new SungjukDAO();
		dao.getSelectOne(dto);

	}

}
