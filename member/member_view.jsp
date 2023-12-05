<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDate" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>회원 정보</title>
</head>
<body>
   <jsp:include page="../admin/top_menu_ad.jsp" />
   <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">회원 정보</h1>
        </div>
   </div>
   <%@ include file="../db/db_conn.jsp"%>
                <%
                    String sql = "select * from member"; // 조회..
                    pstmt = conn.prepareStatement(sql); // 연결 생성
                    rs = pstmt.executeQuery(); // 쿼리 실행
                    while (rs.next()) { // 결과 ResultSet 객체 반복
                %>

			<div class="col-md-4">
                <div class="card bg-dark text-white">
                        <div class="card-img-overlay">

                </div>
              </div>
                
<div style="float: left; width: 50%;">
    <h3>ID</h3>
    <p>:<%=rs.getString("id")%></p>
</div>

<div style="float: left; width: 50%;">
    <h3>PW</h3>
    <p>:<%=rs.getString("password")%></p>
</div>

<div style="clear: both;"></div> <!-- clear floating elements -->

<div style="float: left; width: 50%;">
    <h3>이름</h3>
    <p>:<%=rs.getString("name")%></p>
</div>

<div style="float: left; width: 50%;">
    <h3>성별</h3>
    <p>:<%=rs.getString("gender")%></p>
</div>

<div style="clear: both;"></div> <!-- clear floating elements -->

<div style="float: left; width: 50%;">
    <h3>생일</h3>
    <p>:<%=rs.getString("birth")%></p>
</div>

<div style="float: left; width: 50%;">
    <h3>메일</h3>
    <p>:<%=rs.getString("mail")%></p>
</div>

<div style="clear: both;"></div> <!-- clear floating elements -->

<div style="float: left; width: 50%;">
    <h3>번호</h3>
    <p>:<%=rs.getString("phone")%></p>
</div>

<div style="float: left; width: 50%;">
    <h3>주소</h3>
    <p>:<%=rs.getString("address")%></p>
</div>

<div style="clear: both;"></div> <!-- clear floating elements -->


			</div>
        <%
                 }// 반복문 끝난 이후 db 연결 종료	
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        %>

 <hr>
 <jsp:include page="../admin/footer_ad.jsp" />
</body>
</html>