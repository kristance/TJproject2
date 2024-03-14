package com.tjoeun.main.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.main.dao.MainDAO;
import com.tjoeun.main.mybatis.MySession;
import com.tjoeun.main.vo.MainList;
import com.tjoeun.main.vo.MainVO;
import com.tjoeun.main.vo.MemberVO;
import com.tjoeun.main.vo.Param;

public class MainService {
	
	private static MainService instance = new MainService();
	private MainService() { }
	public static MainService getInstance() {
		return instance;
	}
	
//	writeOK.jsp에서 호출되는 메인글이 저장된 객체를 넘겨받고 mapper를 얻어온 후 메인글을 저장하는
//	FreeboardDAO 클래스의 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	public void insert(MainVO vo) {
		// System.out.println("MainService 클래스의 insert() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}	
	
//	list.jsp에서 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후 1페이지 분량의
//	메인글 목록을 얻어오는 MainDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public MainList selectList(int currentPage) {
		// System.out.println("MainService 클래스의 selectList() 메소드 실행");
		SqlSession mapper = MySession.getSession();	
		
		int pageSize = 10;
		int totalCount = MainDAO.getInstance().selectCount(mapper);	
		
		MainList mainList = new MainList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", mainList.getStartNo());
		hmap.put("endNo", mainList.getEndNo());
		mainList.setList(MainDAO.getInstance().selectList(mapper, hmap));
		
		mapper.close();
		return mainList;
	}
	
	
//	read.jsp에서 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후 1건의
//	메인글을 얻어오는 MainDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public MainVO selectByIdx(int idx) {
		// System.out.println("MainService 클래스의 selectByIdx() 메소드 실행");
		SqlSession mapper = MySession.getSession();	
		
		MainVO vo = MainDAO.getInstance().selectByIdx(mapper, idx);
		// System.out.println(vo);
		
		mapper.close();
		return vo;
	}
	
//	increment.jsp에서 호출되는 조회수를 증가시킬 글번호를 넘겨받고 mapper를 얻어온 후 메인글의 조회수를
//	증가시키는 MainDAO 클래스의 update sql 명령을 실행하는 메소드를 호출하는 메소드
	public void increment(int idx) {
		// System.out.println("MainService 클래스의 increment() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().increment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
//	read.jsp에서 호출되는 추천수를 증가시킬 글번호를 넘겨받고 mapper를 얻어온 후 메인글의 추천수를
//	증가시키는 MainDAO 클래스의 update sql 명령을 실행하는 메소드를 호출하는 메소드
	public void good(int idx) {
		// System.out.println("MainService 클래스의 good() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainDAO.getInstance().good(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	// read.jsp, list.jsp에서 호출되는 mapper를 얻어온 후 MainDAO 클래스의 테이블에 저장된 
	// 조회수 랭크 글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainList selectHit() {
		// System.out.println("MainService 클래스의 selectHit() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainList list = new MainList();
		list.setList(MainDAO.getInstance().selectHit(mapper));
		// System.out.println(list);
		
		mapper.close();
		return list;
	}
	
	// read.jsp, list.jsp에서 호출되는 mapper를 얻어온 후 MainDAO 클래스의 테이블에 저장된 
	// 추천수 랭크 글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainList selectGood() {
		// System.out.println("MainService 클래스의 selectGood() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainList list = new MainList();
		list.setList(MainDAO.getInstance().selectGood(mapper));
		// System.out.println(list);
		
		mapper.close();
		return list;
	}
	
	// read.jsp, list.jsp에서 호출되는 mapper를 얻어온 후 MainDAO 클래스의 테이블에 저장된 
	// 신규글 랭크 글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainList selectNew() {
		// System.out.println("MainService 클래스의 selectNew() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainList list = new MainList();
		list.setList(MainDAO.getInstance().selectNew(mapper));
		// System.out.println(list);
		
		mapper.close();
		return list;
	}
	
	public void delete(int idx) {
		// System.out.println("MainService 클래스의 delete() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().delete(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	public void update(MainVO vo) {
		// System.out.println("MainService 클래스의 update() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().update(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
//	search.jsp에서 호출되는 브라우저에 표시할 페이지 번호(currentPage), searchTag, category, searchVal를 넘겨받고 
//	mapper를 얻어온 후 MainDAO 클래스의 1페이지 분량의 카테고리에 따른 검색어를 포함하는 
//	글 목록을 얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public MainList selectSearchList(int currentPage) {
		// System.out.println("MainService 클래스의 selectSearchList() 메소드 실행");
		SqlSession mapper = MySession.getSession();	
		
		int pageSize = 10;
		int totalCount = MainDAO.getInstance().selectCount(mapper);		
		MainList mainList = new MainList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", mainList.getStartNo());
		hmap.put("endNo", mainList.getEndNo());
		mainList.setList(MainDAO.getInstance().selectList(mapper, hmap));
		
		mapper.close();
		return mainList;
	}
	
//	search.jsp에서 호출되는 브라우저에 표시할 페이지 번호(currentPage), searchTag, category, searchVal를 넘겨받고 
//	mapper를 얻어온 후 MainDAO 클래스의 1페이지 분량의 카테고리에 따른 검색어를 포함하는 
//	글 목록을 얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드	
	public MainList selectSearchList(int currentPage, String searchTag, String category, String searchVal) {
		// System.out.println("MainService 클래스의 selectSearchList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainList mainList = null;
		
		try {
			int pageSize = 10;
			Param param = new Param();
			param.setSearchTag(searchTag);
			param.setCategory(category);
			param.setSearchVal(searchVal);
			
			if (searchTag.equals("subject")) { // searchTag가 subject인 경우
				int totalCount = MainDAO.getInstance().selectCount(mapper, param);
				mainList = new MainList(pageSize, totalCount, currentPage);
				param.setStartNo(mainList.getStartNo());
				param.setEndNo(mainList.getEndNo());
				mainList.setList(MainDAO.getInstance().selectList(mapper, param));
			} else { // searchTag가 id인 경우
				int totalCount = MainDAO.getInstance().selectCount1(mapper, param);
				mainList = new MainList(pageSize, totalCount, currentPage);
				param.setStartNo(mainList.getStartNo());
				param.setEndNo(mainList.getEndNo());
				mainList.setList(MainDAO.getInstance().selectList1(mapper, param));

			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		mapper.commit();
		mapper.close();
		return mainList;
	}
	
	public void write(MainVO vo) {
		// System.out.println("MainService 클래스 write() 실행");
		SqlSession mapper = MySession.getSession();
		
		MainDAO.getInstance().write(mapper,vo);
		
		mapper.commit();
		mapper.close();
	}
	
	public int login(MemberVO vo) {
		// System.out.println("MainService 클래스 login()");
		SqlSession mapper = MySession.getSession();
		
		int loginCheck = MainDAO.getInstance().login(mapper, vo);
		
		mapper.commit();
		mapper.close();
		
		return loginCheck;
	}
	
//	비밀번호 찾기
	public MemberVO search_pw(MemberVO vo) {
		// System.out.println("MainService 클래스 search_pw()");
		SqlSession mapper = MySession.getSession();
		
		MemberVO search_pw = MainDAO.getInstance().search_pw(mapper,vo);
		
		mapper.commit();
		mapper.close();
		
		return search_pw;
	}
	
	
//	비밀번호 찾기
	public int search_pw_check(MemberVO vo) {
		// System.out.println("MainService 클래스 search_pw_check()");
		SqlSession mapper = MySession.getSession();
		
		int search_pw_check = MainDAO.getInstance().search_pw_check(mapper, vo);
		
		return search_pw_check;
		
	}
	
}
