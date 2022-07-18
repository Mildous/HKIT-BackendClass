package sungjuk.proc;

import java.util.ArrayList;
import java.util.Scanner;
import sungjuk.model.SungjukDTO;

public class Example {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		ArrayList<SungjukDTO> list = new ArrayList<>();	// [객체, 객체, 객체, ...]
		
		for(int i=0; i<3; i++) {
/*
			System.out.print("이름 : ");
			String name = s.nextLine();
			System.out.print("국어 : ");
			String kor_ = s.nextLine();
			System.out.print("영어 : ");
			String eng_ = s.nextLine();
			System.out.print("수학 : ");
			String math_ = s.nextLine();
			
			int kor = Integer.parseInt(kor_);
			int eng = Integer.parseInt(eng_);
			int math = Integer.parseInt(math_);
*/
/*
			//매개변수가 있는 생성자 사용
			SungjukDTO dto = new SungjukDTO(name, kor, eng, math);
*/
			//기본 생성자 사용
			SungjukDTO dto = new SungjukDTO();	//작은 가방
			dto.inputData();
/*
 			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMath(math);
*/
			//System.out.println(dto.getName() + "\t" + dto.getKor() + "\t" + dto.getEng() + "\t" + dto.getMath());
			
			list.add(dto);	//큰 가방
		}
		
		for(int i=0; i<list.size(); i++) {
			SungjukDTO dto = list.get(i);
			dto.sumTot();
			dto.display();
/*
			int tot = dto.getKor() + dto.getEng() + dto.getMath();
			dto.setTot(tot);
			
			System.out.println(dto.getName() + " / " + dto.getKor() + " / " + dto.getEng() + " / " + dto.getMath() + " / " + dto.getTot());
*/
		}
	}

}
