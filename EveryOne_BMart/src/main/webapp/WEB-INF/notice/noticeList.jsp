<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="cs_top.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('.title-link').on('click', function(e) {
			e.preventDefault();
			var nnum = $(this).data('nnum');
			var contentArea = $('#content-' + nnum);

			if (contentArea.is(':visible')) {
				contentArea.slideUp();
			} else {
				$('.content-area').slideUp();
				fetchContent(nnum, contentArea, $(this).data('pagenumber'), $(this).data('whatcolumn'), $(this).data('keyword'));
			}
		});

		function fetchContent(nnum, contentArea, pageNumber, whatColumn, keyword) {
			$.ajax({
				url: 'content.nt',
				type: 'GET',
				data: {
					nnum: nnum,
					pageNumber: pageNumber,
					whatColumn: whatColumn,
					keyword: keyword,
					_: new Date().getTime() // cache-busting parameter
				},
				success: function(response) {
					contentArea.html(response).slideDown();
					enableAutoRefresh();
				},
				error: function(xhr, status, error) {
					console.log('Error loading content');
					console.log('Status: ' + status);
					console.log('Error: ' + error);
					alert('Error loading content');
				}
			});
		}

		function autoRefresh() {
			$('.content-area:visible').each(function() {
				var contentArea = $(this);
				var nnum = contentArea.attr('id').split('-')[1];
				var titleLink = $('.title-link[data-nnum="' + nnum + '"]');
				fetchContent(nnum, contentArea, titleLink.data('pagenumber'), titleLink.data('whatcolumn'), titleLink.data('keyword'));
			});
		}

		let autoRefreshInterval;

		function enableAutoRefresh() {
			if (!autoRefreshInterval) {
				autoRefreshInterval = setInterval(autoRefresh, 30000); // Refresh every 30 seconds
			}
		}

		function disableAutoRefresh() {
			if (autoRefreshInterval) {
				clearInterval(autoRefreshInterval);
				autoRefreshInterval = null;
			}
		}

		// 초기 로딩 시 autoRefresh를 비활성화합니다.
		disableAutoRefresh();
	});

	function Delete(nnum, pageNumber) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = 'delete.nt?nnum=' + nnum + "&pageNumber=" + pageNumber;
		}
	}

	function goUpdate(nnum, pageNumber) {
		location.href = "update.nt?nnum=" + nnum + "&pageNumber=" + pageNumber;
	}
</script>

<div class="mx-auto h-75 my-5" style="width:90%">
	<div class="row">
		<div class="col-sm-3">
			<div class="card bg-light">
				<div class="card-body">
					<nav class="nav flex-column">
						<div class="search-form">
							<form action="list.nt" method="get">
								<input type="hidden" name="whatColumn" value="subject">
								<br> 
								<input type="text" name="keyword" placeholder="검색어를 입력하세요"> 
								<input type="submit" value="검색">
							</form>
						</div>
						
						<hr>
						<font class="my-2" color="#186E6A">배민 B마트</font> 
						<a class="nav-link text-muted" aria-current="page" href="list.nt?whatColumn=category&keyword=FAQ"> FAQ </a> 
						<a class="nav-link text-muted" aria-current="page" href="list.nt?whatColumn=category&keyword=공지사항"> 공지사항 </a>
						
						<hr>
						<a class="nav-link text-primary" aria-current="page" href="main.mall"> 배민 B마트로 돌아가기 </a>
						<c:if test="${loginInfo.id == 'admin'}">
							<a class="nav-link text-primary" aria-current="page" href="adminMain.ad"> 관리자페이지로 돌아가기 </a>
						</c:if>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-9">
			<div class="card bg-light p-5" style="border: 0px">
				<div class="containerN">
					<h2 class="board-title">공지사항</h2>
					<c:if test="${loginInfo.id == 'admin'}">
						<div class="text-end my-2">
							<button class='plus_btn'
								onclick="location.href='insert.nt?category=${param.keyword}'">추가</button>
						</div>
					</c:if>
					<table class="board-table">
						<thead>
							<tr>
								<th width="10%">구분</th>
								<th width="50%">제목</th>
								<th width="20%">작성일</th>
								<c:if test="${loginInfo.id == 'admin'}">
									<th>삭제</th>
									<th>수정</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${pageInfo.totalCount == 0}">
									<tr>
										<td colspan="5" class="no-content">작성된 공지사항이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="nty" items="${lists2}">
										<tr>
											<td align="center">${nty.category}</td>
											<td align="left">
												<a href="#" class="title-link" data-nnum="${nty.nnum}" data-pagenumber="${pageInfo.pageNumber}"
													data-whatcolumn="${param.whatColumn}" data-keyword="${param.keyword}" style="color: #00A2E8">[중요]${nty.subject}</a>
												<div id="content-${nty.nnum}" class="content-area"></div>
											</td>
											<td align="center">
												<fmt:formatDate value="${nty.ndate}" pattern="yyyy-MM-dd" />
											</td>
											<c:if test="${loginInfo.id == 'admin'}">
												<td>
													<button type="button" class='plus_btn' onClick="Delete('${nty.nnum}','${pageInfo.pageNumber}')">삭제</button>
												</td>
												<td>
													<button type="button" class='plus_btn' onClick="goUpdate('${nty.nnum}','${pageInfo.pageNumber}')">수정</button>
												</td>
											</c:if>
										</tr>
									</c:forEach>
									<c:forEach var="nt" items="${lists}">
										<tr>
											<td align="center">${nt.category}</td>
											<td align="left">
												<a href="#" class="title-link" data-nnum="${nt.nnum}" data-pagenumber="${pageInfo.pageNumber}"
													data-whatcolumn="${param.whatColumn}" data-keyword="${param.keyword}">${nt.subject}</a>
												<div id="content-${nt.nnum}" class="content-area"></div>
											</td>
											<td align="center">
												<fmt:formatDate value="${nt.ndate}" pattern="yyyy-MM-dd" />
											</td>
											<c:if test="${loginInfo.id == 'admin'}">
												<td>
													<button type="button" class='plus_btn' onClick="Delete('${nt.nnum}','${pageInfo.pageNumber}')">삭제</button>
												</td>
												<td>
													<button type="button" class='plus_btn' onClick="goUpdate('${nt.nnum}','${pageInfo.pageNumber}')">수정</button>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<center>${pageInfo.pagingHtml }</center>
					<div class="pagination">
						<c:if test="${count > 0}">
							<%
							int pageCount = (Integer) request.getAttribute("count") / (Integer) request.getAttribute("pageSize")
									+ ((Integer) request.getAttribute("count") % (Integer) request.getAttribute("pageSize") == 0 ? 0 : 1);
							int pageBlock = 10;
							int startPage = ((Integer) request.getAttribute("currentPage") - 1) / pageBlock * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;
							if (endPage > pageCount) {
								endPage = pageCount;
							}
							%>
							<c:if test="${startPage > 1}">
								<a href="list.nt?pageNum=${startPage-1}">[이전]</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<a href="list.nt?pageNum=${i}" class="${pageInfo.currentPage == i ? 'active' : ''}">[${i}]</a>
							</c:forEach>
							<c:if test="${endPage < pageCount}">
								<a href="list.nt?pageNum=${startPage+pageBlock}">[다음]</a>
							</c:if>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<%@ include file="cs_bottom.jsp"%>
