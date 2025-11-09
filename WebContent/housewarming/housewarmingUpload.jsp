<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>집들이 게시글 업로드</title>

    <!-- 외부 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 사용자 정의 스타일 -->
    <style>
        .img_box {
            width: 300px;
            height: 300px;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            border: 1px solid #ccc;
            margin-top: 10px;
        }

        .img_box img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        textarea {
            resize: none;
        }

        h2 {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>

    <a href="/JspProject/index.jsp">
        <img src="../images/loginlogo.png" alt="로고">
    </a>
    <h2>물품 게시글 업로드</h2>

    <form action="/JspProject/housewarming?cmd=upload" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userId" value="${sessionScope.principal.id}" />

        <div class="container mt-4">
            <div class="row">

                <!-- 왼쪽: 사진 업로드 -->
                <div class="col-md-6 d-flex justify-content-center align-items-start">
                    <div>
                        <input type="file" id="file" name="photo" onchange="changeValue(this)" hidden />
                        <button type="button" id="btn-upload" class="btn btn-light">
                            <svg id="btn_svg" class="icon" width="48" height="48" viewBox="0 0 48 48" fill="currentColor">
                                <path d="M11.952 9.778l2.397-5.994A1.778..."></path>
                            </svg>
                            <div id="div_text">사진 올리기</div>
                            <div class="img_box mt-2">
                                <img id="blah" />
                            </div>
                        </button>
                    </div>
                </div>

                <!-- 오른쪽: 제목 입력 + 설명 입력 -->
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" required />
                    </div>

                    <div class="form-group">
                        <textarea name="content" class="form-control" rows="6" placeholder="사진에 대해서 설명해주세요."></textarea>
                    </div>

                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">올리기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- 스크립트: 이미지 미리보기 & 업로드 트리거 -->
    <script>
        $(function () {
            $('#btn-upload').click(function (e) {
                e.preventDefault();
                $('#file').click();
            });
        });

        $(document).ready(function () {
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#blah").attr('src', e.target.result);
                        $("#div_text").remove();
                        $("#btn_svg").remove();
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $("#file").change(function () {
                readURL(this);
            });
        });
    </script>

</body>
</html>
