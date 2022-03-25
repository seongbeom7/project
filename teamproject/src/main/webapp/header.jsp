<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String mem_id = null;
		if(session.getAttribute("mem_id") != null){
			mem_id = (String)session.getAttribute("mem_id");
		}
	%>
    <div class="header">
        <div class="logo">
          <a href="main.jsp">
            <img src="img/x.PNG" alt="이미지 없음" width="100">
          </a>
        </div>
        <div class="title">
          <a href="main.jsp">
            <h2>페이지 제목</h2>
          </a>
        </div>
        <%
				// 로그인 하지 않았을 때 보여지는 화면
				if(mem_id == null){
		%>
        <div class="join">
          <p><a href="join.jsp"><img src="img/join.PNG" alt="회원가입"></a></p>
        </div>
        <div class="login">
          <p><a href="login.jsp"><img src="img/login.PNG" alt="로그인"></a></p>
        </div>
        <%
				// 로그인이 되어 있는 상태에서 보여주는 화면
				}else{
		%>
		<div style="float: right" class="logout">
          <p><a href="logoutAction.jsp"><img src="img/logout.PNG" alt="로그아웃"></a></p>
        </div>
		<%
				}
		%>
    </div>

    <div class="nav">
        <ul>
          <li><a href="#">카테고리1</a></li>
          <li><a href="#">카테고리2</a></li>
          <li><a href="#">카테고리3</a></li>
          <li><a href="bbslist.jsp">게시판</a></li>
          <li><a href="#">카테고리5</a></li>
        </ul>
    </div>
</body>
</html>