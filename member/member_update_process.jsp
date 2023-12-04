<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>
<%@ page import="java.time.LocalDate" %>
<%@ include file="../db/db_conn.jsp" %>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birth = request.getParameter("birth");
    String mail = request.getParameter("mail");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    // DB 연동

    String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();

    if (rs.next()) {
    String sql = "UPDATE member SET p_password=?, p_name=?, p_gender=?, p_birth=?, p_mail=?, p_phone=?, p_address=? WHERE id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, password);
    pstmt.setString(2, name);
    pstmt.setString(3, gender);
    pstmt.setString(4, birth);
    pstmt.setString(5, mail);
    pstmt.setString(6, phone);
    pstmt.setString(7, address);
    pstmt.setString(8, id);
    pstmt.executeUpdate();
    }
    else {
    String sql = "UPDATE member SET p_password=?, p_name=?, p_gender=?, p_birth=?, p_mail=?, p_phone=?, p_address=? WHERE id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, password);
    pstmt.setString(2, name);
    pstmt.setString(3, gender);
    pstmt.setString(4, birth);
    pstmt.setString(5, mail);
    pstmt.setString(6, phone);
    pstmt.setString(7, address);
    pstmt.setString(8, id);
    pstmt.executeUpdate();
    }
    if (rs != null)
		rs.close();
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();

    response.sendRedirect("./index_ad.jsp");
%>
