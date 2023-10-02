// 유효성 검사 함수

//비밀번호 일치

function pwch2(pw) {
  let pass = document.querySelector("#pw");
  let str = pw.nextSibling;

  if (pass.value != pw.value) {
    str.style.display = "block";
  } else {
    str.style.display = "none";
  }
}

// 생년월일 유효성 검사

function birthch(birth) {
  let birthPattern = /^(19[0-9][0-9]|20\d{2})(0[0-9]|0[0-9])(0[1-9]|[1-2][0-9]|3[0-1])$/;
  let birPa = birth.nextSibling;

  if (!birth.value) { // 생년월일 입력란이 비어있을 때
    birPa.style.display = "none"; // 경고 메시지를 숨김
  } else if (!birthPattern.test(birth.value)) { // 유효성 검사
    birPa.style.display = "block"; // 경고 메시지를 보여줌
  } else {
    birPa.style.display = "none"; // 유효하면 경고 메시지를 숨김
  }
}

// 비밀번호 유효성 검사

function pwch1(pw) {
  let pwPattern = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
  let pwPa = pw.nextSibling;

  if (!pw.value) { // 생년월일 입력란이 비어있을 때
    pwPa.style.display = "none"; // 경고 메시지를 숨김
  } else if (!pwPattern.test(pw.value)) { // 유효성 검사
    pwPa.style.display = "block"; // 경고 메시지를 보여줌
  } else {
    pwPa.style.display = "none"; // 유효하면 경고 메시지를 숨김
  }
}

// 핸드폰 유효성 검사

function phonech(phone) {
  let phonePattern = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
  let phonePa = phone.nextSibling;

  if (!phone.value) { // 핸드폰 입력란이 비어있을 때
    phonePa.style.display = "none"; // 경고 메시지를 숨김
  } else if (!phonePattern.test(phone.value)) { // 유효성 검사
    phonePa.style.display = "block"; // 경고 메시지를 보여줌
  } else {
    phonePa.style.display = "none"; // 유효하면 경고 메시지를 숨김
  }
}

function em(ems) { //이메일 셀렉트
  let email = ems.previousSibling.previousSibling;
  email.value = ems.value;
}

// 가입버튼 제약 함수

function submit() {

  let uname = document.querySelector("#name") //이름 입력
  let uem = document.querySelector("#email") //이메일 입력
  let uemm = document.querySelector("#emaill") //이메일 입력
  let upw = document.querySelector("#pw") //비밀번호 입력
  let pwPattern = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
  let pwErrorMsg = document.querySelector("#pw") // 비밀번호 양식 오류
  let unn = document.querySelector("#checkpw") //비밀번호 확인 입력
  let ubir = document.querySelector("#birth") //생일 입력
  let birthPattern = /^(19[0-9][0-9]|20\d{2})(0[0-9]|0[0-9])(0[1-9]|[1-2][0-9]|3[0-1])$/; //생일패턴 유효성
  let birthErrorMsg = document.querySelector("#birth") // 생일 양식 오류
  let uph = document.querySelector("#phone") //올바른 핸드폰번호 입력
  let phonePattern = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/; //핸드폰패턴 유효성
  let phoneErrorMsg = document.querySelector("#phonecheck"); // 핸드폰 양식 오류
  let checkBox = document.getElementById("checkBox"); //체크박스 입력

  if (uname.value == "") {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '이름을 입력하세요',
    })
    uid.focus();
  } else if (uem.value == "") {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '이메일 아이디를 입력하세요',
    })
    uem.focus();
  } else if (uemm.value == "") {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '이메일 주소를 입력하세요',
    })
    uemm.focus();
  } else if (upw.value == "") {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '비밀번호를 입력하세요',
    })
    upw.focus();
  } else if (unn.value == "") {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '비밀번호를 한번 더 입력하세요',
    })
    unn.focus();
  } else if (upw.value != unn.value) {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '비밀번호가 동일하지 않습니다',
    })
    upw.focus();
  } else if (!birthPattern.test(ubir.value)) {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '생일을 올바르게 입력해주세요(예.20020115)',
    })
    phoneErrorMsg.focus();
  } else if (!pwPattern.test(upw.value)) {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '비밀번호를 영문, 숫자 혼합하여 6~20자리 이내로 해주세요',
    })
    pwErrorMsg.focus();
  } else if (ubir.value == "") {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '생년월일을 입력해주세요',
    })
    ubir.focus();
  } else if (!phonePattern.test(uph.value)) {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '핸드폰번호를 올바르게 입력해주세요(예. 01012341234)',
    })
    phoneErrorMsg.focus();
  } else if (uph.value == "") {
    Swal.fire({
      icon: 'error',
      title: '다시 입력해주세요',
      text: '핸드폰번호 입력해주세요',
    })
    uph.focus();
  } else if (!checkBox.checked) {
    Swal.fire({      
      icon: 'error',
      title: '다시 입력해주세요',
      text: '개인정보 수집 및 이용 동의에 체크해주세요',
    })
    checkBox.focus();
  } else {
    Swal.fire({
      icon: 'success',
      title: '가입을 축하드립니다',
      text: '회원가입 완료',
    })
    // alert("회원가입 완료");
    location.href = "login.html"
  }
}

//돌아가기 버튼 함수

function back() {
  location.href = "login.html"
}
