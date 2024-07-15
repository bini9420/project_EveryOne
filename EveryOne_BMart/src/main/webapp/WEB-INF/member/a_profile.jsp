<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/a_top.jsp"%>

<c:choose>
	<c:when test="${index eq null || fn:contains(index, 'orderList')}">
		<div class="card h-100" style="border: 0px">
			<div class="card-body">
				<h5 class="card-title text-primary fw-bolder">주문내역</h5>
				<p class="card-text"></p>
			</div> 
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'memberInfoUpdate')}">
		<div class="card h-100 pe-4" style="border: 0px">
			<div class="card-body">
				<h5 class="card-title text-primary fw-bolder">개인정보수정</h5>
				<div class="my-5">
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
							<% String[] phone = {"010","011"}; %>
							<select name="phone1">
								<option value="">선택 안 함
								<c:forEach var="p" items="<%=phone%>">
									<option value="${p}" <c:if test="${p eq member.phone1}">selected</c:if>>${p}
								</c:forEach>
							</select> - 
							<input type="text" name="phone2" value="${member.phone2}" style="width: 70"> - 
							<input type="text" name="phone3" value="${member.phone3}" style="width: 70">
						</p>
						<p>
							이메일 : 
							<input type="text" name="email1" value="${member.email1}" style="width: 150"> @ 
							<% String[] email = {"naver.com","gmail.com","daum.net","hanmail.net"}; %>
							<select name="email2">
								<option value="">선택 안 함
								<c:forEach var="e" items="<%=email%>">
									<option value="${e}" <c:if test="${e eq member.email2}">selected</c:if>>${e}
								</c:forEach>
							</select>
						</p>
						<input type="submit" value="수정하기" class="btn btn-outline-primary mt-2">
					</form:form>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'addressInfo')}">
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
	</c:when>
	<c:when test="${fn:contains(index, 'insertAddress')}">
		<div class="card h-75" style="border: 0px">
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
	</c:when>
	<c:when test="${fn:contains(index, 'updateAddress')}">
		<div class="card h-75" style="border: 0px">
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
	</c:when>
	<c:when test="${fn:contains(index, 'review')}">
		<div class="card h-100" style="border: 0px">
			<div class="card-body text-center">
				<h5 class="card-title text-primary fw-bolder my-3">작성한 상품 후기</h5>
				<div class="mx-auto text-center mt-3">
					<c:if test="${fn:length(rdetail) > 0}">
						<table class="mx-auto my-4 bg-white w-50">
				    		<c:forEach var="rd" items="${rdetail}">
				    			<tr style="border-top: 1px solid gray">
				    				<td class="pt-3 ps-4">
										<c:forEach var="i" begin="1" end="${5-rd.score}">
											<i class="fi fi-sr-star text-light"></i>
										</c:forEach>
										<c:forEach var="i" begin="1" end="${rd.score}">
											<i class="fi fi-sr-star" style="color: yellow"></i>
										</c:forEach>
										
										<input type="button" class="btn btn-sm btn-light" value="수정" onClick="location='mypage.mb?index=updateReview&rnum=${rd.rnum}&pageNumber=${pageInfo.pageNumber}'">
										<input type="button" class="btn btn-sm btn-light" value="삭제" onClick="location='deleteReview.mb?rnum=${rd.rnum}&pageNumber=${pageInfo.pageNumber}'">
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="pt-2 ps-4 text-muted">
				    					${rd.pname}
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="pt-2 ps-4">
				    					<c:if test="${rd.image ne null}">
						    				<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
						    				<img src="<%=img%>${rd.image}" style="width: 80">
						    			</c:if>
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="pt-2 ps-4">${rd.rcomment}</td>
				    			</tr>
				    			<tr style="border-bottom: 1px solid gray">
				    				<td class="pt-1 ps-4 pb-3 text-muted">
				    					<fmt:parseDate var="date" value="${rd.rdate}" pattern="yyyy-MM-dd"/>
				    					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
				    				</td>
				    			</tr>
							</c:forEach>
				    	</table>
				    	${pageInfo.pagingHtml }
			    	</c:if>
			    	<c:if test="${fn:length(rdetail) == 0}">
			    		작성한 상품 후기가 없습니다.
			    	</c:if>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${fn:contains(index, 'updateReview')}">
		<div class="card h-75" style="border: 0px">
			<div class="card-body">
				<div class="my-auto text-center">
					<h5 class="card-title text-primary fw-bolder ms-2">상품 후기 수정</h5>
					<div class="container">
						<form action="updateReview.mb">
							<input type="hidden" name="rnum" value="${rdb.rnum}">
							<input type="hidden" name="pageNumber" value="${pageNumber}">
							<table class="mx-auto mt-3">
								<tr>
									<th>상품명</th>
									<td class="p-2"><input type="text" value="${rdb.pname}" disabled style="width: 270"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td class="p-2"><input type="text" value="${rdb.id}" disabled></td>
								</tr>
								<tr>
									<th>별점</th>
									<td class="p-2">
										<c:forEach var="i" begin="1" end="5">
											<input type="radio" name="score" value="${i}" <c:if test="${i eq rdb.score}">checked</c:if>>${i}점
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td class="p-2">
										<textarea rows="7" cols="50" name="rcomment">${rdb.rcomment}</textarea>
									</td>
								</tr>
								<tr>
									<td class="text-center p-2" colspan="2">
										<input type="button" class="btn btn-sm btn-light" value="뒤로가기" onClick="location='mypage.mb?index=review&id=${loginInfo.id}&pageNumber=${pageNumber}'">
										<input type="submit" class="btn btn-sm btn-primary" value="수정하기">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:when>
</c:choose>