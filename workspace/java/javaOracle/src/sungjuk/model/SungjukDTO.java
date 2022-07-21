package sungjuk.model;

import java.sql.Date;
import java.util.Scanner;

public class SungjukDTO {
	private int no;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;
	private String grade;
	private Date regiDate;
	
	public void input(String div) {
		Scanner sc = new Scanner(System.in);
		if(div.equals("detail") || div.equals("edit") || div.equals("delete")) {
			System.out.print("번호 : ");
			this.no = Integer.parseInt(sc.nextLine());
		}
		if(div.equals("insert") || div.equals("edit")) {
			if(!div.equals("edit")) {
				System.out.print("이름 : ");
				this.name = sc.nextLine();
			}
			
			System.out.print("국어 : ");
			this.kor = Integer.parseInt(sc.nextLine());
			System.out.print("영어 : ");
			this.eng = Integer.parseInt(sc.nextLine());
			System.out.print("수학 : ");
			this.math = Integer.parseInt(sc.nextLine());
		}
	}
	public void cal() {
		this.tot = kor + eng + math;
		this.avg = tot/3.0;
		
		this.grade = "E";
		if(avg >= 90) {
			grade = "A";
		} else if(avg >= 80) {
			grade = "B";
		} else if(avg >= 70) {
			grade = "C";
		} else if(avg >= 60) {
			grade = "D";
		} 
	}
	
	public void display(String div) {
		String msg = "";
		msg += no + "\t";
		msg += name + "\t";
		if(div.equals("detail")) {
			msg += kor + "\t";
			msg += eng + "\t";
			msg += math + "\t";
		}
		msg += tot + "\t";
		msg += avg + "\t";
		msg += grade + "\t";
		msg += regiDate;
		System.out.println(msg);
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
}
