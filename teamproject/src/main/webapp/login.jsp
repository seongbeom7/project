<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>UI test</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
  </head>
  <body>
    <!-- header 부분 -->
	<jsp:include page="header.jsp"/>

	<!-- 내용 부분 -->	
    <hr>


    <div class="section">
      <div class="article1">
        <div class="login2">
        <form method="post" action="loginAction.jsp" class="loginsub">
          <input type="submit" name="login" value="로그인" class="login3">
          <input type="text" name="mem_id" >
          <input type="password" name="mem_password" >
          </form>
          <a href="#">
            <div class="passwordsearch">
              <h3>비밀번호찾기</h3>
            </div>
          </a>
          <a href="join.jsp">
            <div class="join2">
              <h3>회원가입</h3>
            </div>
          </a>

        </div>
      </div>
    </div>

    <aside>

    </aside>

    <jsp:include page="footer.jsp"/>

  </body>
</html>
