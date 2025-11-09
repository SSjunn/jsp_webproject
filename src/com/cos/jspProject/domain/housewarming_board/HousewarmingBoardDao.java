package com.cos.jspProject.domain.housewarming_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cos.jspProject.config.DB;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingList4RespDto;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingListRespDto;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingUploadReqDto;

public class HousewarmingBoardDao {

    // 게시글 저장
    public int save(HousewarmingUploadReqDto dto) {
        String sql = "INSERT INTO housewarming_board(userId, title, content, photoImage, createDate) VALUES (?, ?, ?, ?, now())";
        Connection conn = DB.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, dto.getUserId());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getPhotoImage());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, pstmt);
        }
        return -1;
    }

    // 전체 글 조회
    public List<HousewarmingListRespDto> findAll() {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.id AS id, b.title AS title, b.photoImage AS photoImage, b.readCount AS readCount, u.nickname AS nickname ");
        sb.append("FROM housewarming_board b ");
        sb.append("INNER JOIN user u ON b.userId = u.id ");
        sb.append("ORDER BY b.createDate DESC");

        Connection conn = DB.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<HousewarmingListRespDto> boards = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                HousewarmingListRespDto dto = new HousewarmingListRespDto();
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setPhotoImage(rs.getString("photoImage"));
                dto.setReadCount(rs.getInt("readCount"));
                dto.setUserNickname(rs.getString("nickname"));
                boards.add(dto);
            }
            return boards;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, pstmt, rs);
        }
        return null;
    }

    public List<HousewarmingList4RespDto> find4() {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.id AS id, b.photoImage AS photoImage, b.userId AS userId, u.nickname AS nickname ");
        sb.append("FROM housewarming_board b ");
        sb.append("INNER JOIN user u ON b.userId = u.id ");
        sb.append("ORDER BY b.createDate DESC LIMIT 0, 4");

        Connection conn = DB.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<HousewarmingList4RespDto> boards = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                HousewarmingList4RespDto dto = new HousewarmingList4RespDto();
                dto.setId(rs.getInt("id"));
                dto.setPhotoImage(rs.getString("photoImage"));
                dto.setUserId(rs.getInt("userId"));
                dto.setUserNickname(rs.getString("nickname"));
                boards.add(dto);
            }
            return boards;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, pstmt, rs);
        }
        return null;
    }

    // 상세보기
    public HousewarmingListRespDto findById(int id) {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.id AS id, b.title AS title, b.content AS content, b.photoImage AS photoImage, b.userId, b.readCount AS readCount, u.nickname AS nickname ");
        sb.append("FROM housewarming_board b ");
        sb.append("INNER JOIN user u ON b.userId = u.id ");
        sb.append("WHERE b.id = ?");

        Connection conn = DB.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                HousewarmingListRespDto dto = new HousewarmingListRespDto();
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPhotoImage(rs.getString("photoImage"));
                dto.setUserId(rs.getInt("b.userId"));
                dto.setReadCount(rs.getInt("readCount"));
                dto.setUserNickname(rs.getString("nickname"));
                return dto;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, pstmt, rs);
        }
        return null;
    }

    // 조회수 증가
    public int updateReadCount(int id) {
        String sql = "UPDATE housewarming_board SET readCount = readCount + 1 WHERE id = ?";
        Connection conn = DB.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, pstmt);
        }
        return -1;
    }

    // 게시글 삭제
    public int deleteById(int id) {
        String sql = "DELETE FROM housewarming_board WHERE id = ?";
        Connection conn = DB.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, pstmt);
        }
        return -1;
    }
}
