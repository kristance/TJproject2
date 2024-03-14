<%@page import="com.tjoeun.main.service.MainCommentService"%>
<%@page import="com.tjoeun.main.vo.MainCommentList"%>
<%@page import="com.tjoeun.main.vo.MainVO"%>
<%@page import="com.tjoeun.main.vo.MainList"%>
<%@page import="com.tjoeun.main.service.MainService"%>
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
%>

<jsp:useBean id="vo" class="com.tjoeun.main.vo.MainVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
	MainCommentList list = MainCommentService.getInstance().selectList(idx);
	MainVO mainvo = MainService.getInstance().selectByIdx(idx);
	
	MainList selectHit = MainService.getInstance().selectHit(); // 조회수 랭킹
	MainList selectGood = MainService.getInstance().selectGood(); // 추천수 랭킹
	MainList selectNew = MainService.getInstance().selectNew(); // 신규글 랭킹
	request.setAttribute("idx", idx);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("Mainboard", mainvo);
	request.setAttribute("enter", "\r\n");
	
	request.setAttribute("selectHit", selectHit);
	request.setAttribute("selectGood", selectGood);
	request.setAttribute("selectNew", selectNew);
	request.setAttribute("commentList", list);
	
	//	readUpdateOK.jsp로 넘겨준다.
	pageContext.forward("readUpdateOK.jsp");

%>

</body>
</html>