package haksaSihum.model.dto;

import java.sql.Date;

public class HaksaSihumDTO {
	int sihumNo;
	String sihumName;
	Date sihumDate;
	Date regiDate;
	
	public int getSihumNo() {
		return sihumNo;
	}
	public void setSihumNo(int sihumNo) {
		this.sihumNo = sihumNo;
	}
	public String getSihumName() {
		return sihumName;
	}
	public void setSihumName(String sihumName) {
		this.sihumName = sihumName;
	}
	public Date getSihumDate() {
		return sihumDate;
	}
	public void setSihumDate(Date sihumDate) {
		this.sihumDate = sihumDate;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
}
