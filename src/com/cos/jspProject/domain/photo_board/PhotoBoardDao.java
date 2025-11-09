package com.cos.jspProject.domain.photo_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.ListResourceBundle;


import com.cos.jspProject.config.DB;
import com.cos.jspProject.domain.photo_board.dto.List4RespDto;
import com.cos.jspProject.domain.photo_board.dto.ListRespDto;
import com.cos.jspProject.domain.photo_board.dto.UploadReqDto;

public class PhotoBoardDao {
	//특정 게시글의 조회수 readCount를 1 증가한다.
	//SQL 쿼리 받고 id를 받아서 게시글의 조회수 +1 하기.
	public int updateReadCount(int id) {
		String sql = "UPDATE photo_board SET readCount = readCount+1 WHERE id = ?";
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql); // 쿼리를 실행할 준비를 하는 PreparedStatement를 선언
			pstmt.setInt(1, id); // sql 문장을 DB에 보낼 준비
			int result = pstmt.executeUpdate();
			return result; // 실행 결과를 그대로 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pstmt); // 사용한 자원을 닫아주기 안 닫으면 메모리 문제가 생길 수 있어.
		}
		return -1;
	}
	// 게시글 ID를 받아서 해당 게시글을 삭제
	public int deleteById(int id) {
		String sql = "DELETE FROM photo_board WHERE id = ?";
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			DB.close(conn, pstmt);
		}
		return -1;
	}
	
	
	// 특정 게시글의 상세 내용을 가져옴
	public ListRespDto findById(int id){
		// 여러 줄 SQL을 쓸 때 StringBuffer를 사용해서 쿼리 만들기
		// photo_board 테이블과 user 테이블을 JOIN해서 nickname 도 같이 가져오는 쿼리
		StringBuffer sb = new StringBuffer();
		sb.append("select b.id, b.photoImage, b.content, b.readCount, b.userId, u.nickname ");
		sb.append("from photo_board b inner join user u ");
		sb.append("on b.userId = u.id ");
		sb.append("where b.id = ?");
		
		//DB 연결하고, 쿼리 준비하고, 결과를 받을 rs 선언
		String sql = sb.toString();
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		
		//SQL 실행해서 결과를 rs라는 객체로 받아.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs =  pstmt.executeQuery();
			
			// Persistence API
			//결과가 있으면(rs.next()), 데이터를 하나씩 꺼내서 ListRespDto 객체에 저장하고 리턴
			if(rs.next()) { // 커서를 이동하는 함수
				ListRespDto dto = new ListRespDto();
				dto.setId(rs.getInt("b.id"));
				dto.setPhotoImage(rs.getString("b.photoImage"));
				dto.setContent(rs.getString("b.content"));
				dto.setReadCount(rs.getInt("b.readCount"));
				dto.setUserId(rs.getInt("b.userId"));
				dto.setUserNickname(rs.getString("u.nickname"));
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			DB.close(conn, pstmt, rs); // 연결과 결과 셋 닫기.
		}
		return null;
	}
	
	
	// 게시글을 데이터베이스에 저장한다.
	public int save(UploadReqDto dto) { 
		// 글을 새로 저장할 때 사용하는 SQL문
		// userId, PhotoImage, content는 직접 넣고, createDate는 현재 시간(now())으로 자동 입력
		String sql = "INSERT INTO photo_board(userId, photoImage, content,createDate) VALUES(?,?,?, now())";
		
		// 사용자가 작성한 dto를 쿼리에 세팅
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getUserId());
			pstmt.setString(2, dto.getPhotoImage());
			pstmt.setString(3, dto.getContent());
			
			//실행해서 결과 반환.
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 무조건 실행
			DB.close(conn, pstmt);
		}
		return -1;
	}
	
	// 모든 게시글을 가져온다.
	public List<ListRespDto>findAll(){
		// 모든 게시글을 가져오라는 쿼리. 유저 닉네임도 같이 가져옴
		StringBuffer sb = new StringBuffer();
		sb.append("select b.id, b.photoImage, b.content, b.readCount, b.userId, u.nickname ");
		sb.append("from photo_board b inner join user u ");
		sb.append("on b.userId = u.id");
		
		String sql = sb.toString();
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		List<ListRespDto> boards = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs =  pstmt.executeQuery();
			
			// Persistence API
			// 한 줄씩 읽으면서 ListRespDto로 만들어 boards 리스트에 담고, 그걸 리턴
			while(rs.next()) { // 커서를 이동하는 함수
				ListRespDto dto = new ListRespDto ();
				dto.setId(rs.getInt("b.id"));
				dto.setPhotoImage(rs.getString("b.photoImage"));
				dto.setContent(rs.getString("b.content"));
				dto.setReadCount(rs.getInt("b.readCount"));
				dto.setUserId(rs.getInt("b.userId"));
				dto.setUserNickname(rs.getString("u.nickname"));
				boards.add(dto);	
			}
			return boards;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 무조건 실행
			DB.close(conn, pstmt, rs);
		}
		return null;
	}
	// 최신 게시글 4개만 가져온다.
	public List<List4RespDto>find4(){
		StringBuffer sb = new StringBuffer();
		sb.append("select b.id, b.photoImage, b.content, b.readCount, b.userId, u.nickname ");
		sb.append("from photo_board b inner join user u ");
		sb.append("on b.userId = u.id ");
		sb.append("order by b.createDate desc Limit 0,4");
		
		String sql = sb.toString();
	
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		List<List4RespDto> boards = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs =  pstmt.executeQuery();
			
			// Persistence API
			// 한 줄씩 읽으면서 ListRespDto로 만들어 boards 리스트에 담고, 그걸 리턴
			while(rs.next()) { // 커서를 이동하는 함수
				List4RespDto dto = new List4RespDto ();
				dto.setId(rs.getInt("b.id"));
				dto.setPhotoImage(rs.getString("b.photoImage"));;
				dto.setUserId(rs.getInt("b.userId"));
				dto.setUserNickname(rs.getString("u.nickname"));
				boards.add(dto);	
			}
			return boards;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 무조건 실행
			DB.close(conn, pstmt, rs);
		}
		return null;
	}
}
