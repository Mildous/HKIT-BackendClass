package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleEdit {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("수정할 No를 입력하세요.. ");
		int no = Integer.parseInt(sc.nextLine());
		System.out.print("수정할 국어점수를를 입력하세요.. ");
		int kor = Integer.parseInt(sc.nextLine());
		System.out.print("수정할 영어점수를 입력하세요.. ");
		int eng = Integer.parseInt(sc.nextLine());
		System.out.print("수정할 수학점수를 입력하세요.. ");
		int math = Integer.parseInt(sc.nextLine());
		
		int tot = kor + eng + math;
		double avg = tot / 3.0;
		
		String grade = "F";
		if (avg >= 90) {
			grade = "A";
		} else if (avg >= 80) {
			grade = "B";
		} else if (avg >= 70) {
			grade = "C";
		} else if (avg >= 60) {
			grade = "D";
		} else if (avg >= 50) {
			grade = "E";
		}
		
		SungjukDTO dto = new SungjukDTO();
		dto.setNo(no);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMath(math);
		dto.setTot(tot);
		dto.setAvg(avg);
		dto.setGrade(grade);
		
		SungjukDAO dao = new SungjukDAO();
		int result = dao.setUpdate(dto);
		
		if (result > 0) {
			System.out.println("수정 완료..");
		} else {
			System.out.println("수정 실패..");
			System.out.println("없는 No입니다..");
		}
	}

}
