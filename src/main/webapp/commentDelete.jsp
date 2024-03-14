<%@page import="com.tjoeun.main.service.MainCommentService"%>
<%@page import="com.tjoeun.main.vo.MainCommentVO"%>
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
	int comidx = Integer.parseInt(request.getParameter("commentidx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	//	삭제한 댓글에 삭제 완료 메시지 표시 위해 원 댓글 내용 얻어옴
	MainCommentVO originalComment = MainCommentService.getInstance().selectByIdx(comidx);
	// commentService.getInstance().delete(vo.getIdx());
	MainCommentService.getInstance().deleteCheck(comidx);

	response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage);
%>

</body>
</html>