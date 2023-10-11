<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page errorPage = "exception/main_server_downtime.jsp" %>
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
				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
                <div class="card bg-dark text-white">
                        <img src="image/product/<%=product.getProductId()%>.jpg" class="card-img" alt="...">
                        
                        <div class="card-img-overlay">
                        <h5 class="card-title">red wine 이미지 샘플</h5>
                        <p class="card-text">출처 : 구글 검색</p>
                        </div>
                        </div>
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
                <p><a href="product_detail.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상품 상세 정보 &raquo;</a>
			</div>
			<%
				}
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
