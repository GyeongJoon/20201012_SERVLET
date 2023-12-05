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

    String sql = "delete from member where id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    int affectedRows = pstmt.executeUpdate();

    response.sendRedirect("../admin/index_ad.jsp");
%>