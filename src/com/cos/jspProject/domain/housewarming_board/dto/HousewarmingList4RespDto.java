package com.cos.jspProject.domain.housewarming_board.dto;

import lombok.Data;

@Data
public class HousewarmingList4RespDto {
    private int id; //게시글 번호
    private int userId; // 작성 아이디
    private String userNickname; // 작성자 닉네임
    private String photoImage; // 첨부된 대표 이미지 경로
}
