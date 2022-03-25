<%@page import="java.io.PrintWriter"%>
<%@page import="User.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="User.Member" />
<jsp:setProperty name="member" property="mem_id" />
<jsp:setProperty name="member" property="mem_password" />
<jsp:setProperty name="member" property="mem_name" />
<jsp:setProperty name="member" property="mem_birth" />
<jsp:setProperty name="member" property="mem_gender" />
<jsp:setProperty name="member" property="mem_phone" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 현재 세션 상태를 체크한다
		String mem_id = null;
		if(session.getAttribute("mem_id") != null){
			mem_id = (String)session.getAttribute("mem_id");
		}
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if(mem_id != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	
		if(member.getMem_id() == null || member.getMem_password() == null || member.getMem_name() == null ||
			member.getMem_birth() == null || member.getMem_gender() == null || member.getMem_phone() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			MemberDAO memberDAO = new MemberDAO();
			int result = memberDAO .join(member);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				session.setAttribute("mem_id", member.getMem_id());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>