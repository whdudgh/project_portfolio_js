<%@page import="java.util.List"%>
<%@page import="ezen.porfolio.article.dto.Memo"%>
<%@page import="ezen.porfolio.common.dao.DaoFactory"%>
<%@page import="ezen.porfolio.article.dao.MemoDao"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
MemoDao memoDao = DaoFactory.getInstance().getMemoDao();
List<Memo> list = memoDao.findByAll();
request.setAttribute("list", list);
%>

<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<title>Simply Amazed HTML Template by Tooplate</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- CSS 파일 포함. --%>
<jsp:include page="/modules/styles.jsp" />
<!--메인css-->
<link rel="stylesheet" href="asset/css/tooplate-simply-amazed.css"
	type="text/css" />
</head>

<body>
	<!--head와 nav바 영역 시작-->
	<div id="outer">
		<header class="header order-last" id="tm-header">
			<nav class="navbar">
				<div class="collapse navbar-collapse single-page-nav">
					<ul class="navbar-nav">
						<h1 class="fs-1 mb-5 w-auto w-25" id="nav-logo">
							YoungHo's <br>portfolio
						</h1>
						<li class="nav-item"><a class="nav-link" href="#section-1">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#section-2">About
								Me</a></li>
						<li class="nav-item"><a class="nav-link"
							href="#gallery-section">Projects</a></li>
						<li class="nav-item"><a class="nav-link"
							href="#comment-section">Community</a></li>
						<!-- <div style="border: 1px solid #fff; width: 220px; height: 230px; margin: 20px 0 0 20px;">
                            <a class="btn btn-outline-light" href="./login.html" style="width: 25%;
                            display: flex;
                            margin: 0 auto;
                            margin-top: 40%;">Login</a>
                        </div> -->
						<li><c:choose>
								<c:when test="${empty loginMember}">
									<a class="btn btn-outline-light"
										href="<c:url value="/member/login.jsp"/>"
										style="margin-left: 60px;">Login</a>
								</c:when>
								<c:otherwise>
									<span
										style="margin-left: 60px; color: #fff; font-size: initial;">${loginMember.id}(${loginMember.name})님</span>
									<span
										style="margin-left: 60px; color: #fff; font-size: initial;">환영합니다....</span>
									<a class="btn btn-outline-light"
										href="<c:url value="/member/logout-action.jsp"/>"
										style="margin-left: 60px;">Logout</a>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</div>
			</nav>
		</header>
	</div>
	<!--head와 nav바 영역 끝-->

	<!--main의 시작-->
	<main id="content-box" class="order-first">
		<!--홈page section 시작-->
		<section class="banner-section section parallax-window"
			data-parallax="scroll" id="section-1"
			style="background-image: url('asset/img/create-g69462951b_1920.jpg'); background-size: 100% 100%;">
		</section>
		<!--홈page section 끝-->

		<!--소개page section 시작-->
		<section class="work-section section" id="section-2">
			<div class="container">
				<!--타이틀-->
				<div class="row">
					<div class="title">
						<h2>About Me</h2>
					</div>
				</div>
				<!--인적사항-->
				<div class="row row1">
					<div class="col-md-4">
						<div>
							<img src="asset/img/죠하 copy.jpg" alt="">
						</div>
					</div>
					<div class="col-md-8">
						<h2>인적사항</h2>
						<pre>
이       름: 조 영 호 
전 화 번 호: 010 - 4373 - 1334
이   메  일: dudgh114 @ gmail.com
                        </pre>
						<h2>학력 / 교육력</h2>
						<p>
							경복대학교 복지행정과 졸업<br> [스마트웹&콘텐츠개발]풀스택 자바웹개발자_혼합E 수료 예정
						</p>
					</div>
				</div>
				<!--나의 스킬-->
				<div class="row row2">
					<h4 class="col-md-12">Skill</h4>
				</div>
				<div class="row row3">
					<div class="col-md-2">
						<img src="asset/img/project/개발툴로고/java-plain.png" id="icon"></img>
						<p>java</p>
					</div>
					<div class="col-md-2">
						<img src="asset/img/project/개발툴로고/javascript-plain.png" id="icon"></img>
						<p>javaScript</p>
					</div>
					<div class="col-md-2">
						<img src="asset/img/project/개발툴로고/oracle-original.png" id="icon"></img>
						<p>SQL/PLSQL</p>
					</div>
				</div>
			</div>
		</section>
		<!--소개page section 끝-->

		<!--항목page section 시작-->
		<section class="gallery-section section parallax-window"
			data-parallax="scroll" id="gallery-section">
			<div class="container">
				<div class="title text-right">
					<h2>Project</h2>
				</div>
				<div class="mx-auto gallery-slider">
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/console.png" alt="Image">
						<figcaption>
							<div>
								<p>
									Project AMS<br> (Console)
								</p>
							</div>
							<a href="#carouselExampleDark">View more</a>
						</figcaption>
					</figure>
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/GUI.png" alt="Image">
						<figcaption>
							<div>
								<p>
									Project AMS<br> (GUI)
								</p>
							</div>
							<a href="#amsGui">View more</a>
						</figcaption>
					</figure>
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/File.png" alt="Image">
						<figcaption>
							<div>
								<p>
									Project AMS<br> (FIle Sys)
								</p>
							</div>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/database.png" alt="Image">
						<figcaption>
							<div>
								<p>
									Project AMS<br> (DB Sys)
								</p>
							</div>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/chat.png" alt="Image">
						<figcaption>
							<div>
								<p>Multi-Chat</p>
							</div>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/chat.png" alt="Image">
						<figcaption>
							<div>
								<p>Multi-Chat</p>
							</div>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/chat.png" alt="Image">
						<figcaption>
							<div>
								<p>Multi-Chat</p>
							</div>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<figure class="effect-julia item">
						<img src="asset/img/project_logo/chat.png" alt="Image">
						<figcaption>
							<div>
								<p>Multi-Chat</p>
							</div>
							<a href="#">View more</a>
						</figcaption>
					</figure>
				</div>
			</div>
		</section>
		<!--항목page section 끝-->

		<!--프로젝트 섹션 시작-->


		<!--슬라이드 시작-->
		<div id="carouselExampleDark" class="carousel carousel-dark slide">
			<!--슬라이드 버튼(새로운 섹션마다 추가)-->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="4" aria-label="Slide 5"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="5" aria-label="Slide 6"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="6" aria-label="Slide 7"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="7" aria-label="Slide 8"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="8" aria-label="Slide 9"></button>
			</div>
			<!--슬라이드 안의 내용-->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<!--첫번째 섹션-->
					<section class="title-section section" id="project_ams">
						<div class="container">
							<div class="row">
								<div class="col-md-12 project_title">
									<h1>AMS</h1>
									<p>Console출력</p>
								</div>
							</div>
							<!-- <div class="row">
                                <div class="col-md-12 project_title">
                                    <h1>AMS</h1>
                                    <p>ConSole출력</p>
                                </div>
                            </div> -->
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--두번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Console</h2>
									<img src="asset/img/project/AMS1/콘솔/Main실행.png" alt=""
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Main</h2>
									<img src="asset/img/project/AMS1/코드/main코드.png" alt=""
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-3 shadow p-3 mb-5 bg-body-tertiary rounded offset-1 collum">
									<h2 class="fw-bold">Function</h2>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;계좌
										생성 및 등록
									</p>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;계좌목록
										조회
									</p>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;입금(상환)
									</p>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;출금(상환)
									</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--세번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Console</h2>
									<img src="asset/img/project/AMS1/콘솔/계좌선택후생성.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">selectAccountType() 수정전</h2>
									<img src="asset/img/project/AMS1/코드/계좌선택메서드.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-3 shadow p-3 mb-5 bg-body-tertiary rounded offset-1 collum">
									<h2 class="fw-bold">Comment</h2>
									<p>
										계좌 생성시 <span>계좌 타입마다 메소드를 따로 만들어 관리</span> 하였음.
									</p>
									<p>
										<span>selectAccountType()</span>에서 각 메소드를 실행했으나 중복 코드가 많아 메소드를
										한개로 합쳐 <span>boolean값으로 타입을 선택하게 함.</span>
									</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--네번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-3 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">createAccount()</h2>
									<img src="asset/img/project/AMS1/코드/일반계좌.png"
										class="img-fluid img-thumbnail" style="height: 40%;">
									<h2 class="fw-bold">createMinusAccount()</h2>
									<img src="asset/img/project/AMS1/코드/마이너스계좌.png"
										class="img-fluid img-thumbnail" style="height: 40%;">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">createAccount(boolean)</h2>
									<img src="asset/img/project/AMS1/코드/개선후계좌생성.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">selectAccountType() 수정후</h2>
									<img src="asset/img/project/AMS1/코드/계좌선택메서드개선판.png"
										class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--다섯번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Console</h2>
									<img src="asset/img/project/AMS1/콘솔/목록보기.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">showAccounts() 수정전</h2>
									<img src="asset/img/project/AMS1/코드/계좌보기.png"
										class="img-fluid img-thumbnail" style="height: 40%;">
									<h2 class="fw-bold">showAccounts() 수정후</h2>
									<img src="asset/img/project/AMS1/코드/계좌보기개선판.png"
										class="img-fluid img-thumbnail" style="height: 40%;">
								</div>
								<div
									class="col-md-3 shadow p-3 mb-5 bg-body-tertiary rounded offset-1 collum">
									<h2 class="fw-bold">Comment</h2>
									<p style="margin-bottom: 200px;">Account의 배열을 이용하여 계좌를 불러와
										instanceof연산자를 이용하여 일반계좌, 마이너스계좌 구분하여 목록에 출력 하였음.</p>
									<p>List콜렉션에 Account객체만을 넣고 향상된 for문으로 목록에 출력 하는 것으로 코드를 수정
										하였음.</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--여섯번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Console</h2>
									<img src="asset/img/project/AMS1/콘솔/입금상환2.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-7 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">depomoney()</h2>
									<img src="asset/img/project/AMS1/코드/입금코드.png"
										class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--일곱번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-7 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">depomoney() 트러블</h2>
									<img src="asset/img/project/AMS1/코드/트러블1.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="case col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded collum">
									<h4 class="fw-bold">CASE 1</h4>
									<p class="p2">반환타입이 Account인 메서드 결과를 MinusAccount의 참조변수에
										담으려 했으나 convert오류가 발생.</p>
									<p class="p2">반환된 결과를 MinusAccount타입으로 강제 형변환 시킴.</p>
									<h4 class="fw-bold">CASE 2</h4>
									<p class="p2">(입금금액+getRestMoney)를 totalMoney변수에 담고 출력. 입금
										시 잔액표시가 출력되지만, 목록조회 시 입금이 안됨.</p>
									<p class="p2">deposit() 메서드를 활용하여 restMoney를 초기화 해주고
										getRestMoney로 잔액 출력함.</p>
									<br> <img src="asset/img/project/AMS1/코드/데포짓메소드.png"
										class="img-fluid img-thumbnail h-25">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--여덜번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Console</h2>
									<img src="asset/img/project/AMS1/콘솔/출금대출 (2).png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">withdrawMoney()</h2>
									<img src="asset/img/project/AMS1/코드/출금(대출).png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-3 shadow p-3 mb-5 bg-body-tertiary rounded offset-1 collum">
									<h2 class="fw-bold">Comment</h2>
									<p>초기 구상 시 예외 없이 입력을 받았음.</p>
									<p>예외처리(try, catch)를 배우고,</p>
									<p>출금(대출) 금액이 0이거나 음수이거나 잔액보다 많이 출금 하면 에러메세지 출력하게끔 수정 함.</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--아홉번째 섹션-->
					<section class="feeling-section section" id="project_ams">
						<div class="container">
							<div class="row">
								<div class="col-md-7 offset-5 project_title">
									<h1>AMS(console) 느낀점</h1>
									<p class="fs-3">
										<span>처</span>음 수업을 시작하고 과제로 내주신 프로젝트 입니다. 혼자서 어렵기도 했지만 날마다
										5~6시간씩 고민하여 코드가 완성 되었을 때는 정말 기분이 좋았습니다. <br>
										<br> 새로운 문법을 배울 때 마다 코드가 간결해지며 깔끔해질 수 있는것을 몸소 배울 수 있는 기회
										였고 객체지향에 대해 복습할 수 있었습니다.
									</p>
									<a href="#gallery-section" class="btn btn-outline-light">To_Projects</a>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>

			<!--화면 양옆에 이전, 다음 버튼추가-->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="prev"
				data-bs-interval="false">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="next"
				data-bs-interval="false">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">다음</span>
			</button>
		</div>
		<!--AMS 콘솔 프로젝트 끝------------------------------------------------------------------------------->

		<!--AMS GUI프로젝트 시작------------------------------------------------------------------------------->
		<div id="amsGui" class="carousel carousel-dark slide">
			<!--슬라이드 버튼(새로운 섹션마다 추가)-->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="0"
					class="active" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="1"
					aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="2"
					aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="3"
					aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="4"
					aria-label="Slide 5"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="5"
					aria-label="Slide 6"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="6"
					aria-label="Slide 7"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="7"
					aria-label="Slide 8"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="8"
					aria-label="Slide 9"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="9"
					aria-label="Slide 10"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="10"
					aria-label="Slide 11"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="11"
					aria-label="Slide 12"></button>
				<button type="button" data-bs-target="#amsGui" data-bs-slide-to="12"
					aria-label="Slide 13"></button>
			</div>
			<!--슬라이드 안의 내용-->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<!--첫번째 섹션-->
					<section class="title-section section" id="project_ams">
						<div class="container">
							<div class="row">
								<div class="col-md-12 project_title">
									<h1>AMS</h1>
									<p>GUI 출력</p>
								</div>
							</div>
							<!-- <div class="row">
                                <div class="col-md-12 project_title">
                                    <h1>AMS</h1>
                                    <p>ConSole출력</p>
                                </div>
                            </div> -->
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--두번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Console</h2>
									<img src="asset/img/project/AMS2/gui/GUI.png" alt=""
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Main</h2>
									<img src="asset/img/project/AMS2/code/메인.png" alt=""
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-3 shadow p-3 mb-5 bg-body-tertiary rounded offset-1 collum">
									<h2 class="fw-bold">Function</h2>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;전체계좌
										조회
									</p>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;계좌번호
										조회
									</p>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;예금주
										조회
									</p>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;계좌등록
									</p>
									<p>
										<i class="fa-solid fa-diamond" style="color: #006699;"></i>&nbsp;&nbsp;계좌삭제
									</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--세번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">GUI Making1</h2>
									<img src="asset/img/project/AMS2/code/gui1.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-3 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">GUI Making2</h2>
									<img src="asset/img/project/AMS2/code/gui2.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">GUI Making3</h2>
									<img src="asset/img/project/AMS2/code/gui3.png"
										class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--네번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-6 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">EventListner()</h2>
									<img src="asset/img/project/AMS2/code/이벤트처리1.PNG"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-5 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">component 배치</h2>
									<img src="asset/img/project/AMS2/code/이벤트처리2.PNG"
										style="height: 50%;" class="img-fluid img-thumbnail"> <img
										src="asset/img/project/AMS2/code/이벤트처리3.PNG"
										style="height: 40%;" class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--다섯번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-6 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">TF유효성검사</h2>
									<img src="asset/img/project/AMS2/code/예금주.PNG"
										style="height: 30%;" class="img-fluid img-thumbnail"> <img
										src="asset/img/project/AMS2/code/계좌번호.PNG"
										style="height: 30%;" class="img-fluid img-thumbnail"> <img
										src="asset/img/project/AMS2/code/패스워드.PNG"
										style="height: 30%;" class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-5 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">Varidate클래스</h2>
									<img src="asset/img/project/AMS2/code/바리클래스.PNG"
										class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--여섯번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">GUI</h2>
									<img src="asset/img/project/AMS2/gui/tftrans.png" alt=""
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">TF변화메소드</h2>
									<img src="asset/img/project/AMS2/code/텍스트필드메소드.PNG" alt=""
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-3 shadow p-3 mb-5 bg-body-tertiary rounded offset-1 collum">
									<h2 class="fw-bold">Comment</h2>
									<p>선택된 항목에 따른 택스트 필드의 able, disable구현</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--일곱번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">계좌번호 조회</h2>
									<img src="asset/img/project/AMS2/gui/계좌번호조회.PNG"
										style="height: 45%;" class="img-fluid img-thumbnail">
									<h2 class="fw-bold">예금주 조회</h2>
									<img src="asset/img/project/AMS2/gui/예금주검색.PNG"
										style="height: 45%;" class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">searchAcc()</h2>
									<img src="asset/img/project/AMS2/code/계좌번호예금주조회.PNG" alt=""
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-3 shadow p-3 mb-5 bg-body-tertiary rounded offset-1 collum">
									<h2 class="fw-bold">Comment</h2>
									<p>boolean 값으로 계좌번호검색인지 예금주명검색인지 나뉘도록 코드를 작성함. repository에
										있는 search메소드들은 AMS콘솔때와 코드가 같음.</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--여덜번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-7 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">searchAcc() 트러블</h2>
									<img src="asset/img/project/AMS2/code/트러블1.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="case col-md-4 shadow p-3 mb-5 bg-body-tertiary rounded collum">
									<h4 class="fw-bold">CASE 1</h4>
									<p class="p2">
										예금주명으로 찾는 메서드의 경우 리턴타입이 List
										<Account> 이다. 그대로 .toSrting 시 Account의 .toString이
										호출되지 않아 출력시 원하는 포멧으로 나오지 않음. 
									</p>
									<p class="p2">List를 배열타입으로 바꾸는 .toArray로 바꾼뒤, .toString을 호출
										하니 원하는 포멧으로 출력 됨.</p>
									<h4 class="fw-bold">repository의 interface</h4>
									<img src="asset/img/project/AMS2/code/여러방법을 위한인터페이스.PNG"
										class="img-fluid img-thumbnail h-50">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--아홉번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-6 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">GUI</h2>
									<img src="asset/img/project/AMS2/gui/계좌등록.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-5 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">addAccount()</h2>
									<img src="asset/img/project/AMS2/code/계좌등록.PNG"
										class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--열번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-6 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">addAccount() 트러블</h2>
									<img src="asset/img/project/AMS2/code/트러블2.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-5 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">case1</h2>
									<p class="p2">비밀번호를 int형으로 받아서 validator클래스로 유효성 검사 못함.</p>
									<p class="p2">유효성 검사를 위해 String 타입으로 passTF의 값을 한번 더 받아서 검사
										진행하고 TF가 모두 유효할 경우 int형으로 다시 받음.</p>
									<img src="asset/img/project/AMS2/code/바리클래스.PNG"
										style="height: 65%;" class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--열한번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-6 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">GUI</h2>
									<img src="asset/img/project/AMS2/gui/삭제후f.png"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-5 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">deleteAccount()</h2>
									<img src="asset/img/project/AMS2/code/삭제.PNG"
										class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--열두번째 섹션-->
					<section class="ams-section section" id="project_section">
						<div class="container project_container">
							<div class="row row1">
								<div
									class="col-md-6 offset-1 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">GUI</h2>
									<img src="asset/img/project/AMS2/gui/종료버튼반응.PNG"
										class="img-fluid img-thumbnail">
								</div>
								<div
									class="col-md-5 shadow p-3 mb-5 bg-body-tertiary rounded image-container collum">
									<h2 class="fw-bold">exit()</h2>
									<img src="asset/img/project/AMS2/code/종료메서드.PNG"
										class="img-fluid img-thumbnail">
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="carousel-item">
					<!--열세번째 섹션-->
					<section class="feeling-section section" id="project_ams">
						<div class="container">
							<div class="row">
								<div class="col-md-7 offset-5 project_title">
									<h1>AMS(GUI) 느낀점</h1>
									<p class="fs-3">
										<span>A</span>WT 수업을 배우고 과제로 내주신 개인 프로젝트 입니다. GridBagLayout을
										이용한 배치가 처음엔 이해 안됬지만, Excel도 열어보고 직접 셀디자인을 하며 배치에 신경을 많이 썼습니다.
										물론, 각 버튼에 알맞은 코드를 제작 하는것도 어려웠습니다. <br>
										<br> 특히 이벤트처리에 대한 연습이 될 수 있어서 좋은 경험 이었습니다.
									</p>
									<a href="#gallery-section" class="btn btn-outline-light">To_Projects</a>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>

			<!--화면 양옆에 이전, 다음 버튼추가-->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#amsGui" data-bs-slide="prev"
				data-bs-interval="false">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#amsGui" data-bs-slide="next"
				data-bs-interval="false">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">다음</span>
			</button>
		</div>
		<!--=======================================댓글섹션 시작==========================================-->
		<section class="comment-section section" id="comment-section">
			<div class="container"
				style="max-width: 90%; max-height: 90%; border-radius: 50px;">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-8 z-2">
						<div class="position-relative">
							<h2 class="mt-5">게시글</h2>
							<p class="mb-3 w-lg-75">자유롭게 글을 남겨 주세요.</p>
							<div class="width-50x pt-1 mb-2"
								style="background-color: #006699;"></div>

							<form action="./article-action.jsp" method="post" role="form"
								class="needs-validation mb-5 mb-lg-7" novalidate>
								<div class="row">
									<div class="mb-3 text-end" style="background-color: #6699cc">
										<label class="form-label">2023-05-05</label>
										<textarea class="form-control" name="content"
											<c:if test="${empty loginMember}">placeholder="로그인 하여야 게시글을 입력할 수 있습니다...."</c:if>
											required <c:if test="${empty loginMember}">disabled</c:if>></textarea>
									</div>

									<div
										class="d-md-flex justify-content-end align-items-center mb-0">
										<input type="submit" value="글 남기기" id="sendBtn"
											class="btn btn-success btn-sm">
									</div>
							</form>

							<div class="px-4  py-3 position-relative" data-aos="fade-up">
								<ul class="list-group w-100">
									
									<c:forEach items="${list}" var="memo">
										<li class="list-group-item">
										<div class="mb-3 text-end">
											<label class="fs-6">${memo.id} | ${memo.write_date}</label>
											<p class="form-control text-start bg-gray-200 pb-5" disabled> ${memo.content }</p>
										</div>
									</li>
									</c:forEach>
									
								</ul>

								<!-- pagination-->
								<nav class="mt-3">
									<ul class="pagination justify-content-center">
										<li class="page-item disabled"><a class="page-link"
											href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item active"><a class="page-link"
											href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>

							</div>

						</div>


					</div>
				</div>
			</div>
		</section>

	</main>

	<!-- <script src="js/bootstrap.bundle.min.js"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>