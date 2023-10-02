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
        <section class="login-section section">
            <div class="container w-25 h-75">
                <div class="row">
                    <div class="loginInput">
                        <form action='<c:url value="/member/login-action.jsp"/>' method="post">
                            <h1 class="fw-bold">Login Please</h1>
                            <img src="../asset/img/login.png" alt="">
                            <input type="text" class="form-control" name="id" placeholder="아이디">
                            <input type="password" class="form-control" name="passwd" placeholder="비밀번호">
                            <button type="submit" class="btn btn-primary" id="login">로그인</button>
                            <div class="line"></div>
                            <a href="./signin.jsp" class="btn btn-success" id="signIn">회원가입</a>
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