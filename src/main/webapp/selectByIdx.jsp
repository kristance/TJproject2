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
<jsp:useBean id="co" class="com.tjoeun.main.vo.MainCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String job = request.getParameter("job");
	if (job == null) {
		job = "";
	}
	
	// read.jsp에서 삭제 버튼 클릭 시
	if (job.equals("delete")) {
		MainService.getInstance().delete(idx);
		response.sendRedirect("list.jsp?currentPage=" + currentPage);
	// read.jsp에서 수정 버튼 클릭 시
	} else if(job.equals("update")) {
		MainService.getInstance().selectByIdx(idx);
		response.sendRedirect("readUpdate.jsp?idx=" + idx + "&currentPage=" + currentPage);
	// read.jsp에서 추천 버튼 클릭 시
	} else if(job.equals("good")) {
		MainService.getInstance().good(idx);
		System.out.println("goodidxcheck" + idx);
		session.setAttribute("goodidxcheck" + idx, "checked");
		response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage);
	// readUpdate.jsp에서 수정 완료 버튼 클릭 시
	} else if(job.equals("updateOK")) {
		if (vo.getCategory() == null || vo.getCategory().equals("카테고리 입력") || vo.getCategory().trim().equals("")) {
			out.println("<script>");
			out.println("alert('카테고리를 입력하세요')");
			out.println("location.href='readUpdate.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
			
		} else if (vo.getSubject() == null || vo.getSubject().trim().equals("")) {
			out.println("<script>");
			out.println("alert('제목을 입력하세요')");
			out.println("location.href='readUpdate.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
			
		} else if (vo.getContent() == null || vo.getContent().trim().equals("")) {
			out.println("<script>");
			out.println("alert('내용을 입력하세요')");
			out.println("location.href='readUpdate.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
			
		} else {
			MainService.getInstance().update(vo);
			out.println("<script>");
			out.println("alert('정상적으로 수정되었습니다')");
			out.println("location.href='selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
			
		}
		out.println("</script>");
	// Main.jsp에서 게시글 제목 클릭 시, readUpdate.jsp에서 수정 취소 버튼 클릭 시
	} else {
		
		MainVO mainvo = MainService.getInstance().selectByIdx(idx); // 메인글
		MainCommentList list = MainCommentService.getInstance().selectList(idx); // 해당 글의 댓글
		
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
		
		try {
			session.getAttribute("goodidxcheck" + idx);
		} catch (NullPointerException e) {
			session.setAttribute("goodidxcheck" + idx, "un");
		}
		
		//	read.jsp로 넘겨준다.
		pageContext.forward("read.jsp");
	}

%>

</body>
</html>