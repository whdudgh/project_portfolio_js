<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <title>Simply Amazed HTML Template by Tooplate</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/modules/styles.jsp"/>
    <!--메인css-->
    <link rel="stylesheet" href="../asset/css/login.css" type="text/css" />
</head>

<body>
    <!--headet와 nav바 영역 시작-->
    <!--headet와 nav바 영역 끝-->

    <!--main의 시작-->
    <main id="content-box" class="order-first">
        <!--홈page section 시작-->
        <!--첫번째 섹션-->
        <section class="signIn-section section">
            <div class="container w-25 h-75">
                <div class="row">
                    <div class="signIn-Input">
                        <form action="/member/signin-action.jsp">
                            <h1 class="fw-bold">Sign In</h1>
                            <input type="text" class="form-control mb-0" name="id" placeholder="아이디" id="uid">
                            <button type="submit" class="btn btn-primary mb-1">중복확인</button>
                            <input type="text" class="form-control mt-3" name="passwd" placeholder="비밀번호">
                            <input type="text" class="form-control mb-0" name="email" placeholder="이메일 Ex&#41;hoho@gmail.com" id="upw">
                            <div class="line"></div>
                            <input type="text" class="form-control" name="name" placeholder="이름">
                            <input type="text" class="form-control" name="phone" placeholder="전화번호">
                            <input type="text" class="form-control" name="birth" placeholder="생년월일 6자리 Ex&#41;850613">
                            <div class="form-check form-check-inline" style="margin-right: 30%; margin-left: 5%;">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="남자">
                                <label class="form-check-label" for="male">남자</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="여자">
                                <label class="form-check-label" for="female">여자</label>
                            </div>
                            <div class="line"></div>
                            <button type="submit" class="btn btn-success" id="signIn">가입하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- <script src="js/bootstrap.bundle.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>