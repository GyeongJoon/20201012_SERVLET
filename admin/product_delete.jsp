<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%@ include file="../db/db_conn.jsp"%>

<%
    String productId = request.getParameter("id");

    try {
        // 삭제 쿼리
        String deleteSql = "DELETE FROM product WHERE p_id = ?";
        PreparedStatement deletePstmt = conn.prepareStatement(deleteSql);
        deletePstmt.setString(1, productId);

        // 실행
        int affectedRows = deletePstmt.executeUpdate();

        // 삭제가 성공한 경우
        if (affectedRows > 0) {
            response.sendRedirect("product_edit.jsp?edit=delete");
        } else {
            // 삭제 실패
            out.println("상품 삭제에 실패했습니다.");
        }

        // 자원 해제
        if (deletePstmt != null) {
            deletePstmt.close();
        }

    } catch (SQLException ex) {
        out.println("SQL Exception: " + ex.getMessage());
    } finally {
        // 최종적으로 연결을 닫아줍니다.
        if (conn != null) {
            conn.close();
        }
    }
%>

