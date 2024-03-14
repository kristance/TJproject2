package com.tjoeun.main.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.main.vo.MainCommentVO;

public class MainCommentDAO {
	private static MainCommentDAO instance = new MainCommentDAO();
	private MainCommentDAO() { }
	public static MainCommentDAO getInstance() {
		return instance;
	}
	
//	commentService 클래스에서 호출되는 mapper와 테이블에 저장할 메인 카테고리 정보가 저장된 객체를 넘겨받고
//	테이블에 메인 카테고리를 저장하는 comment.xml 파일의 insert sql 명령을 실행하는 메소드
	public void insert(SqlSession mapper, MainCommentVO vo) {
		// System.out.println("MainCommentDAO 클래스의 insert() 메소드 실행");
		mapper.insert("insertComment", vo);
	}
	
	public ArrayList<MainCommentVO> selectList(SqlSession mapper, int idx) {
		// System.out.println("MainCommentDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<MainCommentVO>) mapper.selectList("selectCommentList", idx);
	}
	
	public MainCommentVO selectByIdx(SqlSession mapper, int idx) {
		// System.out.println("MainCommentDAO 클래스의 selectByIdx() 메소드 실행");
		return (MainCommentVO) mapper.selectOne("selectCommentByIdx", idx);
	}
	
	public void deleteCheck(SqlSession mapper, int idx) {
		// System.out.println("MainCommentDAO 클래스의 deleteCheck() 메소드 실행");
		mapper.update("deleteCommentCheck", idx);
	}
	
	public void update(SqlSession mapper, MainCommentVO vo) {
		// System.out.println("MainCommentDAO 클래스의 update() 메소드 실행");
		mapper.update("updateComment", vo);
	}
	
	public void reply(SqlSession mapper, MainCommentVO vo) {
		// System.out.println("MainCommentDAO 클래스의 reply() 메소드 실행");
		mapper.update("replyComment", vo);
	}
	
	// 미사용
	public void good(SqlSession mapper, int idx) {
		// System.out.println("MainCommentDAO 클래스의 good() 메소드 실행");
		mapper.update("goodComment", idx);
	}

}
