package guestbook.model;

import java.sql.Date;
import java.util.Scanner;

public class GuestBookDTO {
	private int no;
	private String writer;
	private String subject;
	private String content;
	private String passwd;
	private Date regiDate;
	
	public void input(String div) {
		Scanner sc = new Scanner(System.in);
		if(div.equals("passwdCheck")) {
			System.out.print("번호: ");
			this.no = Integer.parseInt(sc.nextLine());
			System.out.print("비밀번호: ");
			this.passwd = sc.nextLine();
		}
		
		if(div.equals("detail")) {
			System.out.print("번호: ");
			this.no = Integer.parseInt(sc.nextLine());
		}

		if(div.equals("insert")) {
			System.out.print("작성자: ");
			this.writer = sc.nextLine();
			System.out.print("제목: ");
			this.subject = sc.nextLine();
			System.out.print("내용: ");
			this.content = sc.nextLine();
			System.out.print("비밀번호: ");
			this.passwd = sc.nextLine();
		}
		
		if(div.equals("edit")) {
			System.out.print("제목: ");
			this.subject = sc.nextLine();
			System.out.print("내용: ");
			this.content = sc.nextLine();
		}
		if(div.equals("delete")) {
			System.out.println("삭제완료..");
		}
	}

	public void display(String div) {
		String msg = "";
		msg += no + "\t";
		msg += writer + "\t";
		msg += subject + "\t";
		if(div.equals("detail")) {
			msg += content + "\t";
		}
		msg += regiDate;
		
		System.out.println(msg);
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}

}
