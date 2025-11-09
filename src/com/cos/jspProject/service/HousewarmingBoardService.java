package com.cos.jspProject.service;

import java.util.List;

import com.cos.jspProject.domain.housewarming_board.HousewarmingBoardDao;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingList4RespDto;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingListRespDto;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingUploadReqDto;

public class HousewarmingBoardService {

    private HousewarmingBoardDao housewarmingBoardDao;

    public HousewarmingBoardService() {
        housewarmingBoardDao = new HousewarmingBoardDao();
    }

    public int 게시글업로드(HousewarmingUploadReqDto dto) {
        return housewarmingBoardDao.save(dto);
    }

    public List<HousewarmingListRespDto> 게시글목록보기() {
        return housewarmingBoardDao.findAll();
    }

    public List<HousewarmingList4RespDto> 최근글4개보기() {
        return housewarmingBoardDao.find4();
    }

    public HousewarmingListRespDto 게시글상세보기(int id) {
        int result = housewarmingBoardDao.updateReadCount(id);
        if (result == 1) {
            return housewarmingBoardDao.findById(id);
        } else {
            return null;
        }
    }

    public int 게시글삭제(int id) {
        return housewarmingBoardDao.deleteById(id);
    }
}
