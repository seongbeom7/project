<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.MemberDAO" %>
<%@ page import="User.Member" %>     
	<%PrintWriter script = response.getWriter();
	if(request.getParameter("phonenum") == ""){
	%>
bad
	<%}else{
			String phonenum = request.getParameter("phonenum");
			MemberDAO mdao = new MemberDAO();
			mdao.phoneconfirmation(phonenum);
	%>
good
	<%
		}		
	%>
