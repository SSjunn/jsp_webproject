<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>사진 3D 슬라이더</title>
  <style>
    body {
      padding: 20px;
      background: #eee;
      user-select: none;
    }
    [type=radio] { display: none; }
    #slider {
      height: 35vw;
      position: relative;
      perspective: 1000px;
      transform-style: preserve-3d;
    }
    #slider label {
      margin: auto;
      width: 60%;
      height: 100%;
      border-radius: 4px;
      position: absolute;
      left: 0; right: 0;
      cursor: pointer;
      transition: transform 0.4s ease;
      overflow: hidden;
    }
    #slider label img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .nickname {
      position: absolute;
      top: 10px;
      left: 10px;
      color: white;
      font-weight: bold;
      font-size: 20px;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.7);
      z-index: 10;
    }

    /* 3D 슬라이드 효과 */
    #s1:checked ~ #slide4, #s2:checked ~ #slide5, #s3:checked ~ #slide1,
    #s4:checked ~ #slide2, #s5:checked ~ #slide3 { transform: translate3d(-30%,0,-200px); }
    #s1:checked ~ #slide5, #s2:checked ~ #slide1, #s3:checked ~ #slide2,
    #s4:checked ~ #slide3, #s5:checked ~ #slide4 { transform: translate3d(-15%,0,-100px); }
    #s1:checked ~ #slide1, #s2:checked ~ #slide2, #s3:checked ~ #slide3,
    #s4:checked ~ #slide4, #s5:checked ~ #slide5 { transform: translate3d(0,0,0); }
    #s1:checked ~ #slide2, #s2:checked ~ #slide3, #s3:checked ~ #slide4,
    #s4:checked ~ #slide5, #s5:checked ~ #slide1 { transform: translate3d(15%,0,-100px); }
    #s1:checked ~ #slide3, #s2:checked ~ #slide4, #s3:checked ~ #slide5,
    #s4:checked ~ #slide1, #s5:checked ~ #slide2 { transform: translate3d(30%,0,-200px); }
  </style>
</head>
<body>

  <section id="slider">
    <input type="radio" name="slider" id="s1">
    <input type="radio" name="slider" id="s2">
    <input type="radio" name="slider" id="s3" checked>
    <input type="radio" name="slider" id="s4">
    <input type="radio" name="slider" id="s5">

    <c:forEach var="board" items="${boards}" varStatus="status">
      <c:if test="${status.index < 5}">
        <label for="s${status.index + 1}" id="slide${status.index + 1}">
          <div class="nickname">${board.userNickname}</div>
          <a href="${pageContext.request.contextPath}/JspProject/photo_board?cmd=detail&id=${board.id}">
            <img src="${pageContext.request.contextPath}/uploads/${board.photoImage}" alt="사진">
          </a>
        </label>
      </c:if>
    </c:forEach>
  </section>

</body>
</html>
