package com.seok.home.s_board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudyBoardService {

	@Autowired
	private StudyBoardDAO studyBoardDAO;
	
	public List<StudyBoardDTO> getBoardList()throws Exception{
		return studyBoardDAO.getBoardList();
	}
	
	public StudyBoardDTO getBoardDetail(StudyBoardDTO studyBoardDTO)throws Exception{
		return studyBoardDAO.getBoardDetail(studyBoardDTO);
	}
	
	public int setBoardAdd(StudyBoardDTO studyBoardDTO)throws Exception{
		return studyBoardDAO.setBoardAdd(studyBoardDTO);
	}
	
	public int setBoardDelete(StudyBoardDTO studyBoardDTO)throws Exception{
		return studyBoardDAO.setBoardDelete(studyBoardDTO);
	}
	
	public int setBoardUpdate(StudyBoardDTO studyBoardDTO)throws Exception{
		return studyBoardDAO.setBoardUpdate(studyBoardDTO);
	}
}