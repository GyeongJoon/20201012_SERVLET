<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>
<%@ page import="java.time.LocalDate" %>
<%
    // 앞에서 id 받아오기
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birth = request.getParameter("birth");
    String mail = request.getParameter("mail");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    LocalDate _regist_day = LocalDate.now();
    String  regist_day = String.valueOf(_regist_day);

    // DB 연동

    String sql = "select * from member where id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        // 회원 정보가 있으면 업데이트
        sql = "UPDATE member SET password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=? WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, password);
        pstmt.setString(2, name);
        pstmt.setString(3, gender);
        pstmt.setString(4, birth);
        pstmt.setString(5, mail);
        pstmt.setString(6, phone);
        pstmt.setString(7, address);
        pstmt.setString(8, id);  // 기존 회원 수정 시에는 id를 설정
        pstmt.executeUpdate();
    } else {
        // 회원 정보가 없으면 새로 추가
        if (id != null && !id.isEmpty()) {  // id가 비어 있지 않은 경우에만 추가
            sql = "INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setString(4, gender);
            pstmt.setString(5, birth);
            pstmt.setString(6, mail);
            pstmt.setString(7, phone);
            pstmt.setString(8, address);
            pstmt.executeUpdate();
        }
    }

    if (rs != null) {
        rs.close();
    }
    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }

    response.sendRedirect("../admin/index_ad.jsp");

%>



