<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<div class="container my-5 p-4" style="background: rgba(110, 175, 176, 0.3); border-radius: 0.375rem">
	<div class="row">
		<div class="col-sm-5">
			<div class="card" style="border: 0px">
				<div class="card-body" style="border-bottom: 8px solid rgba(110, 175, 176, 0.3)">
					<h4 class="card-title fw-bolder pb-2">
						<font class="text-primary">반가워요!</font> ${loginInfo.name}님
						<a class="fw-normal ms-3 px-2 py-1" style="font-size: 16; background: #F5F5F5" href="logout.mb">로그아웃</a>
					</h4>
				</div>
				<div class="card-body">
					<nav class="nav flex-column">
						<font class="my-2 fw-bold" color="#186E6A">자주찾는메뉴</font>
						<a class="nav-link text-muted" aria-current="page" href="mypage.mall?index=orderList">
							<i class="fi fi-rr-document icon"></i>
							주문내역
						</a>
						<a class="nav-link text-muted" aria-current="page" href="interest.mall">
							<i class="fi fi-rr-heart icon"></i>
							찜한 상품
							<span class="badge bg-primary rounded-pill">${fn:length(ilists)}</span>
						</a>
						<hr>
						<font class="my-2 fw-bold" color="#186E6A">쇼핑</font>
						<a class="nav-link text-muted" aria-current="page" href="#">
							상품 후기
						</a>
						<hr>
						<font class="my-2 fw-bold" color="#186E6A">내 정보관리</font>
						<a class="nav-link text-muted" aria-current="page" href="mypage.mall?index=memberInfoUpdate">
							개인정보수정
						</a>
						<a class="nav-link text-muted" aria-current="page" href="mypage.mall?index=addressInfo">
							배송지 관리
						</a>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-7">
			<div class="card" style="border: 0px">
				<%@ include file="mypage_detail.jsp" %>
			</div>
		</div>
	</div>
</div>

<%@ include file="mall_bottom.jsp"%>