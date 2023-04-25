<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	String correctpw = "1111";
	String pw = request.getParameter("pw");
	
	if(pw != null && pw.equals(correctpw)){ 
		session.setAttribute("adminLogin", "yes");
		response.sendRedirect("main.jsp");
	} else {
%>
	<script>
	alert('비밀번호가 일치하지 않습니다.');
 	location.href= "main.jsp";
	</script>
<%
	}
	
%>