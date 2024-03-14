package com.tjoeun.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.main.vo.MainVO;
import com.tjoeun.main.vo.MemberVO;
import com.tjoeun.main.vo.Param;

public class MainDAO {
	private static MainDAO instance = new MainDAO();
	private MainDAO() { }
	public static MainDAO getInstance() {
		return instance;
	}
	
//	MainService 클래스에서 호출되는 mapper와 메인글이 저장된 객체를 넘겨받고 메인글을 저장하는 
//	main.xml 파일의 insert sql 명령을 실행하는 메소드	
	public void insert(SqlSession mapper, MainVO vo) {
		// System.out.println("MainDAO 클래스의 insert() 메소드 실행");
		mapper.insert("insert", vo);
	}
	
//	MainService 클래스에서 호출되는 mapper를 넘겨받고 메인글 전체 개수를 얻어오는 main.xml
//	파일의 select sql 명령을 실행하는 메소드	
	public int selectCount(SqlSession mapper) {
		// System.out.println("MainDAO 클래스의 selectCount() 메소드 실행");
		return (int) mapper.selectOne("selectCount");
	}
	
//	MainService 클래스에서 호출되는 mapper와 1페이지 분량의 시작 인덱스, 끝 인덱스가 저장된
//	HashMap 객체를 넘겨받고 1페이지 분량의 메인글 목록을 얻어오는 main.xml 파일의 
//	select sql 명령을 실행하는 메소드	
	public ArrayList<MainVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		// System.out.println("MainDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectList", hmap);
	}

//	MainService 클래스에서 호출되는 mapper와 해당 글 인덱스가 저장된 객체를 넘겨받고 
//	해당 글 인덱스의 메인글 목록을 얻어오는 main.xml 파일의 select sql 명령을 실행하는 메소드
	public MainVO selectByIdx(SqlSession mapper, int idx) {
		// System.out.println("MainDAO 클래스의 selectByIdx() 메소드 실행");
		return (MainVO) mapper.selectOne("selectByIdx", idx);
	}

//	MainService 클래스에서 호출되는 mapper와 조회수를 증가시킬 글번호를 넘겨받고 조회수를
//	증가시키는 main.xml 파일의 update sql 명령을 실행하는 메소드	
	public void increment(SqlSession mapper, int idx) {
		// System.out.println("MainDAO 클래스의 increment() 메소드 실행");
		mapper.update("increment", idx);
	}

	public ArrayList<MainVO> selectHit(SqlSession mapper) {
		// System.out.println("MainDAO 클래스의 selectHit() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectHit");
	}
	
	public ArrayList<MainVO> selectGood(SqlSession mapper) {
		// System.out.println("MainDAO 클래스의 selectGood() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectGood");
	}
	
	public ArrayList<MainVO> selectNew(SqlSession mapper) {
		// System.out.println("MainDAO 클래스의 selectNew() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectNew");
	}
	
	public void delete(SqlSession mapper, int idx) {
		// System.out.println("MainDAO 클래스의 delete() 메소드 실행");
		mapper.update("delete", idx);
	}
	
	public void update(SqlSession mapper, MainVO vo) {
		// System.out.println("MainDAO 클래스의 update() 메소드 실행");
		mapper.update("update", vo);
	}
	
//	MainService 클래스에서 호출되는 mapper와 태그, 카테고리, 검색어가 저장된 Param 클래스 객체를 넘겨받고 
//	main.xml 파일의 테이블에 저장된 전체 글 중에서 태그 따른 검색어를 포함하는 글의 개수를
//	얻어오는 select sql 명령을 실행하는 메소드
	public int selectCount(SqlSession mapper, Param param) {
		// System.out.println("MainDAO 클래스의 selectCount() 메소드 실행");
		int count = (int) mapper.selectOne("selectCountMulti", param); 
		
		return count;
	}
	
//	MainService 클래스에서 호출되는 mapper와 화면에 출력할 시작 인덱스와 끝 인덱스, 카테고리, 검색어가 
//	저장된 Param 클래스 객체를 넘겨받고 main.xml 파일의 테이블에 저장된 전체 글 중에서 카테고리별 
//	검색어를 포함하는 글의 목록을 얻어오는 select sql 명령을 실행하는 메소드	
	public ArrayList<MainVO> selectList(SqlSession mapper, Param param) {
		// System.out.println("MainDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectListMulti", param);
	}
	
	
//	if searchTag = id -> count
	public int selectCount1(SqlSession mapper, Param param) {
		// System.out.println("MainDAO 클래스의 selectCount1() 메소드 실행");
		return (int) mapper.selectOne("selectCount1", param);
	}
	
//	if searchTag = id -> list
	public ArrayList<MainVO> selectList1(SqlSession mapper, Param param) {
		// System.out.println("MainDAO 클래스의 selectList1() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectList1", param);
	}
	
//	글 추천
	public void good(SqlSession mapper, int idx) {
		// System.out.println("MainDAO 클래스의 good() 메소드 실행");
		mapper.update("good", idx);
	}
	
//	글 저장
	public void write(SqlSession mapper, MainVO vo) {
		// System.out.println("MainDAO 클래스 write() 실행");
		mapper.insert("write", vo);
	}
	
//	로그인	
	public int login(SqlSession mapper, MemberVO vo) {
		// System.out.println("MainDAO 클래스 login() 실행");
		int loginCheck = (int) mapper.selectOne("login", vo);
		// System.out.println(loginCheck);
		return loginCheck;
	}
	
//	비밀번호 찾기
	public MemberVO search_pw(SqlSession mapper, MemberVO vo) {
		// System.out.println("MainDAO 클래스 search_pw() 실행");
		MemberVO search_pw =  (MemberVO) mapper.selectOne("search_pw", vo);
		return search_pw;
	}
	
//	비밀번호 찾기
	public int search_pw_check(SqlSession mapper, MemberVO vo) {
		// System.out.println("MainDAO 클래스 search_pw_check() 실행");
		int search_pw_check = (int) mapper.selectOne("search_pw_check", vo);
		return search_pw_check;
	}

}
