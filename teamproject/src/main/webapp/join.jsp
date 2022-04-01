<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="User.MemberDAO"%>
<%@ page import="User.Member"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>login</title>
<link rel="stylesheet" href="css/join.css">
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<!-- 강사님이 알려준 비밀번호 중복방법 -->
	<script>
		function checkform() {
			if (document.frm.mem_password.value != document.frm.password2.value) {
				alert("비밀번호가 다름니다.");
				return false;

			} else {
				document.frm.submit();
			}
		}
	</script>

	<form action="joinAction.jsp" method="post" name="frm">
		<div class="logindiv">
			<ul class="login">
				<li>
					<h3>아이디</h3> <input type="text" name="mem_id">
				</li>
				<li>
					<h3>비밀번호</h3> <input type="password" name="mem_password">
				</li>
				<li>
					<h3>비밀번호 재확인</h3> <input type="password" name="password2">
				</li>
				<li>
					<h3>이름</h3> <input type="text" name="mem_name">
				</li>
				<li>
					<h3>생년월일</h3> <input type="date" name="mem_birth">

				</li>
				<li>
					<h3>성별</h3> <input type="text" name="mem_gender">
				</li>
				<li>
					<h3>전화번호</h3> <input type="text" name="mem_phone" id="phonenum"
					class="phone"> <input type="button" value="인증번호받기"
					onclick="btn_click()" class="phonesend"> <br> <input
					type="text" name="mem_confirmation" class="phonetest" id="phonekey">
					<!-- <input type="button"  value="인증번호 확인하기" onclick="btn_click1()" class="phonecheck"> -->
					<div id="result" class="phonecheck"></div>
				</li>
				<li><input type="submit" class="btn btn-primary form-control"
					value="회원가입" onClick="return checkform();"></li>
				<li><a href="main.jsp">
						<div class="cancel">
							<p>취소</p>

						</div>
				</a></li>
			</ul>
		</div>
	</form>
	<script type="text/javascript">
		function btn_click() {
			const num = $('#phonenum').val();
			$.ajax({
				type : 'post',
				async : false,
				url : 'confirmationAction.jsp',
				data : {
					phonenum : num
				},
				dataType : 'text',
				success : function(data, textStatus) {
					if ($.trim(data) === "good") {
						alert("인증번호를 보냈습니다.");
					} else {
						alert("번호를 입력하세요");
					}
				},
				error : function(data, textStatus) {
					console.lof('error');
					alert("error");
				}

			});
		}
		/* function btn_click1(){
		 const num = $('#phonenum').val();
		 const key = $('#phonekey').val();
		 $.ajax({
		  type:'post',
		  async:false,
		  url:'confirmationCheck.jsp',
		  data:{phonenum:num,phonekey:key},
		  dataType: 'text',
		  success:function(data) {    
		     var str = data;
		     if(str.includes('성공') == true){
		     alert('성공했습니다.');    
		     }else{
		     alert('실패했습니다.');
		     }
		  },
		  error:function (data) {
		          console.log('error');
		          alert("error");
		      }
		 });
		 }
		 */
		$(function() {
			$("#phonekey").keyup(function() {
				const num = $('#phonenum').val();
				const key = $('#phonekey').val();
				$.ajax({
					type : 'post',
					async : false,
					url : 'confirmationCheck.jsp',
					data : {
						phonenum : num,
						phonekey : key
					},
					dataType : 'text',
					success : function(data) {
						var str = data;
						if (str.includes('성공') == true) {
							$(".phonecheck").text("인증번호가 일치합니다.")
							$(".phonecheck").css("color", "green")
						} else {
							$(".phonecheck").text("인증번호가 불일치합니다.")
							$(".phonecheck").css("color", "red")
						}
					},
					error : function(data) {
						console.log('error');
						alert("error");
					}
				});
			});
		});
	</script>
</body>
</html>