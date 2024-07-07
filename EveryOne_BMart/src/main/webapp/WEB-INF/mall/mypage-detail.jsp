<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:choose>
	<c:when test="${index eq null || fn:contains(index, 'orderList')}">
		<div class="card-body">
			<h5 class="card-title text-primary fw-bolder">주문내역</h5>
			<p class="card-text"></p>
			<a href="#" class="btn btn-primary">Go somewhere</a>
		</div>
	</c:when>
</c:choose>