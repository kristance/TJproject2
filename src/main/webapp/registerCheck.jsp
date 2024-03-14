<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");


    // 데이터베이스 연결 정보
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@192.168.0.102:1521:xe";
    String username = "admin2";
    String password = "1234";

    // 입력된 아이디 가져오기
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean isDuplicate = false;

    try {
        // 데이터베이스 연결
        Class.forName(driver);
        conn = DriverManager.getConnection(url, username, password);

        // 아이디 중복 검사
        String sql = "SELECT COUNT(*) FROM REGISTER WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count > 0) {
                // 중복된 아이디가 있는 경우
                isDuplicate = true;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 중복 여부에 따른 결과 출력
    if (isDuplicate) {
        out.println("<span style='color: red;'>이미 존재하는 아이디입니다.</span>");
    } else {
        out.println("<span style='color: green;'>사용할 수 있는 아이디입니다.</span>");
    }
%>
