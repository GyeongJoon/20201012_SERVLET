<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="example.*" %>

    <footer class="container">
        <p>&copy; 쇼핑몰 대표 : 장경준, 고유번호 : 20201012, 연락처 : jjangjoon328@naver.com<br>
            <%
    	ShopTime time = new ShopTime();
         %>    
        오늘 날짜와 시간 : <%=time.timenow() %>
        </p>
	</footer>
    
	