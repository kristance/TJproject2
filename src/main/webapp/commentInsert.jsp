 <%@page import="com.tjoeun.main.service.MainCommentService"%>
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

<jsp:useBean id="vo" class="com.tjoeun.main.vo.MainCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int gup = Integer.parseInt(request.getParameter("gup"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
//	read.jsp에서 넘겨받은 댓글 정보 테이블에 저장하는 메소드 호출
	MainCommentService.getInstance().insert(vo);
//	저장 후 페이지 넘김
	response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage);
%>

</body>
</html>