<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate(); //세션 날리기
	response.sendRedirect("main.jsp");
%>