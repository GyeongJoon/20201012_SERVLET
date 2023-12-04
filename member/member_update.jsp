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
    <title>회원 수정</title>
</head>
<body>
   <jsp:include page="../admin/top_menu_ad.jsp" />
   <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">회원 수정</h1>
        </div>
   </div>
   <%@ include file="../db/db_conn.jsp"%>
   <%
    String productId = request.getParameter("id");

    String sql = "select * from member where id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    rs = pstmt.executeQuery();
    if (rs.next()) {
   %>
<div class="container">
      <div class="row">
        <div class="col-md-8 offset-md-2">
            <form name="newProduct" action="member_update_process.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
	    <div class="form-group row">
		<label class="col-sm-2">아이디</label>
		<div class="col-sm-3">
			<input type="text" id="id_<%=rs.getString("id")%>" name="id" class="form-control" value='<%=rs.getString("id")%>' readonly>
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">패스워드</label>
		<div class="col-sm-3">
			<input type="password" id="<%=rs.getString("id")%>" name="password" class="form-control" value="<%=rs.getString("password")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">패스워드 재입력</label>
		<div class="col-sm-3">
			<input type="password" id="<%=rs.getString("id")%>" name="password" class="form-control" value="<%=rs.getString("password")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">이름</label>
		<div class="col-sm-5">
			<input type="text" id="<%=rs.getString("id")%>" name="name" class="form-control" value="<%=rs.getString("name")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">생일</label>
		<div class="col-sm-3">
			<input type="date" id="<%=rs.getString("id")%>" name="birth" class="form-control" value="<%=rs.getString("birth")%>">
		</div>
	    </div>
	    <div class="form-group row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-3">
				<select id="gender" name="gender" class="form-control">
					<option value="남자" <%= rs.getString("gender").equals("남자") ? "selected" : "" %>>남자</option>
					<option value="여자" <%= rs.getString("gender").equals("여자") ? "selected" : "" %>>여자</option>
				</select>
			</div>
		</div>
	    <div class="form-group row">
			<label class="col-sm-2">메일주소</label>
			<div class="col-sm-3">
				<input type="email" id="<%=rs.getString("id")%>" name="mail" class="form-control" placeholder="abcabc123@naver.com" value="<%=rs.getString("email")%>">
			</div>
	    </div>
	    <div class="form-group row">
			<label class="col-sm-2">폰 번호</label>
			<div class="col-sm-3">
				<input type="tel" id="<%=rs.getString("id")%>" name="phone" class="form-control" value="<%=rs.getString("phone")%>">
			</div>
	    </div>
	    <div class="form-group row">
			<label class="col-sm-2">우편번호</label>
			<div class="col-sm-3">
				<input type="text" id="<%=rs.getString("id")%>" name="address" class="form-control" value="<%=rs.getString("address")%>">
			</div>
	    </div>
	    <div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10">
			<input type="submit" class="btn btn-primary" value="수정">
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

