<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/common.jsp" %>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<!-- title icon-->
	<link rel="icon" type="image/x-icon" href="resources/img/B.png" />
	<title>배민 B마트</title>
	
	<!-- icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-thin-rounded/css/uicons-thin-rounded.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-solid-rounded/css/uicons-solid-rounded.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-brands/css/uicons-brands.css'>
	
	<!-- Core theme CSS (includes Bootstrap)-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
	<link href="resources/css/mall.css" rel="stylesheet" />
	
	<!-- fonts -->
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- 추가 css -->
	<link href="resources/css/mall_plus.css" rel="stylesheet" type="text/css">
</head> 

<!-- 도로명 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>



<!-- Navigation-->
<div class="continer mx-auto w-75">
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<img src="resources/img/Bmart_logo.png" alt="B마트_logo" style="width:200; height: 60">&nbsp;&nbsp;
			<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="plists.mall">
		        <div class="input-group">
				    <input type="text" class="form-control bg-light border-0 px-3" placeholder="상품을 검색하세요(●'◡'●)"
				        aria-label="Search" aria-describedby="basic-addon2" name="keyword" style="width: 250">
				    <div class="input-group-append">
				        <button class="btn btn-primary" type="submit">
				            <i class="fi fi-rr-search search"></i>
				        </button>
				    </div>
				</div>
	       	</form>
		</div>
		<div class="container w-75">
			<div class="collapse navbar-collapse ms-lg-5" id="navbarSupportedContent">
				<ul class="navbar-nav mb-2 mb-lg-0 ms-lg-5 ps-lg-5">
					<li class="nav-item ms-lg-5 mx-1">
						<!-- home icon -->
						<a class="nav-link active" aria-current="page" href="mypage.mb?index=orderList">
							<i class="fi fi-rr-home icon"></i>
						</a>
					</li>
					<li class="nav-item mx-1">
						<!-- heart icon -->
						<a class="nav-link active" aria-current="page" href="interest.mall">
							<i class="fi fi-rr-heart icon"></i>
						</a>
					</li>
					<li class="nav-item mx-1">
						<!-- cart icon -->
						<a class="nav-link active position-relative" aria-current="page" href="cart.mall">
							<i class="fi fi-rr-shopping-basket icon"></i>
							<!-- Counter - Messages -->
							<c:if test="${loginInfo ne null}">
	                        	<span class="position-absolute top-1 start-100 translate-middle badge rounded-pill btn-danger">${cartTotalCount}</span>
	                        </c:if>
						</a>
					</li>
					<c:if test="${loginInfo ne null}">
						<li class="nav-item">
							<!-- heart icon -->
							<a class="nav-link active" aria-current="page" href="mypage.mb?index=orderList">
								<i class="fi fi-rr-user icon"></i>
								<font class="fs-6 text-primary fw-bolder">${loginInfo.id} 님😊</font>
							</a>
						</li>
					</c:if>
					<c:if test="${loginInfo eq null}">
						<li class="nav-item dropdown mx-1">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fi fi-rr-user icon"></i>
							</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="login.mb">
										<i class="fi fi-rr-users fst-normal"> 로그인 </i>
									</a>
								</li>
								<li><hr class="dropdown-divider" /></li>
								<li>
									<a class="dropdown-item" href="register.mb">
										<i class="fi fi-rr-user-add fst-normal"> 회원가입 </i>
									</a>
								</li>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</div>
<!-- category -->
<nav class="navbar navbar-expand-lg" style="border-bottom: 1px solid #D3D3D3; box-shadow: 0px 3px 5px -2px gray">
	<div class="container">
		<ul class="navbar-nav" >
			<li class="nav-item dropdown me-5">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<font size="3" style="font-style: normal;">카테고리</font>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:forEach var="clists" items="${categoryLists}">
						<li>
							<a class="dropdown-item" href="plists.mall?category=${clists.name}">
								${clists.name}
							</a>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li class="nav-item mx-5" >
				<a class="nav-link" aria-current="page" href="plists.mall">
					<img src="resources/img/new.png" style="width: 25">
					신상품
				</a>
			</li>
			<li class="nav-item mx-5" >
				<a class="nav-link" aria-current="page" href="bestLists.mall">
					<img src="resources/img/hot.png" style="width: 25">
					베스트 상품
				</a>
			</li>
		</ul>
	</div>
</nav>

<!-- TOP button	 -->
<a href="#" class="float">
	<i class="fi fi-rr-arrow-small-up my-float"></i>
</a>