package com.cos.jspProject.domain.reply.dto;


import lombok.Data;

@Data
public class SaveReqDto {
	private int userId;
	private Integer boardId;
	private Integer h_boardId;
	private String content;
	
	
}