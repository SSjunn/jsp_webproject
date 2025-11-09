package com.cos.jspProject.domain.housewarming_board.dto;

import lombok.Data;

@Data
public class HousewarmingUploadReqDto {
    private int userId;
    private String title;
    private String photoImage;
    private String content;
}
