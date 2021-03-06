package member.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DB;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//전체 출력
	public ArrayList<MemberDTO> getSelectAll() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			conn = DB.dbConn();
			//-------------------------------------------------
			String sql = "select memberNo, memberId, memberName, memberAddr, regiDate from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setMemberName(rs.getString("memberName"));
				//String memberJumin = rs.getString("memberJumin");
				//String memberPhone = rs.getString("memberPhone");
				//String memberEmail = rs.getString("memberEmail");
				dto.setMemberAddr(rs.getString("memberAddr"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(dto);
			}
			//-------------------------------------------------
		} catch(Exception e) {
			System.out.println("-- DB 접속 실패 --");
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//상세 출력
	public MemberDTO getSelectOne(MemberDTO paramDto) {
		MemberDTO dto = new MemberDTO();
		try {
			conn = DB.dbConn();
			//-------------------------------------------------
			String sql = "select * from member where memberNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getMemberNo());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setMemberId(rs.getString("memberId"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setMemberJumin(rs.getString("memberJumin"));
				dto.setMemberPhone(rs.getString("memberPhone"));
				dto.setMemberEmail(rs.getString("memberEmail"));
				dto.setMemberAddr(rs.getString("memberAddr"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
			} else {
				System.out.println("존재하지 않는 회원번호 입니다.");
			}
			//-------------------------------------------------
		} catch(Exception e) {
			System.out.println("-- DB 접속 실패 --");
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//추가
	public int setInsert(MemberDTO dto) {
		
		int result = 0;
		
		try {
			conn = DB.dbConn();
			//------------------------------------------
			String sql = "insert into member values (seq_member.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberId());
			pstmt.setString(2, dto.getMemberPw());
			pstmt.setString(3, dto.getMemberName());
			pstmt.setString(4, dto.getMemberJumin());
			pstmt.setString(5, dto.getMemberPhone());
			pstmt.setString(6, dto.getMemberEmail());
			pstmt.setString(7, dto.getMemberAddr());
			result = pstmt.executeUpdate();
			//------------------------------------------
		} catch(Exception e) {
			//e.printStackTrace();
			System.out.println("-- DB 접속 실패 --");
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
		
	}
	
	//수정
	public int setUpdate(MemberDTO dto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------
			String sql = "update member set memberPhone = ?, memberEmail = ?, memberAddr = ? where memberNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberPhone());	//DB의 인덱스는 1부터 시작
			pstmt.setString(2, dto.getMemberEmail());
			pstmt.setString(3, dto.getMemberAddr());
			pstmt.setInt(4, dto.getMemberNo());
			result = pstmt.executeUpdate();
			//------------------------------------------
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	//삭제
	public int setDelete(MemberDTO dto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------
			String sql = "delete from member where memberNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  dto.getMemberNo());
			result = pstmt.executeUpdate();
			//------------------------------------------
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
}
