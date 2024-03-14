<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 돌아갈 때 쓰는 페이지</title>
</head>
<body>


<%
	request.setCharacterEncoding("UTF-8");
	
//	out.println(request.getParameter("backPage")); // ok
		int backPage = 1;
		try {
			backPage = Integer.parseInt(request.getParameter("backPage"));
		} catch (NumberFormatException e) {
			backPage = 1;
		}
		
		int idx;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
		} catch (NumberFormatException e) {
			idx = 1;
		}
		
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));			
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		
		
		out.println("<script>");

		switch (backPage) {
			case 1 : // main.jsp
				out.println("location.href='./list.jsp'");
				break;
			case 2 : // write.jsp
				out.println("location.href='./write.jsp'");
				break;
			case 3 : // read.jsp
				out.println("location.href='./selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
				break;
			default : // main.jsp
				out.println("location.href='./list.jsp'");
				break;
		}
		
		out.println("</script>");
%>



</body>
</html>