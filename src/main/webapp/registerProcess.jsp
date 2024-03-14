<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

    // 데이터베이스 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");                 
        String url = "jdbc:oracle:thin:@192.168.0.102:1521:xe";                    
        conn = DriverManager.getConnection(url, "admin2", "1234");          
        
        // 입력된 회원 정보를 가져옴
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String pw2 = request.getParameter("pw2");
        String name = request.getParameter("name");
        String nick = request.getParameter("nick");
        String email = request.getParameter("email");
        
        
        // 아이디 중복 검사 
        String sql = "SELECT COUNT(*) FROM REGISTER WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        int count = rs.getInt(1);
        rs.close();
        pstmt.close();
        if (count > 0) { // 이미 존재하는 아이디인 경우
            request.getSession().setAttribute("messageType", "오류 메시지: ");
            request.getSession().setAttribute("messageContent", "이미 존재하는 아이디입니다.");
            response.sendRedirect("register.jsp");
            return;
        }
        
        
        // 비밀번호 일치 검사
        if (!pw.equals(pw2)) {
            // 오류 메시지 설정
            request.getSession().setAttribute("messageType", "오류 메시지: ");
            request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다.");
            // 회원가입 양식 페이지로 리디렉션
            response.sendRedirect("register.jsp");
            return;
        }
        
        // 입력 체크
        if (id == null || id.equals("") || 
                pw == null || pw.equals("") ||
                pw2 == null || pw2.equals("") ||
                name == null || name.equals("") ||
                nick == null || nick.equals("") ||
                email == null || email.equals("")) {
            request.getSession().setAttribute("messageType", "오류 메시지: ");
            request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
	    	session.removeAttribute("messageType");
	    	session.removeAttribute("messageContent");
            response.sendRedirect("register.jsp");
            return;
        }
        // 회원 정보를 데이터베이스에 저장
        sql = "INSERT INTO REGISTER (id, pw, name, nick, email) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.setString(4, nick);
        pstmt.setString(5, email);
        int registerOk =  pstmt.executeUpdate();
        pstmt.close();
        
        // 성공 메시지 설정
        request.getSession().setAttribute("messageType", "성공 메시지: ");
        request.getSession().setAttribute("messageContent", "회원가입이 완료되었습니다.");
        session.setAttribute("registerOk", registerOk);
    	session.removeAttribute("messageType");
    	session.removeAttribute("messageContent");
        response.sendRedirect("list.jsp");		// <--- 회원가입 성공시 다른 페이지로 보내게 수정할 것
    } catch (Exception e) {
        e.printStackTrace();
        // 오류 메시지 설정
        request.getSession().setAttribute("messageType", "오류 메시지: ");
        request.getSession().setAttribute("messageContent", "회원가입 중 오류가 발생했습니다.");
    	session.removeAttribute("messageType");
    	session.removeAttribute("messageContent");
        response.sendRedirect("register.jsp");
    } finally {
        // 자원 해제
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
        if (conn != null) try { conn.close(); } catch (SQLException ex) {}
    }
%>
