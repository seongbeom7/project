<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>UI test</title>
    <link rel="stylesheet" href="css/main.css">
  </head>
  <body>
	<!-- header 부분 -->
	<jsp:include page="header.jsp"/>

	<!-- 내용 부분 -->
    <div class="section">
      <div class="article1">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02">
        <input type="radio" name="slide" id="slide03">

        <div class="slidewrap">
          <ul class="slidelist">
            <li>
              <a>
                <label for="slide03" class="left"></label>
                <img src="img/slide01.PNG">
                <label for="slide02" class="right"></label>
              </a>
            </li>
            <li>
              <a>
                <label for="slide01" class="left"></label>
                <img src="img/slide02.PNG">
                <label for="slide03" class="right"></label>
              </a>
            </li>
            <li>
              <a>
                <label for="slide02" class="left"></label>
                <img src="img/slide03.PNG">
                <label for="slide01" class="right"></label>
              </a>
            </li>
          </ul>
        </div>
      </div>

      <div class="article2">
        <ul class="suggest">
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
        </ul>
      </div>

      <br>
      <br>
      <br>
      <br>

      <div class="article3">
        <h3>Best</h3>
        <ul class="best">

          <div class="fir">
          <li class="first">
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          </div>

          <div class="sec">
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          <li>
            <a href="#">
              <span></span>
              <img src="img/상품.PNG" alt="">
              <h4>상품이름</h4>
              <p>상품내용상품내용상품내용상품내용</p>
            </a>
          </li>
          </div>

        </ul>
      </div>
    </div>

    <aside>

    </aside>


    <div class="blank">
    </div>

    <!-- footer 부분 -->
	<jsp:include page="footer.jsp"/>

  </body>
</html>
