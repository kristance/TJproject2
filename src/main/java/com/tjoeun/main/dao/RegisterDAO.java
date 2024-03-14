package com.tjoeun.main.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    // 데이터베이스 연결 정보
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@192.168.0.102:1522:xe";
    String username = "admin";
    String password = "1234";


    public RegisterDAO() {
        try {
            // 데이터베이스 연결
        	 Class.forName("oracle.jdbc.driver.OracleDriver");                 
             String url = "jdbc:oracle:thin:@192.168.0.102:1522:xe";                    
             conn = DriverManager.getConnection(url, "admin", "1234");       
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 중복된 ID를 검사하는 메소드
    public boolean checkDuplicateID(String id) {
        try {
            String sql = "SELECT COUNT(*) FROM REGISTER WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // 중복된 ID가 있으면 true, 없으면 false 반환
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false;
    }
    
    // 자원 해제 메소드
    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
