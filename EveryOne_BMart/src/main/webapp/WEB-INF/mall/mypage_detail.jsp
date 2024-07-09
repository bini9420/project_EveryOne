<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:choose>
	<c:when test="${index eq null || fn:contains(index, 'orderList')}">
		<div class="card-body">
			<h5 class="card-title text-primary fw-bolder">주문내역</h5>
			<p class="card-text"></p>
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'memberInfoUpdate')}">
		<div class="card-body">
			<h5 class="card-title text-primary fw-bolder">개인정보수정</h5>
			<form:form commandName="member" action="memberUpdate.mb" class="text-muted p-2" enctype="multipart/form-data">
				<p>
					<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
					이미지 : <br>
					<img src="<%=img%>${member.image}" style="width:100" class="mt-1"/><br>
					<!-- 새로 upload -->
					<input type="file" name="upload" class="my-2">
					<input type="hidden" name="upload2" value="${member.image}">
				</p>
				<p>
					아이디 : <input type="text" value="${member.id}" disabled>
					<input type="hidden" name="id" value="${member.id}">
				</p>
				<p>
					비밀번호 : <input type="text" name="password" value="${member.password}">
				</p>
				<p>
					이름 : <input type="text" name="name" value="${member.name}">
				</p>
				<p>
					핸드폰번호 : 
					<input type="text" name="phone" value="${member.phone}" placeholder="하이픈(-)을 포함해서 입력해주세요.">
				</p>
				<p>
					이메일 : 
					<input type="text" name="email" value="${member.email}">
				</p>
				<input type="submit" value="수정하기" class="btn btn-outline-primary mt-2">
			</form:form>
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'addressInfo')}">
		<div class="card-body">
			<div class="navbar">
				<h5 class="card-title text-primary fw-bolder ms-2">배송지관리</h5>
				<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#myModal"><i class="fi fi-rr-plus-small"></i>등록</button>
			</div>
			<c:if test="${fn:length(alists) == 0}">
				<div class="container my-4 text-center">
					현재 등록된 배송지가 없습니다.
				</div>
			</c:if>
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">배송지 등록하기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form:form action="insertAddress.mb" commandName="address">
								<input type="hidden" name="id" value="${loginInfo.id}">
								<table class="mx-auto desTable my-3">
									<tr>
										<td class="p-2">별칭</td>
										<td><input type="text" name="alias" placeholder="ex)집, 회사 등"></td>
									</tr>
									<tr>
										<td>주소</td>
										<td>
											<input type="text" name="post" id="sample6_postcode" placeholder="우편번호" class="mb-1">
											<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" name="addr1" id="sample6_address" placeholder="주소" class="mb-1"><br>
											<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소">
											<input type="text" id="sample6_extraAddress" placeholder="참고항목">
										</td>
									</tr>
								</table>
								<div class="text-center">
									<button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
</c:choose>