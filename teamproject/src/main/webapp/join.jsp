<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>login</title>
    <link rel="stylesheet" href="css/join.css">
  </head>
  <body>
  <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>	
    <form action="joinAction.jsp" method="post">
    <div class="logindiv">
      <ul class="login">
        <li>
          <h3>아이디</h3>
          <input type="text" name="mem_id">
        </li>
        <li>
          <h3>비밀번호</h3>
          <input type="password" name="mem_password">
        </li>
        <li>
          <h3>비밀번호 재확인</h3>
          <input type="password" name="password2">
        </li>
        <li>
          <h3>이름</h3>
          <input type="text" name="mem_name">
        </li>
        <li>
          <h3>생년월일</h3>
          
            <input type="date" name = "mem_birth">
          
        </li>
        <li>
          <h3>성별</h3>
          <input type="text" name="mem_gender">
        </li>
        <li>
          <h3>전화번호</h3>
          <input type="text" name="mem_phone" id = "phonenum">
          <input type="button" class = "btn btn-primary form-control" value="인증번호받기" onclick="btn_click()">
          <br><br>
          <input type="text" name="phonetest">
        </li>
        <li>
          <input type="submit" class="btn btn-primary form-control" value="회원가입">
        </li>
        <li>
          <a href="main.jsp">
            <div class="cancel">
              <p>취소</p>
              
            </div>
          </a>
        </li>
      </ul>
    </div>
    </form>
    <script type="text/javascript">
    function btn_click(){
    	const num = $('#phonenum').val();
    	$.ajax({
    		  type:'post',
    		  async:false,
    		  url:'confirmation.jsp',
    		  data:{phonenum:num},
    		  dataType: 'text',
    		  success:function(data, textStatus) {    			 
    		     if($.trim(data) === "good"){
    		    	 alert("인증번호를 전송하였습니다.");
    		     }else{
    		    	 alert("번호를 다시 확인해 주세요")
    		     }
    		  },
    		  error:function (data, textStatus) {
    	          console.log('error');
    	          alert("error");
    	      }
    		});
    }
    
    </script>
  </body>
</html>
