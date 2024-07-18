<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Footer-->
<footer style="width: 100%">
	<nav class="navbar navbar-expand-lg footer1">
		<div class="container">
			<ul class="navbar-nav mx-auto" >
				<li class="nav-item mx-5" >
					<a class="nav-link" aria-current="page" href="cs.mall">
						고객센터
					</a>
				</li>
				<li class="nav-item mx-5" >
					<a class="nav-link" data-bs-toggle="modal" data-bs-target="#use">
						이용약관
					</a>
				</li>
				<li class="nav-item mx-5" >
					<a class="nav-link" href="javascript:show('${loginInfo.id}')">
						입점신청
					</a>
				</li>
			</ul>
			
			<!-- 입점신청 Form(enter_insertForm.jsp) 모달창 -->
			<div class="modal fade" id="enterWrite" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="enterModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" id="enter-content"></div>
				</div>
			</div>
		</div>
	</nav> 
	<div class="bg-primary">
		<table class="text-white m-auto">
			<tr>
				<td class="py-3 px-5">
					<p>
					<font class="highlight">대표이사 :</font> 이국환<br>
					<font class="highlight">주소 :</font> 서울특별시 송파구 위례성대로 2 장은빌딩 18층<br>
					<font class="highlight">사업자등록번호 :</font> 120-87-65763 | 
					<font class="highlight">통신판매업신고번호 :</font> 2012-서울송파-0515<br>
					<font class="highlight">팩스 :</font> 050-6050-0400 | 
					<font class="highlight">이메일 :</font> bmmart_op@woowahan.com<br>
					<font class="highlight">호스팅서비스제공자 :</font> (주)우아한형제들<br>
					</p>
				</td>
				<td class="py-3 px-5" rowspan="2">
					<font class="fs-4 fw-bolder">고객센터</font><br>
					<font class="fs-4 fw-bolder">1600-0025</font>
					<font class="fs-5 ms-3">오전 9시 ~ 새벽 1시</font>
					
					<p class="mt-3">
						<a href="https://www.facebook.com/smartbaedal" target="blank">
							<i class="fi fi-brands-facebook bottom_icon"></i>
						</a>
						<a href="https://www.instagram.com/baemin_official/" target="blank">
							<i class="fi fi-brands-instagram bottom_icon"></i>
						</a>
						<a href="https://www.youtube.com/user/smartbaedal2" target="blank">
							<i class="fi fi-brands-youtube bottom_icon"></i>
						</a>
					</p>
				</td>
			</tr>
			<tr>
				<td class="py-3 px-5">
					<p>
					(주)우아한형제들은 통신판매중개자이며, 통신판매의 당사자가 아닙니다.<br>
					따라서 (주)우아한형제들은 상품, 거래정보 및 거래에 대하여 책임을 지지 않습니다.<br>
					단, (주)우아한형제들이 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다.<br><br>
					상호명 : (주)우아한형제들
					</p>
				</td>
			</tr>
		</table>
	</div>
</footer>
<!-- Modal -->
<div class="modal fade" id="use" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">이용약관</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<font class="fw-bold">제1조 (목적)</font>
				<p>
					이 약관은 주식회사 우아한형제들(이하 "회사"라 함)이 운영하는 배민B마트 웹사이트 등의 사이버몰(이하 "몰"이라 함)에서 제공하는 
					인터넷 관련 서비스(이하 "서비스"라 함)를 이용함에 있어 "몰"과 이용자의 권리•의무 및 책임사항은 규정함을 목적으로 합니다.
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- 캐러셀 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="resources/js/scripts.js"></script>

<!-- 입점요청 Form 띄우기 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	function show(id) {
		$('#enter-content').load("enter_write.dc?id=" + id);
		$('#enterWrite').modal('show');
	}
</script>
