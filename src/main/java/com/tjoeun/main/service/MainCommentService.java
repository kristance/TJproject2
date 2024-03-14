package com.tjoeun.main.service;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.main.dao.MainCommentDAO;
import com.tjoeun.main.mybatis.MySession;
import com.tjoeun.main.vo.MainCommentList;
import com.tjoeun.main.vo.MainCommentVO;

public class MainCommentService {
	
	private static MainCommentService instance = new MainCommentService();
	private MainCommentService() { }
	public static MainCommentService getInstance() {
		return instance;
	}
	
	// read.jsp에서 호출되는 테이블에 저장할 댓글 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후
	// MainCommentDAO 클래스의 댓글을 테이블에 저장하는 insert sql 명령 실행하는 메소드를 호출하는 메소드
	public void insert(MainCommentVO vo) {
		// System.out.println("MainCommentService 클래스의 insert() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainCommentDAO.getInstance().insert(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}

	public void reply(MainCommentVO vo) {
		// System.out.println("MainCommentService 클래스의 reply() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainCommentDAO.getInstance().reply(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
	// read.jsp에서 호출되는 mapper를 얻어온 후 MainCommentDAO 클래스의 테이블에 저장된 
	// 전체 댓글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainCommentList selectList(int idx) {
		// System.out.println("MainCommentService 클래스의 selectList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainCommentList list = new MainCommentList();
		list.setList(MainCommentDAO.getInstance().selectList(mapper, idx));
		// System.out.println(list);
		
		mapper.close();
		return list;
	}
	
	public MainCommentVO selectByIdx(int idx) {
		// System.out.println("MainCommentService 클래스의 selectByIdx() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainCommentVO vo = MainCommentDAO.getInstance().selectByIdx(mapper, idx);
		// System.out.println(vo);
		
		mapper.close();
		return vo;
	}
	
	public void update(MainCommentVO vo) {
		// System.out.println("MainCommentService 클래스의 update() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainCommentDAO.getInstance().update(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
	public void deleteCheck(int idx) {
		// System.out.println("MainCommentService 클래스의 deleteCheck() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainCommentDAO.getInstance().deleteCheck(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	// 미사용
	public void good(int idx) {
		// System.out.println("MainCommentService 클래스의 good() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainCommentDAO.getInstance().good(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
}
