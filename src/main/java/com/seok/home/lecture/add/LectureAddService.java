package com.seok.home.lecture.add;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LectureAddService {

	@Autowired
	private LectureAddDAO lectureAddDAO;
	
	public int setLectureAdd(LectureAddDTO lectureAddDTO) throws Exception{
		return lectureAddDAO.setLectureAdd(lectureAddDTO);
	}
	
	public LectureAddDTO getLectureAdd(LectureAddDTO lectureAddDTO) throws Exception{
		return lectureAddDAO.getLectureAdd(lectureAddDTO);
	}
}