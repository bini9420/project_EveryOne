<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String path = request.getContextPath(); %>

<style type="text/css">
	table{
		width: 100%;
		margin: auto;
		border: 0px;
		color: #414141;
		text-align: center;
	}
	th{
		padding: 15px;
	}
	td{
		padding: 7px;
		width: 20px;
	}
	.pname_Td{
		width: 50px;
	}
	.padrentDiv{
		margin-top: 50px;
		position: relative;
	}
	.productImg_Td{
		width: 10px;
	}
	.orderDiv{
		border: 3px solid #f0f0f0;
		border-radius: 10px;
		width: 100%;
		margin: auto;
	}
	.reviewTd{
		text-align: center;
	}
	.reviewBtn{
		border: 2px solid #2e59d9;
		border-radius: 5px;
		color: #2e59d9;
		width: 100px;
		height: 35px;
		font-size: 15px;
		background-color: inherit;
	}
	.orderCancel, .orderModify{
		border: 2px solid #3d404d;
		border-radius: 5px;
		color: #3d404d;
		width: 100px;
		height: 35px;
		font-size: 15px;
		background-color: inherit;
	}
	.titleDiv{
		margin-top: 50px;
	}
	.titleDiv p{
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		color: #414141;
	}
	
	.productImg_Td img{
		width: 50px;
		height: 50px;
	}
	.reviewTd input{
		font-weight: bold;
	}
    .elements_div {
        display: none;
        padding: 10px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
    }
	.product_Th{
		text-align: center;
	}
	#showMoreBtn{
		border: 0px;
		border-radius: 5px;
		background-color: #3c3c3c;
		color: white;	
		font-weight: bold;
		width: 150px;
		height: 50px;
		font-size: 27px;
	}
</style>

<script type="text/javascript" src="<%=path%>/resources/js/jquery.js"></script>
<script type="text/javascript">
<script type="text/javascript" src="<%=path%>/resources/js/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // 문서가 준비되면 실행될 코드
        $('.ronum').each(function() {
            var ronum = $(this).val();
            
            // i.onum과 rlist 값 비교
            if (ronum !== '0') {
                $(this).nextAll('.reviewBtn:first').val('리뷰완료').prop('disabled', true); // 버튼을 리뷰완료로 변경하고 비활성화
            }
        });
        
        var page = 1;
        var rowsPerPage = 5;
        var totalProducts = ${fn:length(olist)};
        
        var itemsPerPage = 5;
        var $productRows = $('.second_tr'); // 품목 행 선택
        var $productRows2 = $('.first_tr'); // 품목 행 선택
        var $reviewTd= $('.reviewTd'); // 품목 행 선택
        
        showHideProductRows(itemsPerPage);
        
        $('#showMoreBtn').click(function(event) {
            event.preventDefault();
            itemsPerPage += 5; // 예시로 5개씩 더 보이도록 증가
            showHideProductRows(itemsPerPage);
        });
        
        function showHideProductRows(itemsToShow) {
            $productRows.each(function(index) {
                if (index < itemsToShow) {
                    $(this).show(); // 행을 보이게 처리
                } else {
                    $(this).hide(); // 행을 숨기게 처리
                }
            });
            $productRows2.each(function(index) {
                if (index < itemsToShow) {
                    $(this).show(); // 행을 보이게 처리
                } else {
                    $(this).hide(); // 행을 숨기게 처리
                }
            });
            $reviewTd.each(function(index) {
                if (index < itemsToShow) {
                    $(this).show(); // 행을 보이게 처리
                } else {
                    $(this).hide(); // 행을 숨기게 처리
                }
            });
            
            if ($productRows.length > itemsToShow) {
                $('#showMoreBtn').show(); // 더보기 버튼을 보이게 처리
            } else {
                $('#showMoreBtn').hide(); // 더 이상 행이 없으면 더보기 버튼을 숨기게 처리
            }
        }
    });

    function openReviewPopup(pnum, onum, id, pname) {
        const options = 'width=900, height=300, top=100, left=500, scrollbars=yes';
        const url = 'insertForm.rv?pnum=' + pnum + '&onum=' + onum + '&id=' + id + '&pname=' + pname;
        window.open(url, '_blank', options);
    }

    function deleteOrder(onum, pnum, pamount) {
        location.href = "deleteOrder.mall?onum=" + onum + "&pnum=" + pnum + "&pamount=" + pamount;
    }
</script>

<%@ include file="../common/common.jsp" %>
<c:choose>
	<c:when test="${index eq null || fn:contains(index, 'orderList')}">
		<div class="card h-100" style="border: 0px">
			<div class="card-body">
				<h5 class="card-title text-primary fw-bolder">주문내역</h5>
				<c:if test="${fn:length(olist) > 0}">
					<div class="padrentDiv">
						<div class="orderDiv">
						<form action="insertForm.rv" method="post">
						<table>
							<c:forEach var="i" begin="0" end="${fn:length(olist) - 1}" items="${olist}" step="1" varStatus="status">
							<input type="hidden" name="pnum" value="${i.pnum}">
							<input type="hidden" name="onum" value="${i.onum}">
							<input type="hidden" name="id" value="${i.id}">
								<tr class="first_tr">
									<th class="product_Th" colspan="2">
										상품
									</th>
									<th>
										가격
									</th>
									<th>
										수량
									</th>
									<th>
										결제금액
									</th>
									<th>
										결제일
									</th>
									<th>
										배송현황
									</th>
								</tr>
								<tr class="second_tr">
									<td class="productImg_Td">
										<img src="<%=path%>/resources/img/${plist[status.index].pimage}">
									</td>
									<td class="pname_Td">
										<span>${plist[status.index].pname}</span>
									</td>
									<td>
										<fmt:formatNumber value="${plist[status.index].price}" pattern="###,###"></fmt:formatNumber>원
									</td>
									<td>
										${i.pamount}개
									</td>
									<td>
										<fmt:formatNumber value="${i.price}" pattern="###,###"></fmt:formatNumber>원
									</td>
									<td class="orderdate">
										<fmt:parseDate pattern="yyyy-MM-dd" value="${i.orderdate}" var="ymd"/> 
										<fmt:formatDate pattern="yyyy-MM-dd" value="${ymd}" /> 
									</td>
									<td class="status">
										<c:choose>
											<c:when test="${i.status==0}">
												배송 준비 중
											</c:when>
											<c:when test="${i.status==1}">
												배송 시작
											</c:when>
											<c:otherwise>
												배송 완료
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td colspan="7" class="reviewTd">
										<input type="hidden" class="oonum" id="oonum" value="${i.onum}">
										<input type="hidden" class="ronum" id="ronum" value="${rlist[status.index]}">
										<input type="button" class="reviewBtn" id="reviewBtn" value="리뷰작성" onclick="openReviewPopup(${i.pnum}, ${i.onum}, '${i.id}', '${plist[status.index].pname}')">
										<input type="button" class="orderCancel" id="orderCancel" value="주문취소" onclick="deleteOrder(${i.onum},${i.pnum},${i.pamount})">
									</td>
								</tr>
							</c:forEach>
							    <tr>
									<td colspan="7" class="orderTd">
									    <button id="showMoreBtn" style="display: none;">더보기</button>
									</td>
					   			</tr>
							</table>
						</form>
						</div>
					</div>
				</c:if>
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
						<p class="mb-4">
							<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
							<img src="<%=img%>${member.image}" style="width:150" class="mt-1"/><br>
							<!-- 새로 upload -->
							<input type="file" name="upload" class="my-2 form-control" style="width: 300; height: 38">
							<input type="hidden" name="upload2" value="${member.image}">
						</p>
						<p class="row mb-4">
							아이디 : <input type="text" value="${member.id}" class="form-control w-50 ms-3" disabled>
							<input type="hidden" name="id" value="${member.id}">
						</p>
						<p class="row mb-4">
							비밀번호 : <input type="text" class="form-control w-50 ms-3" name="password" value="${member.password}">
						</p>
						<p class="row mb-4">
							이름 : <input type="text" class="form-control w-50 ms-3" name="name" value="${member.name}">
						</p>
						<p class="row mb-4">
							핸드폰번호 : 
							<% String[] phone = {"010","011"}; %>
							<select name="phone1" class="form-select w-25 mx-2">
								<option value="">선택 안 함
								<c:forEach var="p" items="<%=phone%>">
									<option value="${p}" <c:if test="${p eq member.phone1}">selected</c:if>>${p}
								</c:forEach>
							</select> - 
							<input type="text" class="form-control w-25 mx-1" name="phone2" value="${member.phone2}" style="width: 70"> - 
							<input type="text" class="form-control w-25 mx-1" name="phone3" value="${member.phone3}" style="width: 70">
						</p>
						<p class="row mb-4">
							이메일 : 
							<input type="text" class="form-control w-25 mx-3" name="email1" value="${member.email1}" style="width: 150"> @ 
							<% String[] email = {"naver.com","gmail.com","daum.net","hanmail.net"}; %>
							<select name="email2" class="form-select w-25 mx-3">
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