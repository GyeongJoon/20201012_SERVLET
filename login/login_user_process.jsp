<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>

<%
    // 앞에서 id 받아오기
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("j_username");
    String password = request.getParameter("j_password");

    //DB 연동
    String sql = "SELECT * FROM member WHERE id=? AND password=?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, password);   

    ResultSet rss = pstmt.executeQuery();

    if (rss.next()) {
        // 로그인 성공 시 세션 속성 설정 후 메인 페이지로 리다이렉트
        session.setAttribute("user_id", id);
        response.sendRedirect("../index.jsp");
    } else {
        // 로그인 실패 시 로그인 페이지로 리다이렉트하면서 에러 메시지 전달
        response.sendRedirect("../login/login_user.jsp?error=true");
    }
%>


