package member.model;

import java.sql.Date;
import java.util.Scanner;

public class MemberDTO {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberJumin;
	private String memberPhone;
	private String memberEmail;
	private String memberAddr;
	private Date regiDate;
	
	public void input(String div) {
		Scanner sc = new Scanner(System.in);
		if(div.equals("detail") || div.equals("edit") || div.equals("delete")) {
			System.out.print("회원번호 : ");
			this.memberNo = Integer.parseInt(sc.nextLine());
		}
		if(div.equals("insert") || div.equals("edit")) {
			if(!div.equals("edit")) {
				System.out.print("아이디 : ");
				this.memberId = sc.nextLine();
				System.out.print("비밀번호 : ");
				this.memberPw = sc.nextLine();
				System.out.print("이름 : ");
				this.memberName = sc.nextLine();
				System.out.print("주민번호 : ");
				this.memberJumin = sc.nextLine();
			}
			
			System.out.print("전화번호 : ");
			this.memberPhone = sc.nextLine();
			System.out.print("이메일 : ");
			this.memberEmail = sc.nextLine();
			System.out.print("주소 : ");
			this.memberAddr = sc.nextLine();
		}
	}
	
	public void display(String div) {
		String msg = "";
		msg += memberNo + "\t";
		msg += memberId + "\t";
		msg += memberName + "\t";
		
		if(div.equals("detail")) {
			msg += memberJumin + "\t";
			msg += memberPhone + "\t";
			msg += memberEmail + "\t";
		}
		msg += memberAddr + "\t";
		msg += regiDate;
		System.out.println(msg);
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberJumin() {
		return memberJumin;
	}
	public void setMemberJumin(String memberJumin) {
		this.memberJumin = memberJumin;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	

}
