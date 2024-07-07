<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:choose>
	<c:when test="${index eq null}">
		<div class="card-body">
			<h5 class="card-title text-primary fw-bolder">원하시는 카테고리를 선택하세요.</h5>
		</div>
	</c:when>
</c:choose>