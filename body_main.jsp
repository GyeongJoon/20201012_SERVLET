<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page errorPage = "exception/main_server_downtime.jsp" %>
<%@ page import="java.sql.*"%>
<%@ include file="db/db_conn.jsp"%>

<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />

<%! String greeting = "WineShop.COM에 오신것을 환영합니다.";
	String tagline = "하단 페이지 : 확인";%>
	<div class="jumbotron">
		<h1>
            Welcome to WineShop
        </h1>
	</div>

    <div class="container">
	    <div class="jumbotron">
            <div class="container">
                <h3 class="display-4">
				    <%=greeting%>
            </h3>
		</div>
	</div>
<%
	ArrayList<Product> listOfProducts = productDAO.getAllProducts(); // 리스트에 상품 전체 정보를 얻어온다.
%> 	
	<div class="container">
		<div class="row" align="center">
                <%
                String sql = "select * from product"; // 조회
                pstmt = conn.prepareStatement(sql); // 연결 생성
                rs = pstmt.executeQuery(); // 쿼리 실행
                while (rs.next()) { // 결과 ResultSet 객체 반복
                %>

			<div class="col-md-4">
                <div class="card bg-dark text-white">
                    	<img src="image/product/<%=rs.getString("p_fileName")%>" class="card-img" alt="...">
                        <div class="card-img-overlay">
                        <h5 class="card-title">red wine 이미지 샘플</h5>
                        <p class="card-text">출처 : 구글 검색</p>
                </div>
              </div>
                
                <h3><%=rs.getString("p_name")%></h3>
                <p><%=rs.getString("p_description")%>
                <p><%=rs.getString("p_UnitPrice")%>원
                <p><a href="product_detail.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>

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

		</div>
		<hr>
	</div>

 <div class="card bg-dark text-black">
    <img src="image/wine.png" class="wine-img" alt="...">
    <div class="card-img-overlay">
    <h5 class="card-title">9월 이벤트</h5>
    <p class="card-text">출처 : 와인나라</p>
  </div>
  </div>
 <div class="card bg-dark text-white">
    <img src="image/wine2.png" class="wine2-img" alt="...">
    <div class="card-img-overlay">
    <h5 class="card-title">9월 이벤트</h5>
    <p class="card-text">출처 : 와인나라</p>
  </div>
  </div>
<div class="list-group">
      <a href="#" class="list-group-item list-group-item-action active" aria-current="true">Red Wine</a>
        1) 시라(Syrah) / 쉬라즈(Shiraz)<br>
        2) 말벡(Malbec)<br>
        3) 네비올로 (Nebbiolo)<br>
        4) 카베르네 소비뇽(Carbernet Sauvignon)<br>
        5) 진판델(Zinfandel) <br>
        6) 메를로(Merlot)<br>
        7) 산지오베제(Sangiovese)<br>
        8) 템프라니요(Tempranillo)<br>
        9) 피노 누아(Pinot Noir)<br>
        10) 가메 (Gamay)
      <a href="#" class="list-group-item list-group-item-action" >White Wine</a>
    1) 샤르도네(Chardonnay) = 샤도네이<br>
    2) 세미용(Semilion)<br>
    3) 리슬링(Riesling)<br>
    5) 슈냉블랑(Chenin Blanc)<br>
    6) 모스카토(Moscato) = 뮈스카(Muscat)<br>
    7) 피노그리(Pinot Gris)<br>
    8) 비오니에(Viognier)<br>
    9) 그뤼너 펠트리너(Gruner Veltliner)<br>
    10) 게뷔르츠트라미너(Gewurztraminer)
      <a href="#" class="list-group-item list-group-item-action">Rose Wine</a> 
    </div>
