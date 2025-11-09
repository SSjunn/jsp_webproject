package com.cos.jspProject.domain.housewarming_board.dto;

import lombok.Data;

@Data
public class HousewarmingListRespDto {
    private int id; // 게시글 ID
    private int userId; // 작성자 ID
    private String title;
    private String userNickname; // 작성자 닉네임
    private String photoImage; // 첨부 이미지 파일명
    private String content; // 게시글 내용
    private int readCount; // 조회수
}
