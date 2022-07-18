package example;

import java.util.Scanner;

public class Test02 {

	public static void main(String[] args) {
//		입력 : 3명분의 이름, 국어, 영어, 수학	<-- 변수 1개 사용
//		출력 : 이름 국어 영어 수학 총점
		
		Scanner s = new Scanner(System.in);
		String[][] stu = new String[3][4];
		int total = 0;
		double avg = 0;
		
		for(int i=0; i<stu.length; i++) {
			System.out.print("name.. ");
			stu[i][0] = s.nextLine();
			System.out.print("kor.. ");
			stu[i][1] = s.nextLine();
			System.out.print("eng.. ");
			stu[i][2] = s.nextLine();
			System.out.print("math.. ");
			stu[i][3] = s.nextLine();
		}
		
		System.out.println("---------------------------------------------");
		System.out.println("이름\t국어\t영어\t수학\t총점");
		System.out.println("---------------------------------------------");
		for(int i=0; i<stu.length; i++) {
			System.out.println(stu[i][0] + "\t" + stu[i][1] + "\t" + stu[i][2] + "\t" + stu[i][3]);
		}
		
	}

}
