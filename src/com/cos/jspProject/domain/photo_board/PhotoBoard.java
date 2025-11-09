package com.cos.jspProject.domain.photo_board;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor // 모든 필드를 받는 생성자 자동 생성
@NoArgsConstructor // 기본 생성자 자동 생성
@Data  //@Getter, Setter ... 등등
@Builder // 빌드 패턴 자동 생성

public class PhotoBoard {
private int id;
private int userId;
private String photoImage;
private String content;
private int readCount;
private int favorite;
private Timestamp createDate;
}
