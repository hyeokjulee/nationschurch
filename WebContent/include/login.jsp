<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String adminLogin = (String)session.getAttribute("adminLogin");
	boolean admin = false;
	
	if (adminLogin != null && adminLogin.equals("yes")) {
		admin = true;	//adminLogin 세션에 yes값 들어있으면 true(관리자 로그인된 상태), 아니면 false
	}

%>
