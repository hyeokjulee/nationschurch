<%@page import="java.io.File"%>
<%@page import="jdbc.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String filename = request.getParameter("gfilename");
	String uuid = request.getParameter("guuid");
	int gno = Integer.parseInt(request.getParameter("gno"));

	// 해당 앱 내 업로드 경로 설정
	//String uploadPath = "/resources/gallery";
	// 실제 업로드 저장 경로 설정
	//String savePath = application.getRealPath(uploadPath);
	
	// cafe24 업로드
	String uploadPath = "/upload/photo";
	String savePath = "/nationschurch/tomcat/webapps" + uploadPath;

	File uploadFile = new File(uploadPath, uuid + "_" + filename);
	if(uploadFile.exists()){
		uploadFile.delete();
	}
	File saveDir = new File(savePath);
	if(saveDir.exists()){
		saveDir.delete();
	}
	
	GalleryDAO.delete(gno);
	response.sendRedirect("gallery.jsp");
%>