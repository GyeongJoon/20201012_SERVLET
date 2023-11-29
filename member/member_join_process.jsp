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

    //DB 연동
    String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";

    pstmt = conn.prepareStatement(sql); // 쿼리문 몸체만 넣기
    pstmt.setString(1, id); // 각 필드 설정 - ? 순서대로
    pstmt.setString(2, password);
    pstmt.setString(3, name);
    pstmt.setString(4, gender);
    pstmt.setString(5, birth);
    pstmt.setString(6, mail);
    pstmt.setString(7, phone);
    pstmt.setString(8, address);   
    pstmt.setObject(9, regist_day);    

    pstmt.executeUpdate(); // 최종 SQL 쿼리 실행

    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();

    response.sendRedirect("../index.jsp");
%>