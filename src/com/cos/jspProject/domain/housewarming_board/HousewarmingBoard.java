package com.cos.jspProject.domain.housewarming_board;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class HousewarmingBoard {
    private int id;
    private int userId;
    private String title;
    private String content;
    private String photoImage;
    private int readCount;
    private Timestamp createDate;
}
