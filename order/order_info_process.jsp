<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%
	request.setCharacterEncoding("UTF-8"); // 표준 인코딩 설정 : 한글 깨짐 방지

	// 현재 날짜를 가져옴
	Date currentDate = new Date();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(currentDate);
	calendar.add(Calendar.DATE, 1); // 현재 날짜에 1일을 더함 (내일)

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	// 내일 날짜를 문자열로 변환
	String tomorrow = sdf.format(calendar.getTime());

	String inputDate = request.getParameter("shippingDate");

	if (inputDate != null && !inputDate.isEmpty() && inputDate.compareTo(tomorrow) >= 0) {
		// 입력된 날짜가 내일 이후일 경우에만 쿠키 설정

		Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8")); // 표준 코드 형태로 변환
		Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
		Cookie country = new Cookie("Shipping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode",	URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
		Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

		cartId.setMaxAge(24 * 60 * 60); // 초 단위
		name.setMaxAge(24 * 60 * 60);
		zipCode.setMaxAge(24 * 60 * 60);
		country.setMaxAge(24 * 60 * 60);
		addressName.setMaxAge(24 * 60 * 60);

		response.addCookie(cartId); // 생성된 쿠키 추가
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);

		response.sendRedirect("order_confirm.jsp");
	} else {
		// 날짜가 유효하지 않을 경우 처리
		out.println("배송일은 내일 이후로 선택해주세요.");
	}
%>
