<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<c:choose>
	<c:when test="${index eq null || fn:contains(index, 'orderList')}">
		<div class="col-sm-8 me-auto">
			<div class="card h-100" style="border: 0px">
				<div class="card-body">
					<h5 class="card-title text-primary fw-bolder">주문내역</h5>
					<p class="card-text"></p>
				</div> 
			</div>
		</div> 
	</c:when>
	<c:when test="${fn:contains(index, 'memberInfoUpdate')}">
		<div class="col-sm-6 me-auto">
			<div class="card h-100" style="border: 0px">
				<div class="card-body">
					<h5 class="card-title text-primary fw-bolder">개인정보수정</h5>
					<div class="m-auto w-50 text-center">
						<form:form commandName="member" action="memberUpdate.mb" class="text-muted p-2" enctype="multipart/form-data">
							<p>
								<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
								이미지 : <img src="<%=img%>${member.image}" style="width:100" class="mt-1"/><br>
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
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'addressInfo')}">
		<div class="col-sm-8 me-auto">
			<div class="card h-50" style="border: 0px">
				<div class="card-body">
					<div class="navbar">
						<h5 class="card-title text-primary fw-bolder ms-2">배송지관리</h5>
						<button type="button" class="btn btn-light" onClick="location='mypage.mb?index=insertAddress'"><i class="fi fi-rr-plus-small"></i>등록</button>
					</div>
					<c:if test="${fn:length(addressLists) == 0}">
						<div class="container my-4 text-center">
							현재 등록된 배송지가 없습니다.
						</div>
					</c:if>
					<c:if test="${fn:length(addressLists) > 0}">
						<table class="text-center mx-auto address my-4">
							<tr>
								<th>번호</th>
								<th>별칭</th>
								<th>주소</th>
								<th>우편번호</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							<c:set var="num" value="1"/>
							<c:forEach var="address" items="${addressLists}">
								<tr>
									<td>${num}</td>
									<td>${address.alias}</td>
									<td>${address.addr1}&nbsp;${address.addr2}</td>
									<td>${address.post}</td>
									<td><input type="button" class="btn btn-sm btn-light" value="수정" onClick="location='mypage.mb?index=updateAddress&anum=${address.anum}'"></td>
									<td><input type="button" class="btn btn-sm btn-light" value="삭제" onClick="location='deleteAddress.mb?anum=${address.anum}'"></td>
								</tr>
								<c:set var="num" value="${num+1}"/>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'insertAddress')}">
		<div class="col-sm-8 me-auto">
			<div class="card h-100" style="border: 0px">
				<div class="card-body mt-3">
					<h4 class="card-title text-primary text-center fw-bolder my-3">배송지 등록하기</h4>
					<div class="card card-body w-75 mx-auto my-4">
						<form:form action="insertAddress.mb" commandName="address">
							<input type="hidden" name="id" value="${loginInfo.id}">
							<div class="container mx-auto my-3">
								<p>
									별칭 :
									<input type="text" name="alias" placeholder="ex)집, 회사 등">
								</p>
								<p>
									주소 : <br>
									<input type="text" name="post" id="sample6_postcode" placeholder="우편번호" class="my-1">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" name="addr1" id="sample6_address" placeholder="주소" class="mb-1"><br>
									<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소">
									<input type="text" id="sample6_extraAddress" placeholder="참고항목">
								</p>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-sm btn-light" onClick="location='mypage.mb?index=addressInfo'">목록보기</button>
								<button type="submit" class="btn btn-sm btn-primary">등록</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'updateAddress')}">
		<div class="col-sm-8 me-auto">
			<div class="card h-100" style="border: 0px">
				<div class="card-body mt-3">
					<h4 class="card-title text-primary text-center fw-bolder my-3">배송지 수정하기</h4>
					<div class="card card-body w-75 mx-auto my-4">
						<form:form action="updateAddress.mb" commandName="address">
							<input type="hidden" name="anum" value="${address.anum}">
							<div class="container mx-auto my-3">
								<p>
									별칭 :
									<input type="text" name="alias" value="${address.alias}">
								</p>
								<p>
									주소 : <br>
									<input type="text" name="post" value="${address.post}" id="sample6_postcode" placeholder="우편번호" class="my-1">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" value="${address.addr1}" name="addr1" id="sample6_address" placeholder="주소" class="mb-1"><br>
									<input type="text" value="${address.addr2}" name="addr2" id="sample6_detailAddress" placeholder="상세주소">
									<input type="text" id="sample6_extraAddress" placeholder="참고항목">
								</p>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-sm btn-light" onClick="location='mypage.mb?index=addressInfo'">목록보기</button>
								<button type="submit" class="btn btn-sm btn-primary">수정</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</c:when>
</c:choose>