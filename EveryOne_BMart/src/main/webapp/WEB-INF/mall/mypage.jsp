<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<div class="container my-5">
	<div class="card w-100 p-4" style="border: 0px; background:rgba(252, 250, 247, 0.85)">
		<div class="fw-bolder fs-5"><font class="text-primary fw-bolder fs-5">반가워요!</font> ${loginInfo.name}님</div>
		<hr>
		<div>
			<button class="btn btn-outline-secondary" type="button" onClick="#">개인정보 수정</button>
			<button class="btn btn-outline-secondary" type="button" onClick="#">배송지 관리</button>
		</div>
		<nav class="navbar navbar-expand-lg mx-auto">
			<div class="container px-4 py-1">
				<ul class="navbar-nav">
					<li class="nav-item mx-4">
						<a class="nav-link" aria-current="page" href="#">
							<i class="fi fi-rr-document icon"></i>
							주문내역
						</a>
					</li>
					<li class="nav-item mx-4" >
						<a class="nav-link text-info" aria-current="page" href="interest.mall">
							<i class="fi fi-rr-heart icon text-info"></i>
							찜한 상품
						</a>
					</li>
					<li class="nav-item mx-4" >
						<a class="nav-link" aria-current="page" href="#">
							<i class="fi fi-rr-member-list icon"></i>
							리뷰
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div>
<%@ include file="mall_bottom.jsp"%>