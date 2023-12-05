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
    <title>회원 보기</title>
    <script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("회원 정보를 삭제합니다!!") == true)
		   location.href = "member_delete.jsp?id=" + id;
		else
		   return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
        if (edit == null) {
        // edit 값이 null일 경우에 대한 처리 (예: 기본값으로 "update"를 설정)
        edit = "update";
    }
%>
<body>
   <jsp:include page="../admin/top_menu_ad.jsp" />
   <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">회원 보기</h1>
        </div>
   </div>
   <%@ include file="../db/db_conn.jsp"%>
                <%
                    String sql = "select * from member"; // 조회..
                    pstmt = conn.prepareStatement(sql); // 연결 생성
                    rs = pstmt.executeQuery(); // 쿼리 실행
                    while (rs.next()) { // 결과 ResultSet 객체 반복
                %>
<div class="container">
      <div class="row">
        <div class="col-md-8 offset-md-2">
            <form name="newProduct" action="member_update_process.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
	    <div class="form-group row">
		<label class="col-sm-2">아이디</label>
		<div class="col-sm-3">
			<input type="text" id="id" name="id" class="form-control" value='<%=rs.getString("id")%>' readonly>
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">패스워드</label>
		<div class="col-sm-3">
			<input type="password" id="password" name="password" class="form-control" value="<%=rs.getString("password")%>" readonly>
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">이름</label>
		<div class="col-sm-5">
			<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("name")%>" readonly>
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">생일</label>
		<div class="col-sm-3">
			<input type="date" id="birth" name="birth" class="form-control" value="<%=rs.getString("birth")%>" readonly>
		</div>
	    </div>
	    <div class="form-group row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-3">
				<select id="gender" name="gender" class="form-control" readonly>
					<option value="남자" <%= rs.getString("gender").equals("남자") ? "selected" : "" %>readonly>남자</option>
					<option value="여자" <%= rs.getString("gender").equals("여자") ? "selected" : "" %>readonly>여자</option>
				</select>
			</div>
		</div>
	    <div class="form-group row">
			<label class="col-sm-2">메일주소</label>
			<div class="col-sm-3">
				<input type="email" id="mail" name="mail" class="form-control" placeholder="abcabc123@naver.com" value="<%=rs.getString("mail")%>" readonly>
			</div>
	    </div>
	    <div class="form-group row">
			<label class="col-sm-2">폰 번호</label>
			<div class="col-sm-3">
				<input type="tel" id="phone" name="phone" class="form-control" value="<%=rs.getString("phone")%>" readonly>
			</div>
	    </div>
	    <div class="form-group row">
			<label class="col-sm-2">우편번호</label>
			<div class="col-sm-3">
				<input type="text" id="address" name="address" class="form-control" value="<%=rs.getString("address")%>" readonly>
			</div>
	    </div>
	    <div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10">
		<%
		     if (edit.equals("update")) {
		%>
		     <a href="member_update.jsp?id=<%=rs.getString("id")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
		<%
		     } else if (edit.equals("delete")) {
		%>
		     <a href="#" onclick="deleteConfirm('<%=rs.getString("id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
		<%
		     }
		%>
		</div>
	    </div>
                </form>
        </div>
   </div>

</div>
    <%
	}
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