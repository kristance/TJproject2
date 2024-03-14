<%@page import="com.tjoeun.main.service.MainService"%>
<%@page import="com.tjoeun.main.vo.MainList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tjoeun.main.vo.MainCommentList"%>
<%@page import="com.tjoeun.main.service.MainCommentService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="vo" class="com.tjoeun.main.vo.MainCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
//	테이블에 저장된 댓글 목록을 얻어와서 commentList 클래스의 ArrayList에 저장한 후
//	CommentList 클래스 객체를 request 영역에 저장해서 read.jsp 페이지로 넘겨받음
	MainCommentList list = MainCommentService.getInstance().selectList(idx);

	MainList selectHit = MainService.getInstance().selectHit(); // 조회수 랭킹
	MainList selectGood = MainService.getInstance().selectGood(); // 추천수 랭킹
	MainList selectNew = MainService.getInstance().selectNew(); // 신규글 랭킹
	request.setAttribute("idx", idx);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("Mainboard", vo);
	request.setAttribute("enter", "\r\n");
	request.setAttribute("selectHit", selectHit);
	request.setAttribute("selectGood", selectGood);
	request.setAttribute("selectNew", selectNew);
	request.setAttribute("commentList", list);
	
	pageContext.forward("read.jsp");
%>

</body>
</html>