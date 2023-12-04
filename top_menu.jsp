<%@ page contentType="text/html; charset=utf-8"%>
<nav class="navbar navbar-expand  navbar-white bg-white">
	<div class="dropdown">
  		<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		 Category
  		</button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="#">Red</a>
        <a class="dropdown-item" href="#">White</a>    
        <a class="dropdown-item" href="#">Rose</a>
     </div>
	</div>
    
    <div>
        <img src="image\logo.gif" class="img-fluid" alt="main_image">
    </div>
    
	<div class="container">
		<div class="navbar-header">     
            <a class="navbar-brand" href="index.jsp" style="margin-right:100px" >상품목록(기본 홈)</a>       
            <a class="navbar-brand" href="../login/login_user.jsp" style="margin-right:100px">로그인</a>
            <a class="navbar-brand" href="../member/member_join.jsp" style="margin-right:100px" >회원가입</a>
            <a class="navbar-brand" href="/BoardListAction.do?pageNum=1"style="margin-right:100px" >게시판(고객센터)</a>
            <a class="navbar-brand" href="admin/index_ad.jsp"style="margin-right:100px" >관리자모드</a>
		</div>
	</div>
</nav>