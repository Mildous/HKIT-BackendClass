package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleInsert {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Name ?  ");
		String name = sc.nextLine();
		System.out.print("Kor ?  ");
		int kor = Integer.parseInt(sc.nextLine());
		System.out.print("Eng ?  ");
		int eng = Integer.parseInt(sc.nextLine());
		System.out.print("Math ?  ");
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
		dto.setName(name);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMath(math);
		dto.setTot(tot);
		dto.setAvg(avg);
		dto.setGrade(grade);
		
		SungjukDAO dao = new SungjukDAO();
		//dao.setInsert01(name, kor, eng, math, tot, avg, grade);
		//dao.setInsert02(imsi);
		//dao.setInsert03(array);
		int result = dao.setInsert04(dto);
		
		if (result > 0) {
			System.out.println("-- 성공 --");
		} else {
			System.out.println("-- 실패 --");
		}
		
		
		
		
	}

}
