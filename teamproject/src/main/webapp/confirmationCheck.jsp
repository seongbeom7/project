<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.MemberDAO" %>
<%@ page import="User.Member" %>     
<%
	String phonenum = request.getParameter("phonenum");
	String phonekey = request.getParameter("phonekey");
	MemberDAO mdao = new MemberDAO();
	int auth = mdao.confirmationCheck(phonenum,phonekey);
	if(auth == 1){
		out.write("성공");
	}else {
		out.write("실패");
	}
%>