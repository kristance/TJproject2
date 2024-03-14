<%@page import="java.util.ArrayList"%>
<%@page import="com.tjoeun.main.vo.MainVO"%>
<%@page import="com.tjoeun.main.service.MainService"%>
<%@page import="com.tjoeun.main.vo.MainList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다.
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) {
		
	}
	
	//	1페이지 분량의 메인글을 얻어온다.
	MainList mainList = MainService.getInstance().selectList(currentPage); // 메인글
	
	//	조회수가 높은 순으로 메인 글을 얻어온다.
	MainList selectHit = MainService.getInstance().selectHit(); // 조회수 랭킹
	MainList selectGood = MainService.getInstance().selectGood(); // 추천수 랭킹
	MainList selectNew = MainService.getInstance().selectNew(); // 신규글 랭킹

	
	// 메인글을 request 영역에 저장해서 메인글을 브라우저에 표시하는 페이지(Main.jsp)로 넘겨준다.
	request.setAttribute("mainList", mainList); // 메인글을 request 영역에 저장한다.
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("selectHit", selectHit);
	request.setAttribute("selectGood", selectGood);
	request.setAttribute("selectNew", selectNew);
	
	pageContext.forward("Main.jsp");
%>




</body>
</html>